# YDWE Lua Engine Instructions

##1. Introduction
ydwe lua engine(hereinafter referred to as lua engine) is a plugin for "Warcraft III"(hereinafter referred to as War3), which can make War3 execute lua and call the exported functions(defined in common.j ), just as use them in jass. The instructions assume that you have mastered the grammar of jass and lua, the problem about grammar will no longer be explained.

##2. Entrance
Called `call Cheat("run hello.lua")` within jass, which is equivalent to called `require 'hello.lua'` within lua. lua engine has added the files within the map to search path, so 'hello.lua' within the map will be implemented.

##3. Modification betweens lua engin and standard lua
In order to fit in War3, lua engin relatives to the B with some modifications
 
1. Supporting character integer. |AHbz| represents an integer, its value and 'AHbz' in jass equals.
2. math.randomseed achieved by jass function SetRandomSeed.
3. math.random achieved by jass function GetRandomReal.
4. table element random seed depends on the War3 internal random seed.

##4. Built-in library
lua engine has a total of five built-in libraries, you can call them by "require 'library name'". They are

* jass.common
* jass.japi
* jass.hook
* jass.runtime
* jass.slk

##5. jass.common
jass.common library contains all the functions within common.j registration.
 
######example

```lua
	local jass = require 'jass.common'
	print(jass.GetHandleId(jass.Player(0)))
```

In particular, you can access jass custom variables by jass.common library

######example

```lua
	local jass = require 'jass.common'
	jass.udg_code = function() -- a defined code jass variable assignment as a lua function
	print(jass.udg_strings [2]) -- Get string array defined jass
	end
```

You can interact with the data in this way between jass script and lua script

Note that you can not access jass custom function through this way. That is, you can not call a function with arguments each other, but with no parameters by code variables

In the above example, you can run in the jass:

	call TimerStart(CreateTimer(), 1, true, udg_code)

The timer will correct callback function which defined in the lua when expired each time

##6. jass.japi
All currently registered japi function within jass.japi libraries 

######example

```lua
	local jass = require 'jass.common'
	local japi = require 'jass.japi'
	japi.EXDisplayChat(jass.Player (0), 0, "Hello!")
```

You can also register japi functions by the way of native function so that you call them in the jass

######example

	native EXDisplayChat takes player p, type i, string text returns nothing
	call EXDisplayChat(Player(0), 0, "Hello!")

##7. jass.hook
jass.hook library can hook functions registered within common.j registered. Note: jass.common library will not be affected.

######example

```lua
	local hook = require 'jass.hook'
	function hook.CreateUnit(pid, uid, x, y, face, realCreateUnit)
		-- When you call CreateUnit the jass, will be executed
		print('CreateUnit')
		return realCreateUnit(pid, uid, x, y, face)
	end
```

##8. Jass.slk
jass.slk library can read slk/w3 * files within the map in the map runtime.

######example

```lua
	local slk = require 'jass.slk'
	print(slk.ability.AHbz.Name)
```

slk contains

* Unit
* Item
* Destructable
* Doodad
* Ability
* Buff
* Upgrade

They are correspond to the classes in editor

You can find the index used for getting object data by pressing Ctrl + D in editor

Note that when accessing is correct, the return value is always a string. If you want to get the value of life or a unit, you may need to use 'tonumber' to convert. When accessing incorrect it returns nil.

##9. jass.runtime
###jass.runtime library can obtain information or modify configurations of lua engin in map runtime.

######example

```lua
	local runtime = require 'jass.runtime'
```
####runtime.console (default is false)
Assigned to true creates a cmd window, 'print' function will converts text displayed here

######example
```lua
	runtime.console = true
```

####runtime.version
Returns the current version number of the lua engine

######example

```lua
	print(runtime.version) -- 1
```

####runtime.error_handle
Lua callback this function when your script occurred errors. Note that lua script efficiency will be reduced after this function registered, even if no error occurred. If you do not register this function, the script also displays a simple error in the cmd window.

######example

```lua
	runtime.error_handle = function(msg)
		print("---------------------------------------")
		print("             LUA ERROR!!               ")
		print("---------------------------------------")
		print(tostring (msg) .. "\ n")
		print(debug.traceback ())
		print("---------------------------------------")
	end
```

####Runtime.handle_level (defaults to 2)
Handle level in lua, there are currently three possible values: 0,1,2. When you are using 0,1,2, lua script will in turn reduce efficiency, but in turn increase security.

#####0: handle is number in lua, jass can not understand the reference of the handle in lua, the handle will not be protected by increasing the reference count

######example

```lua
	local t = jass.CreateTimer ()
	print(t) -- 1048000
	type(t) -- "number"
```

#####1: handle encapsulated in lightuserdata, a 0 can be implicitly converted to nil, and also not increase the reference count of the handle

######example 1

```lua
	local t = jass.CreateTimer()
	print(t) -- "handle: 0x10005D"
	type(t) -- "userdata"
	jass.TimerStart(t, 1, false, 0) -- ok
```

######example 2

```lua
	local t = jass.CreateTimer()
	local h1 = jass.CreateTimer()
	jass.DestroyTimer(h1)
	jass.TimerStart(t, 1, false,
		function ()
			local h2 = jass.CreateTimer()
			print (h1) -- "handle: 0x10005E"
			print (h2) -- "handle: 0x10005E"
		end
	)
```

#####2: handle encapsulated in userdata, increase the reference count of the handle when lua holding the handle. Of course, after the end of a function local variables are automatically recovered and released to handle references.

######example

```lua
	local t = jass.CreateTimer()
	local h1 = jass.CreateTimer()
	jass.DestroyTimer(h1)
	jass.TimerStart(t, 1, false,
		function()
			local h2 = jass.CreateTimer()
			print(h1) -- "handle: 0x10005E"
			print(h2) -- "handle: 0x10005F"
		end
	)
```

####runtime.sleep (default is true)
There are four functions contain 'sleep' within common.j, they are 'TriggerSleepAction / TriggerSyncReady / TriggerWaitForSound / SyncSelections'. When it is false, lua engine will ignore the call of these four functions, and give runtime warning. When it is true, these four functions will be performed correctly.

However, please note that when it is true, lua engine will reduce the operating efficiency, even if you do not use these four functions.

######example

```lua
	local trg = jass.CreateTrigger()
	local a = 1
	jass.TriggerAddAction (trg, function()
		jass.TriggerSleepAction(0.2)
		print(a) -- 2
	end)
	jass.TriggerExecute(trg)
	a = 2
```
