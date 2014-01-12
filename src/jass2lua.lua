
--声明所有的jass变量类型
local jasstypes = {"boolean", "integer", "real", "string", "code", "handle", "agent", "event", "player", "widget", "unit", "destructable", "item", "ability", "buff", "force", "group", "trigger", "triggercondition", "triggeraction", "timer", "location", "region", "rect", "boolexpr", "sound", "conditionfunc", "filterfunc", "unitpool", "itempool", "race", "alliancetype", "racepreference", "gamestate", "igamestate", "fgamestate", "playerstate", "playerscore", "playergameresult", "unitstate", "aidifficulty", "eventid", "gameevent", "playerevent", "playerunitevent", "unitevent", "limitop", "widgetevent", "dialogevent", "unittype", "gamespeed", "gamedifficulty", "gametype", "mapflag", "mapvisibility", "mapsetting", "mapdensity", "mapcontrol", "playerslotstate", "volumegroup", "camerafield", "camerasetup", "playercolor", "placement", "startlocprio", "raritycontrol", "blendmode", "texmapflags", "effect", "effecttype", "weathereffect", "terraindeformation", "fogstate", "fogmodifier", "dialog", "button", "quest", "questitem", "defeatcondition", "timerdialog", "leaderboard", "multiboard", "multiboarditem", "trackable", "gamecache", "version", "itemtype", "texttag", "attacktype", "damagetype", "weapontype", "soundtype", "lightning", "pathingtype", "image", "ubersplat", "hashtable"}
for _, name in ipairs(jasstypes) do
	jasstypes[name] = true --建立反向表
end
	
local function jass2lua(jass_decl, jass_impl)
	
	local luat = {} --存放每一行代码的table
	
	table.insert(luat, [[
--metatable

_mt_number = { __index = function()
	return 0
end}

_mt_boolean = { __index = function()
	return false
end}

table.newnumber = function()
	local t = {}
	setmetatable(t, _mt_number)
	return t
end

table.newboolean = function()
	local t = {}
	setmetatable(t, _mt_boolean)
	return t
end

--remove all units,wait to recreate by lua

local g = CreateGroup()

for i = 0, 15 do
    GroupEnumUnitsOfPlayer(g, Player(i), Condition(
        function()
            RemoveUnit(GetFilterUnit())
        end
    ))
end]])
	
	table.insert(luat, "\n\n")
	
	local functionTypes = {} --存放函数的类型
	local globalTypes = {} --存放全局变量的类型
	local localTypes = {} --存放局部变量的类型,每个endfunction处重置
	local strings

	local function findString(s)
		strings = {}
		for word in string.gmatch(s, [["(.-)"]]) do
			table.insert(strings, word)
		end
	end

	local function backString(s)
		if #strings == 0 then
			return s
		end
		return string.gsub(s, [["(.-)"]],
			function(word)
				local word = strings[1]
				table.remove(strings, 1)
				return [["]] .. word .. [["]]
			end
		)
	end
	
	local function functionType(word)
		local match = "%s+([%w_]+)%s+takes.-returns%s+([%w_]+)"
		local name, type = string.match(word, match)
		if type and type ~= "nothing" then
			functionTypes[name] = type
		end
	end
	
	local function globalType(word)
		if isglobal then
			local t = {}
			for thisword in string.gmatch(word, "([%w_%/]+)") do
				table.insert(t, thisword)
			end
			if #t ~= 0 then
				if t[1] == "//" then return end
				local name
				local type
				for i, v in ipairs(t) do
					if jasstypes[v] then
						type = v
						if t[i+1] == "array" then
							name = t[i+2]
						else
							name = t[i+1]
						end
						globalTypes[name] = type
						return
					end
				end
			end
		end
	end
	
	local function localType(word)
		if not isglobal then
			local type, arrayorname, name = string.match(word, "local (%S+)%s+(%S+)%s+(%S+)")
			if type and jasstypes[type] then
				if arrayorname == "array" then
					localTypes[name] = type
				else
					localTypes[arrayorname] = type
				end
			end
			local thiswords = string.match(word, "takes(.+)returns")
			if thiswords then
				for type, name in string.gmatch(thiswords, "([%w_]+)%s+([%w_]+)") do
					localTypes[name] = type
				end
			end
		end
	end
	
	local j2lfuncs = {
		--修改转义符
		function(word)
			if string.sub(word, 1, 2) == "//" then
				word = false
			end
			return word
		end,
		--删除部分初始化
		function(word)
			if ismain then
				if word == "InitSounds" or word == "CreateRegions" or word == "InitBlizzard" then
					word = false
				end
			end
			return word
		end,
		--修改256进制符号
		function(word)
			if string.sub(word, 1, 1) == "'" then
				word = string.gsub(word, "'", "|")
			end
			return word
		end,
		--删除globals与endglobals
		function(word)
			if word == "globals" then
				word = nil
				isglobal = true
			elseif word == "endglobals" then
				isglobal = false
			end
			return word
		end,
		--删除变量类型
		function(word)
			if jasstypes[word] then
				nextType = word
				word = nil
			end
			return word
		end,
		--删除set和call
		function(word)
			if word == "set" or word == "call" then
				word = nil
			end
			return word
		end,
		--修改function样式
		function(word)
			if word == "function" then
				word = nil
			elseif word == "takes" then
				word = " = function ("
			elseif word == "returns" then
				word = ")"
			elseif word == "nothing" then
				word = nil
			end
			return word
		end,
		--修改end类
		function(word)
			if word == "end" then
				word = "end_"
			elseif word == "endif" or word == "endloop" then
				word = "end"
			elseif word == "endfunction" then
				word = "end"
				localtypes = {} --函数结束重置局部变量
			end
			return word
		end,
		--修改null为nil
		function(word)
			if word == "null" then
				word = "nil"
			end
			return word
		end,
		--修改循环样式
		function(word)
			if word == "loop" then
				word = "for _i = 1, 10000 do"
			elseif word == "exitwhen" then
				word = "if"
				word2 = "then break end"
			end
			return word
		end,
		--修改数组样式
		function(word)
			if word == "array" then
				word = nil
				if nextType == "integer" or nextType == "real" then
					word2 = "= table.newnumber()"
				elseif nextType == "boolean" then
					word2 = "= table.newboolean()"
				else
					word2 = "= {}"
				end
			end
			return word
		end,
		--修改return样式
		function(word)
			if word == "return" then
				word = "do return"
				word2 = "end"
			end
			return word
		end,
		--修改诸如  .0 等不规范数字
		function(word)
			if string.sub(word, 1, 1) == "." then
				word = 0 .. word
			end
			return word
		end,
		--记录当前走到的类型
		function(word)
			local thisword = string.match(word, "([%w_]+)")
			if string.sub(word, 1, 1) == [["]] then
				lastType = "string"
			elseif thisword then
				lastType = functionTypes[thisword] or localTypes[thisword] or globalTypes[thisword]
			end
			return word
		end,
	}
	
	local Debug = {}
	
	--将读取进来的jass代码转换成lua代码
	local function j2l(jass, cj)
		local words = {} --存放当前行找到的所有单词
		if jass == "function main takes nothing returns nothing" then
			ismain = true
		end
		functionType(jass) --词法分析(函数)
		findString(jass)
		jass = string.gsub(jass, "%$", "0x")
		jass = string.gsub(jass, [[ExecuteFunc%((.-)%)]], "pcall(_G[%1])")
		jass = string.gsub(jass, "([%+%-%*%,%(%)%[%]])", " %1 ")
		jass = string.gsub(jass, "([%/%=])(.)", function(a, b)
			if a == b or (b == "=" and (a == ">" or a == "<")) then
				return a .. b
			else
				return a .. " " .. b
			end
		end)
		jass = string.gsub(jass, "(.)([%/%=])", function(a, b)
			if a == b or (b == "=" and (a == ">" or a == "<")) then
				return a .. b
			else
				return a .. " " .. b
			end
		end)
		jass = string.gsub(jass, "! =", "~=")
		jass = string.gsub(jass, "constant", "")
		globalType(jass) --词法分析(全局变量)
		localType(jass) --词法分析(局部变量)
		for word in string.gmatch(jass, "([%S]+)") do
			for _, func in ipairs(j2lfuncs) do
				word = func(word)
				if not word then
					break
				end
			end
			if word == false then
				break
			elseif word ~= nil then
				if lastType == "string" and words[#words] == "+" then
					--修改上一个"+"
					lastType = nil
					words[#words] = ".."
				end
				table.insert(words, word)
			end
		end
		if word2 then
			table.insert(words, word2)
			word2 = nil
		end
		if #words == 1 and words[1] ~= "end" and words[1] ~= "while true do" and words[1] ~= "else" and words[1] ~= "return" then
			if not string.find(words[1], "[^%w_]") then
				if not Debug[words[1]] then
					--print(words[1])
					Debug[words[1]] = true
				end
				return
			end
		end
		if #words ~= 0 and not cj then
			local ss = table.concat(words, " ")
			ss = backString(ss)
			table.insert(luat, ss)
			table.insert(luat, "\n") --先添加一个换行符
		end
	end

	for _, v in pairs(jass_decl) do
		for line in io.lines(v:string()) do
			j2l(line, true)
		end
	end
	
	for _, v in pairs(jass_impl) do
		for line in io.lines(v:string()) do
			j2l(line)
		end
	end
	
	return luat
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

local function usage()
	print('\n')
	print('usage: jass2lua.lua input output root_dir\n')
	print('  input    : input script path \n')
	print('  output   : output script path\n')
	print('  root_dir : root dir\'s dir\n')
	print('\n')
end

local function main()
	if (not arg) or (#arg < 2) then
		usage()
		return
	end
	
	local input_map  = arg[1]
	local root_dir   = arg[2]

	package.path = package.path .. ';' .. arg[2] .. 'src\\?.lua'
	package.cpath = package.cpath .. ';' .. arg[2] .. 'build\\?.dll'
	require 'filesystem'
	require 'mpq_util'
	
	local input_map    = fs.path(arg[1])
	local root_dir     = fs.path(arg[2])
	local library      = root_dir / 'build' / 'scripts' / 'ht'
	local war3map_j    = root_dir / 'test' / 'war3map.j'
	local common_j     = library / 'common.j'
	local blizzard_j   = library / 'blizzard.j'
	
	local inmap = mpq_open(input_map)
	if not inmap then
		print('error: Open ' .. input_map:string() .. ' failed.')
		return
	end

	if not inmap:extract('war3map.j', war3map_j) then
		if not inmap:extract('script\\war3map.j', war3map_j) then
			print('error: Not found war3map.j.')
			return 
		end
	end
	inmap:close()

	local output_map = input_map:parent_path() / ('new_' .. input_map:filename():string())
	local blizzard_lua   = root_dir / 'test' / 'blizzard.lua'
	local war3map_lua    = root_dir / 'test' / 'war3map.lua'
	local initialize_lua = root_dir / 'test' / 'initialize.lua'
	local new_war3map_j  = root_dir / 'test' / 'new_war3map.j'
	
	io.save(blizzard_lua, table.concat(jass2lua({common_j}, {blizzard_j})))
	io.save(war3map_lua,  table.concat(jass2lua({common_j, blizzard_j}, {war3map_j})))
	io.save(initialize_lua,  [[
jass_ext.EnableConsole()
setmetatable(_G, { __index = getmetatable(jass).__index })
require "blizzard.lua"
require "war3map.lua"
main()
]])
	io.save(new_war3map_j,  [[
function main takes nothing returns nothing
	call Cheat("run initialize.lua")
endfunction
function config takes nothing returns nothing
	// TODO
endfunction
	]])

	pcall(fs.copy_file, input_map, output_map, true)
	local outmap = mpq_open(output_map)
	if not outmap then
		print('error: Open ' .. output_map:string() .. ' failed.')
		return
	end

	if not outmap:import('war3map.j', new_war3map_j) then
		print('error: Import war3map.j failed.')
		return
	end
	if not outmap:import('blizzard.lua', blizzard_lua) then
		print('error: Import blizzard.lua failed.')
		return
	end
	if not outmap:import('war3map.lua', war3map_lua) then
		print('error: Import war3map.lua failed.')
		return
	end
	if not outmap:import('initialize.lua', initialize_lua) then
		print('error: Import initialize.lua failed.')
		return
	end
	outmap:close()
	
	print("Conversion completed.")
end

main()
