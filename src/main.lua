root = arg[0] .. '\\..\\..'
package.path = package.path .. ';' .. root .. '\\src\\?.lua'
                            .. ';' .. root .. '\\src\\?\\init.lua'

require 'filesystem'
require 'utility'
local parser    = require 'parser'
local converter = require 'converter'
local stormlib  = require 'ffi.stormlib'


local root = fs.path(root)

local function convert_common()
    local common = io.load(root / 'src' / 'jass' / 'common.j')
    local option = {}
    local ast, comments = parser.parser(common,   'common.j', option)
    return converter(ast, comments, option.state)
end

local function convert_blizzard()
    local common   = io.load(root / 'src' / 'jass' / 'common.j')
    local blizzard = io.load(root / 'src' / 'jass' / 'blizzard.j')
    local option = {}
    local ast, comments = parser.parser(common,   'common.j',   option)
    local ast, comments = parser.parser(blizzard, 'blizzard.j', option)
    return converter(ast, comments, option.state)
end

local function convert_war3map(war3map)
    local common   = io.load(root / 'src' / 'jass' / 'common.j')
    local blizzard = io.load(root / 'src' / 'jass' / 'blizzard.j')
    local option = {}
    local ast, comments = parser.parser(common,   'common.j',   option)
    local ast, comments = parser.parser(blizzard, 'blizzard.j', option)
    local ast, comments = parser.parser(war3map,  'war3map.j',  option)
    return converter(ast, comments, option.state)
end

local function get_common(map)
    local common = map:load_file 'common.j' or map:load_file 'scripts\\common.j'
    if not common then
        return io.load(root / 'src' / 'import' / 'common.lua')
    end
    local option = {}
    local ast, comments = parser.parser(common,   'common.j', option)
    return converter(ast, comments, option.state)
end

local function get_blizzard(map)
    local blizzard = map:load_file 'blizzard.j' or map:load_file 'scripts\\blizzard.j'
    if not blizzard then
        return io.load(root / 'src' / 'import' / 'blizzard.lua')
    end
    local common = map:load_file 'common.j' or map:load_file 'scripts\\common.j' or io.load(root / 'src' / 'jass' / 'common.j')
    local option = {}
    local ast, comments = parser.parser(common,   'common.j',   option)
    local ast, comments = parser.parser(blizzard, 'blizzard.j', option)
    return converter(ast, comments, option.state)
end

local function get_war3map(map)
    local common   = map:load_file 'common.j'   or map:load_file 'scripts\\common.j'   or io.load(root / 'src' / 'jass' / 'common.j')
    local blizzard = map:load_file 'blizzard.j' or map:load_file 'scripts\\blizzard.j' or io.load(root / 'src' / 'jass' / 'blizzard.j')
    local war3map  = map:load_file 'war3map.j'  or map:load_file 'scripts\\war3map.j'
    local option = {}
    local ast, comments = parser.parser(common,   'common.j',   option)
    local ast, comments = parser.parser(blizzard, 'blizzard.j', option)
    local ast, comments = parser.parser(war3map,  'war3map.j',  option)
    return converter(ast, comments, option.state)
end

local function save_files(map, common, blizzard, war3map)
    map:remove_file('common.j')
    map:remove_file('blizzard.j')
    map:remove_file('war3map.j')
    map:remove_file('scripts\\common.j')
    map:remove_file('scripts\\blizzard.j')
    map:remove_file('scripts\\war3map.j')

    map:save_file('scripts\\common.lua',   common)
    map:save_file('scripts\\blizzard.lua', blizzard)
    map:save_file('scripts\\war3map.lua',  war3map)
    map:save_file('scripts\\runtime.lua',  io.load(root / 'src' / 'import' / 'runtime.lua'))
    map:save_file('scripts\\utility.lua',  io.load(root / 'src' / 'import' / 'utility.lua'))
    map:save_file('scripts\\native.lua',   io.load(root / 'src' / 'import' / 'native.lua'))
    map:save_file('scripts\\config.lua',   io.load(root / 'src' / 'import' / 'config.lua'))
    map:save_file('scripts\\main.lua',     io.load(root / 'src' / 'import' / 'main.lua'))
    map:save_file('war3map.j',             io.load(root / 'src' / 'import' / 'war3map.j'))
end

local function convert_map(path)
    local map = stormlib.open(path, true)
    if not map then
        print('地图打开失败')
        return
    end
    local number   = map:number_of_files()
    local common   = get_common(map)
    local blizzard = get_blizzard(map)
    local war3map  = get_war3map(map)
    map:close()

    io.save(root / 'src' / 'import' / 'war3map.lua', war3map)

    local newpath  = path:parent_path() / (path:stem():string() .. '_lua.w3x')
    if not pcall(fs.copy_file, path, newpath, true) then
        print('地图创建失败')
        return
    end
    local map = stormlib.open(newpath, false, number + 9)
    if not map then
        print('地图保存失败')
        return
    end
    save_files(map, common, blizzard, war3map)
    map:close()
end

local function main()
    if not arg[1] then
        io.save(root / 'common.lua', convert_common())
        io.save(root / 'blizzard.lua', convert_blizzard())
    else
        local path = fs.path(arg[1])
        if path:extension():string() == '.j' then
            local buf = convert_war3map(io.load(path))
            io.save(root / 'war3map.lua', buf)
        else
            convert_map(path)
        end
    end

    print('完成,用时', os.clock(), '秒')
end

main()
