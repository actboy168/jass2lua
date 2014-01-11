
starttime = os.clock()

--声明所有的jass变量类型
jasstypes = {"boolean", "integer", "real", "string", "code", "handle", "agent", "event", "player", "widget", "unit", "destructable", "item", "ability", "buff", "force", "group", "trigger", "triggercondition", "triggeraction", "timer", "location", "region", "rect", "boolexpr", "sound", "conditionfunc", "filterfunc", "unitpool", "itempool", "race", "alliancetype", "racepreference", "gamestate", "igamestate", "fgamestate", "playerstate", "playerscore", "playergameresult", "unitstate", "aidifficulty", "eventid", "gameevent", "playerevent", "playerunitevent", "unitevent", "limitop", "widgetevent", "dialogevent", "unittype", "gamespeed", "gamedifficulty", "gametype", "mapflag", "mapvisibility", "mapsetting", "mapdensity", "mapcontrol", "playerslotstate", "volumegroup", "camerafield", "camerasetup", "playercolor", "placement", "startlocprio", "raritycontrol", "blendmode", "texmapflags", "effect", "effecttype", "weathereffect", "terraindeformation", "fogstate", "fogmodifier", "dialog", "button", "quest", "questitem", "defeatcondition", "timerdialog", "leaderboard", "multiboard", "multiboarditem", "trackable", "gamecache", "version", "itemtype", "texttag", "attacktype", "damagetype", "weapontype", "soundtype", "lightning", "pathingtype", "image", "ubersplat", "hashtable"}
for _, name in ipairs(jasstypes) do
	jasstypes[name] = true --建立反向表
end

luat = {} --存放每一行代码的table

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
end
]])

table.insert(luat, "\n\n")

functionTypes = {} --存放函数的类型
globalTypes = {} --存放全局变量的类型
localTypes = {} --存放局部变量的类型,每个endfunction处重置

functionType = function(word, cj)
	local match = "function%s+([%w_]+)%s+takes.-returns%s+([%w_]+)"
	if cj then
		match = "native%s+([%w_]+)%s+takes.-returns%s+([%w_]+)"
	end
	local name, type = string.match(word, match)
	if type and type ~= "nothing" then
		functionTypes[name] = type

	end
end

globalType = function(word)
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

localType = function(word)
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

j2lfuncs = {
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

Debug = {}

--将读取进来的jass代码转换成lua代码
j2l = function(jass, cj)
	local words = {} --存放当前行找到的所有单词
	if jass == "function main takes nothing returns nothing" then
		ismain = true
	end
	functionType(jass, cj) --词法分析(函数)
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

do
	local strings

	findString = function(s)
		strings = {}
		for word in string.gmatch(s, [["(.-)"]]) do
			table.insert(strings, word)
		end
	end

	backString = function(s)
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
end

local function usage()
	print('\n')
	print('usage: jass2lua.lua input output library_dir\n')
	print('  input       : input script path \n')
	print('  output      : output script path\n')
	print('  library_dir : common.j/blizzard.j\'s dir\n')
	print('\n')
end

local function main()
	if (not arg) or (#arg < 3) then
		usage()
		return
	end
	
	local in_script  = arg[1]
	local out_script = arg[2]
	local library    = arg[3]

	for line in io.lines(library .. "common.j") do
		--遍历cj的每一行
		j2l(line, true)
	end
	
	for line in io.lines(library .. "blizzard.j") do
		--遍历脚本的每一行
		j2l(line)
	end
	
	for line in io.lines(in_script) do
		--遍历脚本的每一行
		j2l(line)
	end
	
	table.insert(luat, string.format("--project 'jass2lua' complete! %d lines in %s second,by '%s'", #luat / 2, os.clock() - starttime, "MoeUshio"))
	
	table.insert(luat, "\n\n")
	
	table.insert(luat, [[
		ModuloInteger = math.fmod
		ModuloReal = math.fmod
	]])
	
	local file = io.open(out_script,"w")
	file:write(table.concat(luat))
	file:close()
	
	print("生成完成,共计", math.floor(#luat / 2), "行,用时", os.clock() - starttime, "秒")
end

main()
