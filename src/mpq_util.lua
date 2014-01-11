require 'ar_stormlib'

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
