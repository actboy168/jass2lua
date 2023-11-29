local lines
local jass
local comments
local state
local tab_count

local current_function
local get_exp
local add_lines

local function insert_one_line(n, str, ignore_tab)
    local tab = ignore_tab and 0 or tab_count
    if tab > 0 then
        str = ('\t'):rep(tab) .. str
    end
    if lines[n] and lines[n] ~= '' then
        print('该行已被使用:', n, lines[n], str)
        return
    end
    if n > #lines+1 then
        for i = #lines+1, n-1 do
            if comments[i] then
                lines[i] = ('%s--%s'):format(('\t'):rep(tab), comments[i])
            else
                lines[i] = ''
            end
        end
    end
    if comments[n] then
        lines[n] = ('%s --%s'):format(str, comments[n])
    else
        lines[n] = str
    end
end

local function insert_line(n, str)
    local start = 1
    local i = 0
    while start <= #str do
        local pos = str:find('[\r\n]', start) or #str+1
        local line = str:sub(start, pos-1)
        if str:sub(pos, pos+1) == '\r\n' then
            start = pos+2
        else
            start = pos+1
        end
        insert_one_line(n + i, line, i > 0)
        i = i + 1
    end
end

local function insert_comments(n, str)
    if lines[n] then
        return
    end
    for i = #lines+1, n-1 do
        lines[i] = ''
    end
    lines[n] = ('--%s'):format(str)
end

local function struct_start()
    tab_count = tab_count + 1
end

local function struct_end()
    tab_count = tab_count - 1
end

local function int32(int)
    int = int & 0xFFFFFFFF
    if int & 0x80000000 == 0 then
        return int
    else
        return - (((~ int) & 0xFFFFFFFF) + 1)
    end
end

local function get_integer(exp)
    return int32(exp.value)
end

local function get_real(exp)
    local real = exp.value:gsub('%s', '')
    local int, float = math.modf(real)
    return int32(int) + float
end

local key_name = {'and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 'function', 'goto', 'if', 'in', 'local', 'nil', 'not', 'or', 'repeat', 'return', 'then', 'true', 'until', 'while'}
for _, name in ipairs(key_name) do
    key_name[name] = name .. '_'
end
local function get_available_name(name)
    return key_name[name] or name
end

local function get_string(exp)
    local str = exp.value
    local lines = {}
    local start = 1
    while start <= #str do
        local pos = str:find('[\r\n]', start) or #str+1
        local line = str:sub(start, pos-1)
        if str:sub(pos, pos+1) == '\r\n' then
            start = pos+2
        else
            start = pos+1
        end
        lines[#lines+1] = line
    end
    return ('"%s"'):format(table.concat(lines, '\\\r\n'))
end

local function get_boolean(exp)
    if exp.value == true then
        return 'true'
    elseif exp.value == false then
        return 'false'
    end
end

local function is_arg(name)
    if not current_function or not current_function.args then
        return false
    end
    return current_function.args[name]
end

local function get_var_name(name)
    return get_available_name(name)
end

local function get_var(exp)
    return get_var_name(exp.name)
end

local function get_vari(exp)
    return ('%s[%s]'):format(get_var_name(exp.name), get_exp(exp[1]))
end

local function get_function_name(name)
    return get_available_name(name)
end

local function get_call(exp)
    local args = {}
    for i, sub_exp in ipairs(exp) do
        args[i] = get_exp(sub_exp)
    end
    return ('%s(%s)'):format(get_function_name(exp.name), table.concat(args, ', '))
end

local function must_string(exp)
    local type = exp.type
    if type == 'string' or type == '+' then
        return get_exp(exp)
    end
    return ('(%s or "")'):format(get_exp(exp))
end

local function get_add(exp)
    if exp.vtype == 'integer' or exp.vtype == 'real' then
        return ('%s + %s'):format(get_exp(exp[1], '+', 1), get_exp(exp[2], '+', 2))
    elseif exp.vtype == 'string' then
        return ('%s .. %s'):format(must_string(exp[1]), must_string(exp[2]))
    end
    error(('表达式类型错误:%s %s'):format(exp.type, exp.vtype))
end

local function get_sub(exp)
    return ('%s - %s'):format(get_exp(exp[1], '-', 1), get_exp(exp[2], '-', 2))
end

local function get_mul(exp)
    return ('%s * %s'):format(get_exp(exp[1], '*', 1), get_exp(exp[2], '*', 2))
end

local function get_div(exp)
    if exp.vtype == 'integer' then
        return ('%s // %s'):format(get_exp(exp[1], '//', 1), get_exp(exp[2], '//', 2))
    elseif exp.vtype == 'real' then
        return ('%s / %s'):format(get_exp(exp[1], '/', 1), get_exp(exp[2], '/', 2))
    end
    error(('表达式类型错误:%s %s'):format(exp.type, exp.vtype))
end

local function get_neg(exp)
    return (' - %s'):format(get_exp(exp[1], 'neg', 1))
end

local function get_equal(exp)
    return ('%s == %s'):format(get_exp(exp[1], '==', 1), get_exp(exp[2], '==', 2))
end

local function get_unequal(exp)
    exp.type = '~='
    return ('%s ~= %s'):format(get_exp(exp[1], '~=', 1), get_exp(exp[2], '~=', 2))
end

local function get_gt(exp)
    return ('%s > %s'):format(get_exp(exp[1], '>', 1), get_exp(exp[2], '>', 2))
end

local function get_ge(exp)
    return ('%s >= %s'):format(get_exp(exp[1], '>=', 1), get_exp(exp[2], '>=', 2))
end

local function get_lt(exp)
    return ('%s < %s'):format(get_exp(exp[1], '<', 1), get_exp(exp[2], '<', 2))
end

local function get_le(exp)
    return ('%s <= %s'):format(get_exp(exp[1], '<=', 1), get_exp(exp[2], '<=', 2))
end

local function get_and(exp)
    return ('%s and %s'):format(get_exp(exp[1], 'and', 1), get_exp(exp[2], 'and', 2))
end

local function get_or(exp)
    return ('%s or %s'):format(get_exp(exp[1], 'or', 1), get_exp(exp[2], 'or', 2))
end

local function get_not(exp)
    return ('not %s'):format(get_exp(exp[1], 'not', 1))
end

local function get_code(exp)
    exp.type = 'var'
    return get_function_name(exp.name)
end

local priority = {
{'or'},
{'and'},
{'<', '>', '<=', '>=', '~=', '=='},
{'|'},
{'~'},
{'&'},
{'<<', '>>'},
{'..'},
{'+', '-'},
{'*', '/', '//', '%'},
{'not', '#', 'neg', 'bnot'},
{'^'},
}

local op_level
local function get_op_level(op)
    if not op_level then
        op_level = {}
        for lv, ops in ipairs(priority) do
            for _, op in ipairs(ops) do
                op_level[op] = lv
            end
        end
    end
    return op_level[op]
end

local function need_paren(op1, op2, pos)
    if not op2 then
        return false
    end
    local lv1, lv2 = get_op_level(op1), get_op_level(op2)
    if not lv1 then
        return false
    end
    if pos == 1 then
        return lv1 < lv2
    elseif pos == 2 then
        return lv1 <= lv2
    end
end

function get_exp(exp, op, pos)
    if not exp then
        return nil
    end
    local value
    if exp.type == 'null' then
        value = 'nil'
    elseif exp.type == 'integer' then
        value = get_integer(exp)
    elseif exp.type == 'real' then
        value = get_real(exp)
    elseif exp.type == 'string' then
        value = get_string(exp)
    elseif exp.type == 'boolean' then
        value = get_boolean(exp)
    elseif exp.type == 'var' then
        value = get_var(exp)
    elseif exp.type == 'vari' then
        value = get_vari(exp)
    elseif exp.type == 'call' then
        value = get_call(exp)
    elseif exp.type == '+' then
        value = get_add(exp)
    elseif exp.type == '-' then
        value = get_sub(exp)
    elseif exp.type == '*' then
        value = get_mul(exp)
    elseif exp.type == '/' then
        value = get_div(exp)
    elseif exp.type == 'neg' then
        value = get_neg(exp)
    elseif exp.type == '==' then
        value = get_equal(exp)
    elseif exp.type == '!=' then
        value = get_unequal(exp)
    elseif exp.type == '>' then
        value = get_gt(exp)
    elseif exp.type == '<' then
        value = get_lt(exp)
    elseif exp.type == '>=' then
        value = get_ge(exp)
    elseif exp.type == '<=' then
        value = get_le(exp)
    elseif exp.type == 'and' then
        value = get_and(exp)
    elseif exp.type == 'or' then
        value = get_or(exp)
    elseif exp.type == 'not' then
        value = get_not(exp)
    elseif exp.type == 'code' then
        value = get_code(exp)
    end
    if value then
        if need_paren(exp.type, op, pos) then
            value = ('(%s)'):format(value)
        end
        return value
    end
    print('未知的表达式类型', exp.type)
    return nil
end

local function base_type(type)
    while state.types[type].extends do
        type = state.types[type].extends
    end
    return type
end

local function new_array(type)
    local default
    local type = base_type(type)
    if type == 'boolean' then
        default = 'false'
    elseif type == 'integer' then
        default = '0'
    elseif type == 'real' then
        default = '0.0'
    else
        default = ''
    end
    return ([[_array_(%s)]]):format(default)
end

local function add_global(global)
    local value = get_exp(global[1])
    if global.array then
        value = new_array(global.type)
    end
    if value then
        insert_line(global.line, ([[%s = %s]]):format(get_available_name(global.name), value))
    else
        insert_line(global.line, ([[%s = %s]]):format(get_available_name(global.name), 'nil'))
    end
end

local function add_globals()
    for _, global in ipairs(jass.globals) do
        add_global(global)
    end
end

local function add_local(loc)
    local value = get_exp(loc[1])
    if loc.array then
        value = new_array(loc.type)
    end
    if value then
        insert_line(loc.line, ('local %s = %s'):format(get_var_name(loc.name), value))
    else
        insert_line(loc.line, ('local %s'):format(get_var_name(loc.name)))
    end
end

local function add_locals(locals)
    if not locals or #locals == 0 then
        return
    end
    for _, loc in ipairs(locals) do
        add_local(loc)
    end
end

local function get_args(line)
    local args = {}
    for i, exp in ipairs(line) do
        args[i] = get_exp(exp)
    end
    return table.concat(args, ', ')
end

local function add_call(line)
    insert_line(line.line, ('%s(%s)'):format(get_function_name(line.name), get_args(line)))
end

local function add_set(line)
    insert_line(line.line, ('%s = %s'):format(get_var_name(line.name), get_exp(line[1])))
end

local function add_seti(line)
    insert_line(line.line, ('%s[%s] = %s'):format(get_var_name(line.name), get_exp(line[1]), get_exp(line[2])))
end

local function add_return(line, last)
    if last then
        if line[1] then
            insert_line(line.line, ('return %s'):format(get_exp(line[1])))
        else
            insert_line(line.line, 'return')
        end
    else
        if line[1] then
            insert_line(line.line, ('do return %s end'):format(get_exp(line[1])))
        else
            insert_line(line.line, 'do return end')
        end
    end
end

local function add_exit(line)
    insert_line(line.line, ('if %s then break end'):format(get_exp(line[1])))
end

local function add_if(data)
    insert_line(data.line, ('if %s then'):format(get_exp(data.condition)))
    struct_start()
    add_lines(data)
    struct_end()
end

local function add_elseif(data)
    insert_line(data.line, ('elseif %s then'):format(get_exp(data.condition)))
    struct_start()
    add_lines(data)
    struct_end()
end

local function add_else(data)
    insert_line(data.line, 'else')
    struct_start()
    add_lines(data)
    struct_end()
end

local function add_ifs(chunk)
    for _, data in ipairs(chunk) do
        if data.type == 'if' then
            add_if(data)
        elseif data.type == 'elseif' then
            add_elseif(data)
        elseif data.type == 'else' then
            add_else(data)
        else
            print('未知的判断类型', data.type)
        end
    end
    insert_line(chunk.endline, 'end')
end

local function add_loop(chunk)
    insert_line(chunk.line, 'for _ in _loop_() do')
    struct_start()
    add_lines(chunk)
    struct_end()
    insert_line(chunk.endline, 'end')
end

function add_lines(chunk)
    for i, line in ipairs(chunk) do
        if line.type == 'call' then
            add_call(line)
        elseif line.type == 'set' then
            add_set(line)
        elseif line.type == 'seti' then
            add_seti(line)
        elseif line.type == 'return' then
            add_return(line, #chunk == i)
        elseif line.type == 'exit' then
            add_exit(line)
        elseif line.type == 'if' then
            add_ifs(line)
        elseif line.type == 'loop' then
            add_loop(line)
        else
            print('未知的代码行类型', line.type)
        end
    end
end

local function add_native(func)
    current_function = func
    insert_line(func.line, ([[%s = _native_'%s']]):format(get_function_name(func.name), func.name))
end

local function add_function(func)
    current_function = func
    local args = {}
    if func.args then
        for i, arg in ipairs(func.args) do
            args[i] = get_available_name(arg.name)
        end
    end
    insert_line(func.line, ([[function %s(%s)]]):format(get_function_name(func.name), table.concat(args, ', ')))
    struct_start()
    add_locals(func.locals)
    add_lines(func)
    struct_end()
    insert_line(func.endline, 'end')
end

local function add_functions()
    for _, func in ipairs(jass.functions) do
        if func.native then
            add_native(func)
        else
            add_function(func)
        end
    end
end

local function add_comments()
    for n, comment in pairs(comments) do
        insert_comments(n, comment)
    end
end

return function (...)
    jass, comments, state = ...
    lines = {}
    tab_count = 0

    add_globals()
    add_functions()
    add_comments()

    lines[#lines+1] = ''

    return table.concat(lines, '\r\n')
end
