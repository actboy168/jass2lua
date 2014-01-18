function io.load(file_path)
	local f, e = io.open(file_path, "rb")

	if f then
		local content = f:read("*a")
		f:close()
		return content
	else
		return nil, e
	end
end

local function main()
	if (not arg) or (#arg < 2) then
		usage()
		return
	end
	
	local input_map  = arg[1]
	local root_dir   = arg[2]

	package.path = package.path .. ';' .. arg[2] .. '?.lua'
	package.cpath = package.cpath .. ';' .. arg[2] .. '?.dll'
	require 'jass_lexer'
	
	local buf = io.load(input_map)
	if buf then
		local lex = jass.lexer(buf)
		local success = true
		for it in lex:tokenize() do
			if not it:is_valid() then
				success = false
				break
			end
			print('==== ' .. it:id() .. ' : ' .. it:value())
		end
		
		if success then
			print("-------------------------")
			print("Parsing succeeded")
			print("-------------------------")
		else
			print("-------------------------")
			print("Parsing failed")
			print("-------------------------")
		end
	end
end

main()
