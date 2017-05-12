local jass    = require 'jass.common'
local japi    = require 'jass.japi'
local console = require 'jass.console'
local runtime = require 'jass.runtime'

local setmetatable = setmetatable
local tostring     = tostring
local debug        = debug
local rawset       = rawset
local rawget       = rawget
local error        = error
local type         = type
local xpcall       = xpcall

local mt = {}

function mt:__index(key)
    local v = japi[key] or jass[key]
    if not v then
        return nil
    end
    self[key] = v
    return v
end

setmetatable(_G, mt)


local function warning(msg)
    console.write("---------------------------------------")
    console.write("             LUA WARNING!!             ")
    console.write("---------------------------------------")
    console.write(tostring(msg) .. "\n")
    console.write(debug.traceback())
    console.write("---------------------------------------")
end


local mt = {}
function mt:__index(i)
    if i < 0 or i > 8191 then
        warning('数组索引越界:'..i)
    end
    return rawget(self, '_default')
end

function mt:__newindex(i, v)
    if i < 0 then
        error('数组索引越界:'..i)
    elseif i > 8191 then
        warning('数组索引越界:'..i)
    end
    rawset(self, i, v)
end

function _array_(default)
    return setmetatable({ _default = default }, mt)
end

function _loop_()
    local i = 0
    return function()
        if i > 1000000 then
            error('循环次数太多')
        end
        i = i + 1
        return true
    end
end

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
