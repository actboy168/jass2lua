local grammar = require 'grammar'

local root
local file

local mt = {}
setmetatable(mt, mt)
mt.__index = grammar

function mt:error(str)
    error(('[%s]第[%d]行: %s'):format(file, self.current_line, str))
end

function mt:get_var(name)
    local var = self.globals[name]
             or self.current_function.locals[name]
             or self.current_function.args[name]

    return var
end

function mt:get_function(name)
    return self.functions[name]
end

function mt:get_var_type(exp)
    local var = self:get_var(exp.name)
    return var.type
end

function mt:get_vari_type(exp)
    local var = self:get_var(exp.name)
    self:parse_exp(exp[1], 'integer')
    return var.type
end

function mt:get_call(exp)
    local func = self.functions[exp.name]
    for _, arg in ipairs(exp) do
        self:parse_exp(arg)
    end
    return func.returns or 'null'
end

function mt:get_op(exp)
    local t1 = self:parse_exp(exp[1])
    local t2 = self:parse_exp(exp[2])
    if (t1 == 'integer' or t1 == 'real') and (t2 == 'integer' or t2 == 'real') then
        if t1 == 'real' or t2 == 'real' then
            return 'real'
        else
            return 'integer'
        end
    end
    return nil, t1, t2
end

function mt:get_add(exp)
    local type, t1, t2 = self:get_op(exp)
    if type then
        return type
    end
    if (t1 == 'string' or t1 == 'null') and (t2 == 'string' or t2 == 'null') then
        return 'string'
    end
    self:error(('不能对[%s]与[%s]做加法运算'):format(t1, t2))
end

function mt:get_sub(exp)
    local type, t1, t2 = self:get_op(exp)
    if type then
        return type
    end
    self:error(('不能对[%s]与[%s]做减法运算'):format(t1, t2))
end

function mt:get_mul(exp)
    local type, t1, t2 = self:get_op(exp)
    if type then
        return type
    end
    self:error(('不能对[%s]与[%s]做乘法运算'):format(t1, t2))
end

function mt:get_div(exp)
    local type, t1, t2 = self:get_op(exp)
    if type then
        return type
    end
    self:error(('不能对[%s]与[%s]做除法运算'):format(t1, t2))
end

function mt:get_neg(exp)
    local t = self:parse_exp(exp[1])
    if t == 'real' or t == 'integer' then
        return t
    end
    self:error(('不能对[%s]做负数运算'):format(t))
end

function mt:get_equal(exp)
    local t1 = self:parse_exp(exp[1])
    local t2 = self:parse_exp(exp[2])
    if t1 == 'null' or t2 == 'null' then
        return 'boolean'
    end
    if (t1 == 'integer' or t1 == 'real') and (t2 == 'integer' or t2 == 'real') then
        return 'boolean'
    end
    local b1 = self:base_type(t1)
    local b2 = self:base_type(t2)
    if b1 == b2 then
        return 'boolean'
    end
    self:error(('不能比较[%s]与[%s]是否相等'):format(t1, t2))
end

function mt:get_compare(exp)
    local t1 = self:parse_exp(exp[1])
    local t2 = self:parse_exp(exp[2])
    if (t1 == 'integer' or t1 == 'real') and (t2 == 'integer' or t2 == 'real') then
        return 'boolean'
    end
    self:error(('不能比较[%s]与[%s]的大小'):format(t1, t2))
end

function mt:get_and(exp)
    self:parse_exp(exp[1], 'boolean')
    self:parse_exp(exp[2], 'boolean')
    return 'boolean'
end

function mt:get_or(exp)
    self:parse_exp(exp[1], 'boolean')
    self:parse_exp(exp[2], 'boolean')
    return 'boolean'
end

function mt:get_not(exp)
    self:parse_exp(exp[1], 'boolean')
    return 'boolean'
end

function mt:get_code(exp)
    return 'code'
end

function mt:parse_exp(exp, expect)
    if exp.type == 'null' then
        exp.vtype = 'null'
    elseif exp.type == 'integer' then
        exp.vtype = 'integer'
    elseif exp.type == 'real' then
        exp.vtype = 'real'
    elseif exp.type == 'string' then
        exp.vtype = 'string'
    elseif exp.type == 'boolean' then
        exp.vtype = 'boolean'
    elseif exp.type == 'var' then
        exp.vtype = self:get_var_type(exp)
    elseif exp.type == 'vari' then
        exp.vtype = self:get_vari_type(exp)
    elseif exp.type == 'call' then
        exp.vtype = self:get_call(exp)
    elseif exp.type == '+' then
        exp.vtype = self:get_add(exp)
    elseif exp.type == '-' then
        exp.vtype = self:get_sub(exp)
    elseif exp.type == '*' then
        exp.vtype = self:get_mul(exp)
    elseif exp.type == '/' then
        exp.vtype = self:get_div(exp)
    elseif exp.type == 'neg' then
        exp.vtype = self:get_neg(exp)
    elseif exp.type == 'paren' then
        exp.vtype = self:parse_exp(exp[1])
    elseif exp.type == '==' then
        exp.vtype = self:get_equal(exp)
    elseif exp.type == '!=' then
        exp.vtype = self:get_equal(exp)
    elseif exp.type == '>' then
        exp.vtype = self:get_compare(exp)
    elseif exp.type == '<' then
        exp.vtype = self:get_compare(exp)
    elseif exp.type == '>=' then
        exp.vtype = self:get_compare(exp)
    elseif exp.type == '<=' then
        exp.vtype = self:get_compare(exp)
    elseif exp.type == 'and' then
        exp.vtype = self:get_and(exp)
    elseif exp.type == 'or' then
        exp.vtype = self:get_or(exp)
    elseif exp.type == 'not' then
        exp.vtype = self:get_not(exp)
    elseif exp.type == 'code' then
        exp.vtype = self:get_code(exp)
    else
        print('解析未定义的表达式类型:', exp.type)
    end
    if not exp.vtype then
        print('没有解析到类型:', exp.type)
    end
    return exp.vtype
end

function mt:base_type(type)
    while self.types[type].extends do
        type = self.types[type].extends
    end
    return type
end

function mt:parse_type(data)
    self.current_line = data.line
    if not self.types[data.extends] then
        self:error(('类型[%s]未定义'):format(data.extends))
    end
    if self.types[data.name] and not self.types[data.name].extends then
        self:error('不能重新定义本地类型')
    end
    if self.types[data.name] then
        self:error(('类型[%s]重复定义 --> 已经定义在[%s]第[%d]行'):format(data.name, self.types[data.name].file, self.types[data.name].line))
    end
    self.types[data.name] = data
end

function mt:parse_global(data)
    self.current_line = data.line
    if self.globals[data.name] then
        self:error(('全局变量[%s]重复定义 --> 已经定义在[%s]第[%d]行'):format(data.name, self.globals[data.name].file, self.globals[data.name].line))
    end
    if data.constant and not data[1] then
        self:error('常量必须初始化')
    end
    if not self.types[data.type] then
        self:error(('类型[%s]未定义'):format(data.type))
    end
    if data.array and data[1] then
        self:error('数组不能直接初始化')
    end
    if data[1] then
        self:parse_exp(data[1], data.type)
    end
    table.insert(self.globals, data)
    self.globals[data.name] = data
end

function mt:parse_globals(chunk)
    for _, func in ipairs(self.functions) do
        if not func.native then
            self.current_line = chunk.line
            self:error '全局变量必须在函数前定义'
        end
    end
    for _, data in ipairs(chunk) do
        self:parse_global(data)
    end
end

function mt:parse_arg(data, args)
    args[data.name] = data
end

function mt:parse_args(chunk)
    if not chunk.args then
        return
    end
    for _, arg in ipairs(chunk.args) do
        self:parse_arg(arg, chunk.args)
    end
end

function mt:parse_local(data, locals, args)
    self.current_line = data.line
    if self.globals[data.name] then
        self:error(('局部变量[%s]和全局变量重名 --> 已经定义在[%s]第[%d]行'):format(data.name, self.globals[data.name].file, self.globals[data.name].line))
    end
    if not self.types[data.type] then
        self:error(('类型[%s]未定义'):format(data.type))
    end
    if data.array and data[1] then
        self:error('数组不能直接初始化')
    end
    if args and args[data.name] then
        self:error(('局部变量[%s]和函数参数重名'):format(data.name))
    end
    if data[1] then
        self:parse_exp(data[1], data.type)
    end
    locals[data.name] = data
end

function mt:parse_locals(chunk)
    for _, data in ipairs(chunk.locals) do
        self:parse_local(data, chunk.locals, chunk.args)
    end
end

function mt:parse_loop(chunk)
    self.loop_count = self.loop_count + 1
    self:parse_lines(chunk)
    self.loop_count = self.loop_count - 1
end

function mt:parse_if(data)
    for _, chunk in ipairs(data) do
        if chunk.type == 'if' or chunk.type == 'elseif' then
            self:parse_exp(chunk.condition, 'boolean')
        end
        self:parse_lines(chunk)
    end
end

function mt:parse_call(line)
    local func = self:get_function(line.name)
    if not func.args then
        return
    end
    for i, arg in ipairs(func.args) do
        self:parse_exp(line[i], arg.type)
    end
end

function mt:parse_set(line)
    local var = self:get_var(line.name)
    self:parse_exp(line[1], var.vtype)
end

function mt:parse_seti(line)
    local var = self:get_var(line.name)
    self:parse_exp(line[1], 'integer')
    self:parse_exp(line[2], var.vtype)
end

function mt:parse_return(line)
    local func = self.current_function
    if not func.returns then
        return
    end
    self:parse_exp(line[1], func.returns)
end

function mt:parse_exit(line)
    if self.loop_count == 0 then
        self:error '不能在循环外使用exitwhen'
    end
    self:parse_exp(line[1], 'boolean')
end

function mt:parse_line(line)
    self.current_line = line.line
    if line.type == 'loop' then
        self:parse_loop(line)
    elseif line.type == 'if' then
        self:parse_if(line)
    elseif line.type == 'call' then
        self:parse_call(line)
    elseif line.type == 'set' then
        self:parse_set(line)
    elseif line.type == 'seti' then
        self:parse_seti(line)
    elseif line.type == 'return' then
        self:parse_return(line)
    elseif line.type == 'exit' then
        self:parse_exit(line)
    else
        error('未知的语句类型:'..line.type)
    end
end

function mt:parse_lines(chunk)
    for i, line in ipairs(chunk) do
        self:parse_line(line)
    end
end

function mt:parse_function(chunk)
    table.insert(self.functions, chunk)
    self.functions[chunk.name] = chunk
    
    if chunk.native then
        return
    end

    self.current_function = chunk
    self.loop_count = 0
    
    self:parse_args(chunk)
    self:parse_locals(chunk)
    self:parse_lines(chunk)

    self.current_function = nil
end

function mt:parser(gram)
    for i, chunk in ipairs(gram) do
        if chunk.type == 'globals' then
            self:parse_globals(chunk)
        elseif chunk.type == 'function' then
            self:parse_function(chunk)
        elseif chunk.type == 'type' then
            self:parse_type(chunk)
        else
            error('未知的区块类型:'..chunk.type)
        end
    end
end

function mt:parse_jass(jass, _file)
    file = _file
    for i = 1, #self.functions do
        self.functions[i] = nil
    end
    for i = 1, #self.globals do
        self.globals[i] = nil
    end

    --local clock = os.clock()
    --collectgarbage()
    --collectgarbage()
    --local m = collectgarbage 'count'
    --print('任务:', name)
    local gram, comments = grammar(jass, file)
    --print('用时:', os.clock() - clock)
    --collectgarbage()
    --collectgarbage()
    --print('内存:', collectgarbage 'count' - m, 'k')

    self:parser(gram)

    self.current_line = nil
    self.loop_count = nil
    
    self.comments = comments
    
    return gram
end

function mt:init(_root)
    root = _root
end

function mt:__call(jass)
    local result = setmetatable({}, { __index = mt})

    result.types = {
        null    = {type = 'type'},
        handle  = {type = 'type'},
        code    = {type = 'type'},
        integer = {type = 'type'},
        real    = {type = 'type'},
        boolean = {type = 'type'},
        string  = {type = 'type'},
    }
    result.globals = {}
    result.functions = {}

    local cj = io.load(root / 'src' / 'jass' / 'common.j')
    local bj = io.load(root / 'src' / 'jass' / 'blizzard.j')

    result:parse_jass(cj, 'common.j')
    local gram = result:parse_jass(bj, 'blizzard.j')
    if jass then
        gram = result:parse_jass(jass, 'war3map.j')
    end
    return result, gram
end

return mt
