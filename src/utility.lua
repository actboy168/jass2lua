
require 'ar_stormlib'
require 'sys'

local stormlib = ar.stormlib
local mpq_meta =  { __index = {} }

function mpq_meta.__index:import(path_in_archive, import_file_path)
	return stormlib.add_file_ex(
			self.handle,
			import_file_path,
			path_in_archive,
			bit32.bor(stormlib.MPQ_FILE_COMPRESS, stormlib.MPQ_FILE_REPLACEEXISTING),
			stormlib.MPQ_COMPRESSION_ZLIB,
			stormlib.MPQ_COMPRESSION_ZLIB)
end

function mpq_meta.__index:extract(path_in_archive, extract_file_path)
	return stormlib.extract_file(self.handle, extract_file_path, path_in_archive)
end

function mpq_meta.__index:close()
	stormlib.close_archive(self.handle)
end

function mpq_open(path)
	local h = stormlib.open_archive(path, 0, 0)
	if not h then 
		return nil
	end
	return setmetatable({handle = h}, mpq_meta)
end

function io.save(file_path, content)
	local f, e = io.open(file_path:string(), "wb")

	if f then
		f:write(content)
		f:close()
		return true
	else
		return false, e
	end
end

function io.lines(path)
    local f, e = io.open(path, "rb")
    if not f then
        return nil, e
    end
    local CHUNK_SIZE = 1024
    local buffer = ""
    local pos_beg = 1
    return function()
        local pos, chars
        while 1 do
            pos, chars = buffer:match('()([\r\n].)', pos_beg)
            if pos or not f then
                break
            elseif f then
                local chunk = f:read(CHUNK_SIZE)
                if chunk then
                    buffer = buffer:sub(pos_beg) .. chunk
                    pos_beg = 1
                else
                    f:close()
                    f = nil
                end
            end
        end
        if not pos then
            pos = #buffer
        elseif chars == '\r\n' then
            pos = pos + 1
        end
        local line = buffer:sub(pos_beg, pos)
        pos_beg = pos + 1
        if #line > 0 then
            return line
        end
    end
end

function sys.spawn(command_line, current_dir, wait)
	local p = sys.process()
	if not p:create(nil, command_line, current_dir) then
		return false
	end

	if wait then
		local exit_code = p:wait()
		p:close()
		p = nil
		return exit_code == 0
	end
	
	p:close()
	p = nil	
	return false
end
