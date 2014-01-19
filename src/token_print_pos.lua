
-- string.byte('\n') == 10
-- string.byte('\r') == 13
-- string.byte('\t') == 9

local function parse_line_column(buf, pos)
	local line = 1
	local column = 1
	local home = 1
	local i = 1

	while i <= pos do
		if buf:byte(i) == 10 then
			i = i + 1
			line = line + 1
			home = i
			column = 1
		elseif buf:byte(i) == 13 then
			i = i + 1
			if (i > pos) or (buf:byte(i) ~= 10) then
				line = line + 1
				home = i
				column = 1
			end
		elseif buf:byte(i) == 9 then
			i = i + 1
			column = column + 4
		else
			i = i + 1
			column = column + 1
		end
	end
	return line, column, home
end

local function find_next_line(buf, pos)
	local i = pos
	while i <= #buf do
		if buf:byte(i) == 10 then
			return i - 1
		elseif buf:byte(i) == 13 then
			i = i + 1
			if (i > #buf) or (buf:byte(i) ~= 10) then
				return i - 1
			end
		else
			i = i + 1
		end
	end
	return #buf
end

function token_print_pos(token, buf)
	local first, last = token:pos(buf)
	local line, column, home = parse_line_column(buf, first+1)
	local head = string.format('(%d, %d): ', line, column)
	local out_1 = head .. buf:sub(home, find_next_line(buf, home))
	local out_2 = ''
	for i = 1, #head do
		out_2 = out_2 .. ' '
	end
	for i = home, first do
		out_2 = out_2 .. ' '
	end
	for i = first, last-1 do
		out_2 = out_2 .. '^'
	end
	print(out_1)
	print(out_2)
end
