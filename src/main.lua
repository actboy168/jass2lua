local exepath
(function()
	exepath = package.cpath:sub(1, package.cpath:find(';')-6)
	package.path = package.path .. ';' .. exepath .. '..\\src\\?.lua'
end)()

require 'filesystem'
require 'utility'
local uni       = require 'unicode'
local parser    = require 'parser'
local converter = require 'converter'
local archive   = require 'archive'

local function convert_blizzard()
    local root = fs.path(uni.a2u(exepath)):parent_path():parent_path()
    local common   = io.load(root / 'src' / 'jass' / 'common.j')
    local blizzard = io.load(root / 'src' / 'jass' / 'blizzard.j')
    local ast = parser(common, blizzard)
    local buf = converter(ast)
    io.save(root / 'blizzard.lua', buf)
end

local function convert_war3map(path)
    local root = fs.path(uni.a2u(exepath)):parent_path():parent_path()
    local common   = io.load(root / 'src' / 'jass' / 'common.j')
    local blizzard = io.load(root / 'src' / 'jass' / 'blizzard.j')
    local war3map = io.load(path)
    local ast = parser(common, blizzard, war3map)
    local buf = converter(ast)
    io.save(root / 'war3map.lua', buf)
end

local function convert_map(path)
    local map = archive(path, 'read')
    if not map then
        print('地图打开失败')
        return
    end
    local listfile = map:load_file '(listfile)'
    local files = {}
end

local function main()
    if not arg[1] then
        convert_blizzard()
    else
        local path = fs.path(uni.a2u(arg[1]))
        if path:filename():string() == 'war3map.j' then
            convert_war3map(path)
        else
            convert_map(path)
        end
    end
    
    print('完成,用时', os.clock(), '秒')
end

main()
