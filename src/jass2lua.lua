
--声明所有的jass变量类型
local jasstypes = {"boolean", "integer", "real", "string", "code", "handle", "agent", "event", "player", "widget", "unit", "destructable", "item", "ability", "buff", "force", "group", "trigger", "triggercondition", "triggeraction", "timer", "location", "region", "rect", "boolexpr", "sound", "conditionfunc", "filterfunc", "unitpool", "itempool", "race", "alliancetype", "racepreference", "gamestate", "igamestate", "fgamestate", "playerstate", "playerscore", "playergameresult", "unitstate", "aidifficulty", "eventid", "gameevent", "playerevent", "playerunitevent", "unitevent", "limitop", "widgetevent", "dialogevent", "unittype", "gamespeed", "gamedifficulty", "gametype", "mapflag", "mapvisibility", "mapsetting", "mapdensity", "mapcontrol", "playerslotstate", "volumegroup", "camerafield", "camerasetup", "playercolor", "placement", "startlocprio", "raritycontrol", "blendmode", "texmapflags", "effect", "effecttype", "weathereffect", "terraindeformation", "fogstate", "fogmodifier", "dialog", "button", "quest", "questitem", "defeatcondition", "timerdialog", "leaderboard", "multiboard", "multiboarditem", "trackable", "gamecache", "version", "itemtype", "texttag", "attacktype", "damagetype", "weapontype", "soundtype", "lightning", "pathingtype", "image", "ubersplat", "hashtable"}
for _, name in ipairs(jasstypes) do
	jasstypes[name] = true --建立反向表
end

local function readin(jass)
	local tScripts = {}

	local fWord = function(i)
		return tScripts[#tScripts - (i or 0)][1]
	end
	
	local fString = function(i)
		return tScripts[#tScripts - (i or 0)][2]
	end

	local fType = function(i)
		return tScripts[#tScripts - (i or 0)][2]
	end

	local fWord = function(word)
		if word == "native" then
			return "函数声明"
		elseif word == "function" then
			return "函数声明"
		else
			local s = fType()
			if s == "函数名" then
				return "函数名"
			end
		end
	end
	
	local read = function(line)
		table.insert(tScripts, {"/n", "换行符"}) --新行插入换行符
		local iLast = 1 --重置单词索引
		local iLen = #line
		--逐字读取
		local i = 1
		repeat
			local w = line:sub(1, 1)
			if w:find("%a") then
				--字母
				local word = line:sub(iLast):match([%w_]+)
				table.insert(tScripts, {word, fWord(word)})
				iLast = iLast + #word
			end
		until i == iLen
	end
	
	for line in io.lines(jass:string()) do
		read(line)
	end

	return tScripts
end

local function jass2lua(jass_decl, jass_impl)
	
	local luat = {} --存放每一行代码的table
	
	table.insert(luat, [[
local _mt_number = { __index = function() return 0 end }
local _mt_boolean = { __index = function() return false end }
local _mt_string = { __index = function() return "" end }

local function ExecuteFunc(s)
    if _G[s] and type(_G[s]) == 'function' then
        pcall(_G[s])
    else
	    jass.ExecuteFunc(s)
    end
end
]])
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
	require 'utility'
	
	local input_map    = fs.path(arg[1])
	local root_dir     = fs.path(arg[2])
	local library      = root_dir / 'build' / 'scripts' / 'ht'
	local war3map_j    = root_dir / 'test' / 'war3map.j'
	local common_j     = library / 'common.j'
	local blizzard_j   = library / 'blizzard.j'
	local war3mapj_in_scripts = false
	
	fs.create_directories(root_dir / 'test')
	
	local inmap = mpq_open(input_map)
	if inmap then
		print('[ok]: Open ' .. input_map:string() .. '.')
	else
		print('[error]: Open ' .. input_map:string() .. '.')
		return
	end

	if inmap:extract('war3map.j', war3map_j) then
		print('[ok]: Extract war3map.j.')
	else
		if inmap:extract('scripts\\war3map.j', war3map_j) then
			print('[ok]: Extract scripts\\war3map.j.')
			war3mapj_in_scripts = true
		else
			print('[error]: Extract war3map.j.')
			return 
		end
	end
	inmap:close()

		
	local output_map = input_map:parent_path() / ('new_' .. input_map:filename():string())
	local new_war3map_j = root_dir / 'test' / 'new_war3map.j'
	local import = {
		['blizzard.lua'] = root_dir / 'test' / 'blizzard.lua',
		['war3map.lua']  = root_dir / 'test' / 'war3map.lua',
		['main.lua']     = root_dir / 'test' / 'main.lua',
		['config.lua']   = root_dir / 'test' / 'config.lua',
	}

	readin(common_j)
	readin(blizzard_j)
	readin(war3map_j)
	io.save(import['blizzard.lua'], table.concat(jass2lua({common_j}, {blizzard_j})))
	print('[ok]: Convert blizzard.lua.')
	io.save(import['war3map.lua'],  table.concat(jass2lua({common_j, blizzard_j}, {war3map_j})))
	print('[ok]: Convert war3map.lua.')
	io.save(import['main.lua'],  [[
main()
]])
	io.save(import['config.lua'],  [[
jass_ext.EnableConsole()
local japi = getmetatable(japi).__index
local jass = getmetatable(jass).__index
setmetatable(_ENV, {__index = function(self, name)
	return japi(self, name) or jass(self, name)
end})
require "blizzard.lua"
require "war3map.lua"
config()
]])

	io.save(new_war3map_j,  [[
function main takes nothing returns nothing
	call Cheat("run main.lua")
endfunction
function config takes nothing returns nothing
	call Cheat("run config.lua")
endfunction
]])

	pcall(fs.copy_file, input_map, output_map, true)
	local outmap = mpq_open(output_map)
	if outmap then
		print('[ok]: Open ' .. output_map:string() .. '.')
	else
		print('[error]: Open ' .. output_map:string() .. '.')
		return
	end

	local luac = root_dir / 'build' / 'luac.exe'
	local compile = function (src)
		local dst = fs.path(src):replace_extension(fs.path('.luac'))
		if not sys.spawn('"' .. luac:string() .. '" -s -o "' .. dst:string() .. '" "' .. src:string() .. '"', src:parent_path(), true) then
			return nil
		end
		return dst
	end

	for k, v in pairs(import) do
		if outmap:import(k, v) then
			print('[ok]: Import ' .. k .. '.')
		else
			print('[error]: Import ' .. k .. '.')
			return
		end
	end

	if outmap:import(
		war3mapj_in_scripts and 'scripts\\war3map.j' or 'war3map.j', 
		new_war3map_j) then
		print('[ok]: Import war3map.j.')
	else
		print('[error]: Import war3map.j.')
		return
	end

	outmap:close()
	
	print("Conversion completed.")
end

main()
