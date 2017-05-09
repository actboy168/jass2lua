local jass = require 'jass.common'
local japi = require 'jass.japi'
local ai   = require 'jass.ai'

local mt = {}

function mt:__index(key)
    local v = japi[key] or jass[key] or ai[key]
    if not v then
        return nil
    end
    self[key] = v
    return v
end

setmetatable(_G, mt)


local mt = {}
function mt:__index(i)
    if i < 0 or i > 8191 then
        error('数组索引越界:'..i)
    end
    return rawget(self, '_default')
end

function mt:__newindex(i, v)
    if i < 0 or i > 8191 then
        error('数组索引越界:'..i)
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


function ExecuteFunc(name)
    if _G[name] and type(_G[name]) == 'function' then
        pcall(_G[name])
    else
        jass.ExecuteFunc(name)
    end
end
