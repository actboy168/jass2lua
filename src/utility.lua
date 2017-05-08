local uni = require 'unicode'

local io_open = io.open
function io.open(filename, ...)
	return io_open(uni.u2a(filename:string()), ...)
end

function io.load(filename)
	local f, e = io.open(filename, "rb")
	if f then
		local str = f:read 'a'
		f:close()
		return str
	else
		return false, e
	end
end

function io.save(filename, str)
	local f, e = io.open(filename, "wb")
	if f then
		f:write(str)
		f:close()
		return true
	else
		return false, e
	end
end

local std_print = print
function print(...)
	local tbl = {...}
	local count = select('#', ...)
	for i = 1, count do
		tbl[i] = uni.u2a(tostring(tbl[i]))
	end
	std_print(table.unpack(tbl))
end
