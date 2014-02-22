# YDWE lua engine instructions

##1. Introduction
ydwe lua engine(hereinafter referred to as lua engine) is a plugin for "Warcraft III"(hereinafter referred to as War3), which can make War3 execute lua and call the exported functions(defined in common.j ), just as use them in jass. The instructions assume that you have mastered the grammar of jass and lua, the problem about grammar will no longer be explained.

##2. Entrance
Called `call Cheat("run hello.lua")` within jass, which is equivalent to called `require 'hello.lua'` within lua. lua engine has added the files within the map to search path, so 'hello.lua' within the map will be implemented.

##3. Modify lua lua's standard engine
In order to fit in the engine using lua lua slight modification of Warcraft.
 
1. Supporting character integer. |AHbz| represents an integer, its value and jass in 'AHbz' equal.
2. Math.randomseed to use jass function SetRandomSeed achieved.
3. Math.random to use jass function GetRandomReal achieved.
4. Table element random seed depends on the internal Warcraft random seed.

##4. Built-in library
lua engine a total of five built-in libraries, you can "require 'library name'" call. 5 built-in libraries are

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

In particular, you can access jass custom variables jass.common library

######example

```lua
	local jass = require 'jass.common'
	jass.udg_code = function() -- a defined code jass variable assignment as a lua function
	print(jass.udg_strings [2]) -- Get string array defined jass
	end
```

You can interact with the data in this way to achieve and between jass script

Note that you can not access jass custom function through this way. That is, you can not call a function to call each other with arguments, but with no parameters by code variables

In the above example, you can run in the jass:

	call TimerStart(CreateTimer (), 1, true, udg_code)

The timer will correct your callback function defined in the lua maturity at the time of each

##6. jass.japi
All japi function jass.japi libraries currently registered.

######example

```lua
	local jass = require 'jass.common'
	local japi = require 'jass.japi'
	japi.EXDisplayChat(jass.Player (0), 0, "Hello!")
```

You can also by way of registered japi native function jass so that you call them in the jass

######example

	native EXDisplayChat takes player p, type i, string text returns nothing
	call EXDisplayChat(Player (0), 0, "Hello!")

##7. jass.hook
jass.hook library functions within common.j registered under the hook. Note: jass.common library will not be affected.

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

And you object editor project correspondence.

Gets the index when you can use the data in the object Ctrl+D to query the editor

Note that when accessing the correct return value is always a string. If you get the value of a unit of life, you may need to use tonumber to convert. When accessing incorrect returns nil.

##9. jass.runtime
### jass.runtime part of the configuration database can obtain information or to modify the engine lua lua runtime engine map.

######example

```lua
	local runtime = require 'jass.runtime'
```
####runtime.console (default is false)
Assigned to true open a cmd window, print function converts text displayed here

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
When your lua script error callback function. Note that this function efficiently after registration lua script will be reduced, even if no error occurred. If you do not register this function, the script also displays a simple error in the cmd prompt window.

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
Handle grade lua, there are currently three possible values: 0,1,2. When you are using 0,1,2, efficiency lua script will in turn reduce, but will in turn increase security.

#####0: handle the direct use number, jass lua you can not understand the reference to the handle, the handle will not come to protect this by increasing the reference count

######example

```lua
	local t = jass.CreateTimer ()
	print(t) -- 1048000
	type(t) -- "number"
```

#####1: handle encapsulated in lightuserdata, a 0 can be implicitly converted to nil, the same does not increase the reference count of the handle

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

#####2: Will increase when the handle is encapsulated in the userdata, lua holding the handle handle reference count. Of course, after the end of the function local variables are automatically recovered and released to handle references.

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
contains the sleep function common.j operation has four, TriggerSleepAction / TriggerSyncReady / TriggerWaitForSound / SyncSelections. Warning When this is when false, lua engine will ignore the call of these four functions, and give runtime. When this is true, these four functions will be performed correctly.

However, please note that this is true lua will reduce the operating efficiency of the engine, even if you do not use these four functions.

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
