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
    print(root)
    parser:init(root)

    if not arg[1] then
        local result = parser()
        local buf = converter(result)
        io.save(root / 'blizzard.lua', buf)
        print('完成,用时', os.clock(), '秒')
        return
    end
    
    local jass = io.load(fs.path(uni.a2u(arg[1])))
    local result = parser(jass)
    local buf = converter(result)
    io.save(root / 'war3map.lua', buf)
    print('完成,用时', os.clock(), '秒')
end

main()
