jass_ext.EnableConsole()

setmetatable(_G, { __index = jass })

require "war3map.lua"

main()