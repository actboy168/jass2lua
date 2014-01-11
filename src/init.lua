jass_ext.EnableConsole()

local bj = require "blizzard.lua"

setmetatable(bj, { __index = getmetatable(jass).__index })

setmetatable(_G, { __index = bj })

require "war3map.lua"

main()