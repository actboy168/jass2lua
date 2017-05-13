local runtime = require 'jass.runtime'
local jass    = require 'jass.common'

local xpcall  = xpcall
local ipairs  = ipairs
local type    = type

local key_name = {'and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 'function', 'goto', 'if', 'in', 'local', 'nil', 'not', 'or', 'repeat', 'return', 'then', 'true', 'until', 'while'}
for _, name in ipairs(key_name) do
    key_name[name] = name .. '_'
end
local function get_available_name(name)
    return key_name[name] or name
end

function ExecuteFunc(name)
    local lname = get_available_name(name)
    if _G[lname] and type(_G[lname]) == 'function' then
        xpcall(_G[lname], runtime.error_handle)
    else
        jass.ExecuteFunc(name)
    end
end
