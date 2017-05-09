local runtime = require 'jass.runtime'
local console = require 'jass.console'

console.enable = true

runtime.handle_level = 2
runtime.sleep = true
runtime.error_handle = function(msg)
    console.write("---------------------------------------")
    console.write("              LUA ERROR!!              ")
    console.write("---------------------------------------")
    console.write(tostring(msg) .. "\n")
    console.write(debug.traceback())
    console.write("---------------------------------------")
end
