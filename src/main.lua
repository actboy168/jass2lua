local exepath
(function()
	exepath = package.cpath:sub(1, package.cpath:find(';')-6)
	package.path = package.path .. ';' .. exepath .. '..\\src\\?.lua'
end)()

require 'filesystem'
require 'utility'
local uni  = require 'unicode'
local parser = require 'parser'
local converter = require 'converter'

local function main()
    local root = fs.path(uni.a2u(exepath)):parent_path():parent_path()
    local common   = io.load(root / 'src' / 'jass' / 'common.j')
    local blizzard = io.load(root / 'src' / 'jass' / 'blizzard.j')

    if not arg[1] then
        local ast = parser(common, blizzard)
        local buf = converter(ast)
        io.save(root / 'blizzard.lua', buf)
        print('完成,用时', os.clock(), '秒')
        return
    end
    
    local war3map = io.load(fs.path(uni.a2u(arg[1])))
    local ast = parser(common, blizzard, war3map)
    local buf = converter(ast)
    io.save(root / 'war3map.lua', buf)
    print('完成,用时', os.clock(), '秒')
end

main()
