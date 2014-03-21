#ydwe lua引擎使用说明

##简介
ydwe lua引擎(以下简称lua引擎)是一个嵌入到《魔兽争霸III》(以下简称魔兽)中的一个插件，它可以让魔兽可以执行lua并且调用魔兽的导出函数(在common.j内定义的函数)，就像使用jass那样。本说明假定你已经掌握了jass和lua的相关语法，有关语法的问题不再另行解释。

##入口
在jass内调用 `call Cheat("exec-lua: hello.lua")`，这等价于在lua里调用了 `require 'hello.lua'` 。lua引擎已经把地图内的文件加载到搜索路径，所以地图内的hello.lua将会得到执行。

##lua引擎对标准lua的修改
为了适合在魔兽内使用lua引擎对lua略有修改。 
 
1. 支持字符型整数。|AHbz|表示一个整数，其值和jass内的'AHbz'相等。
2. math.randomseed改为使用jass函数SetRandomSeed实现。
3. math.random改为使用jass函数GetRandomReal实现。
4. table元素随机化种子依赖于魔兽内部的随机种子。

##内置库
lua引擎一共有6个内置库，可以通过"require '库名'"调用。6个内置库分别为  

* jass.common
* jass.japi
* jass.hook
* jass.runtime
* jass.slk
* jass.storm

##jass.common
jass.common库包含common.j内注册的所有函数。 

```lua
	local jass = require 'jass.common'
	print(jass.GetHandleId(jass.Player(0)))
```
	
特别的,你可以通过jass.common库来访问jass中的自定义变量  

```lua
	local jass = require 'jass.common'
	jass.udg_code = function() --将一个jass中定义的code变量赋值为一个lua函数
		print(jass.udg_strings[2]) --获取jass中定义的string数组
	end
```
	
你可以通过这个方式来实现和jass脚本之间的数据交互  

注意，你无法通过这个方式来访问jass中的自定义函数。也就是说，你无法带着参数来调用对方的函数，但通过code变量可以不带参数的来调用  

在上面的例子中,你可以在jass中执行:
	
```
	call TimerStart(CreateTimer(), 1, true, udg_code)
```
	
这个计时器将在每次到期时正确的回调你在lua中定义的函数

##jass.japi
jass.japi库当前已经注册的所有japi函数。  

```lua
	local jass = require 'jass.common'
	local japi = require 'jass.japi'
	japi.EXDisplayChat(jass.Player(0), 0, "Hello!")
```

japi函数不同环境下可能会略有不同，你可以通过pairs遍历当前的所有japi函数


```lua
	for k, v in pairs(require 'jass.japi') do
		print(k .. ' ' .. v)
	end
```

##jass.hook
jass.hook库可以对common.j内注册的函数下钩子。注：jass.common库不会受到影响。  

同时，为了避免jass和lua之间传递浮点数时产生误差，通过jass.hook传递到lua中的浮点数，并不是number类型，而是userdata。当你需要**精确**地操纵浮点数时，也请注意这点。

```lua
	local hook = require 'jass.hook'
	function hook.CreateUnit(pid, uid, x, y, face, realCreateUnit)
		-- 当jass内调用CreateUnit时，就会被执行
		print('CreateUnit')
		print(type(x))
		return realCreateUnit(pid, uid, x, y, face)
	end
```

##jass.slk
jass.slk库可以在地图运行时读取地图内的slk/w3*文件。  

```lua
	local slk = require 'jass.slk'
	print(slk.ability.AHbz.Name)
```

你也可以遍历一个表或者一个物体

```lua
	local slk = require 'jass.slk'
	for k, v in pairs(slk.ability) do
		print(k .. ' ' .. v)
	end
	for k, v in pairs(slk.ability.AHbz) do
		print(k .. ' ' .. v)
	end
```

slk包含

* unit
* item
* destructable
* doodad
* ability
* buff
* upgrade

与你物体编辑器中的项目一一对应。  

获取数据时使用的索引你可以在物体编辑器中通过Ctrl+D来查询到  

注意，当访问正确时返回值永远是字符串。如果你获取的是某个单位的生命值，你可能需要使用tonumber来进行转换。当访问不正确时将返回nil。

##jass.storm
jass.storm库可以读取mpq/本地硬盘的文件，并可以向本地硬盘写文件。

```lua
	local storm = require 'jass.storm'
	local buf = storm.load('war3map.j')
	if buf then
		print(buf)
		print(storm.save('save_war3map.j', buf))
	end
```


##jass.runtime
###jass.runtime库可以在地图运行时获取lua引擎的信息或修改lua引擎的部分配置。

```lua
	local runtime = require 'jass.runtime'
```

####runtime.console(默认为false)
赋值为true后会打开一个cmd窗口，print函数可以输出到这里

```lua
	runtime.console = true
```

####runtime.version
返回当前lua引擎的版本号

```lua
	print(runtime.version)
```

####runtime.error_handle
当你的lua脚本出现错误时将会调用此函数。

runtime.error_handle有一个默认值，等价于以下函数
```lua
	runtime.error_handle = function(msg)
		print("Error: ", msg, "\n")
	end
```

你也可以让它输出更多的信息，比如输出错误时的调用栈
```lua
	runtime.error_handle = function(msg)
		print("---------------------------------------")
		print("              LUA ERROR!!              ")
		print("---------------------------------------")
		print(tostring(msg) .. "\n")
		print(debug.traceback())
		print("---------------------------------------")
	end
```
	
注意，注册此函数后lua脚本的效率会降低(即使并没有发生错误)。

####runtime.handle_level(默认为2)
lua引擎处理的handle的安全等级，有效值为0~2，注，等级越高，效率越低，安全性越高、

#####0: handle直接使用number，jass无法了解你在lua中对这个handle的引用情况，也不会通过增加引用计数来保护这个handle

```lua
	local t = jass.CreateTimer()
	print(t) -- 1048000
	type(t) -- "number"
```

#####1: handle封装在lightuserdata中，保证handle不能和整数相互转换，同样不支持引用计数

```lua
	local t = jass.CreateTimer()
	print(t) -- "handle: 0x10005D"
	type(t) -- "userdata"
	jass.TimerStart(t, 1, false, 0) -- ok
```

```lua
	local t = jass.CreateTimer()
	local h1 = jass.CreateTimer()
	jass.DestroyTimer(h1)
	jass.TimerStart(t, 1, false,
		function()
			local h2 = jass.CreateTimer()
			print(h1) -- "handle: 0x10005E"
			print(h2) -- "handle: 0x10005E"
		end
	)
```

#####2: handle封装在userdata中，lua持有该handle时将增加handle的引用计数。lua释放handle时会释放handle的引用计数。

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

####runtime.sleep(默认为true)
common.j中包含sleep操作的函数有4个，TriggerSleepAction/TriggerSyncReady/TriggerWaitForSound/SyncSelections。当此项为false时，lua引擎会忽略这4个函数的调用，并给予运行时警告。当此项为true时，这4个函数将会得到正确的执行。

但请注意此项为true时将降低lua引擎的运行效率，即使你没有使用这4个函数。

```lua
	local trg = jass.CreateTrigger()
	local a = 1
	jass.TriggerAddAction(trg, function()
		jass.TriggerSleepAction(0.2)
		print(a) -- 2
	end)
	jass.TriggerExecute(trg)
	a = 2
```

####runtime.catch_crash(默认为true)
调用jass.xxx/japi.xxx发生崩溃时，会生产一个lua错误，并忽略这个崩溃。你可以注册jass.runtime.error_handle来获得这个错误。注：开启此项会略微增加运行时消耗（即使没有发生错误）。
