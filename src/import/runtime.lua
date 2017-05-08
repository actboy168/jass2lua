local runtime = require 'jass.runtime'
local console = require 'jass.console'

console.enable = true

runtime.handle_level = 2
runtime.sleep = true
runtime.error_handle = function(msg)
    print("---------------------------------------")
    print("              LUA ERROR!!              ")
    print("---------------------------------------")
    print(tostring(msg) .. "\n")
    print(debug.traceback())
    print("---------------------------------------")
end
