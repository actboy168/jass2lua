ydwe lua引擎使用说明

1. 简介
ydwe lua引擎(以下简称lua引擎)是一个嵌入到《魔兽争霸III》(以下简称魔兽)中的一个插件，它可以让魔兽可以执行lua并且调用魔兽的导出函数(在common.j内定义的函数)，就像使用jass那样。本说明假定你已经掌握了jass和lua的相关语法，有关语法的问题不再另行解释。

2. 入口
在jass内调用'call Cheat("run hello.lua")'，这等价于在lua里调用了"require 'hello.lua'"。lua引擎已经把地图内的文件加载到搜索路径，所以地图内的hello.lua将会得到执行。

3. lua引擎对标准lua的修改
为了适合在魔兽内使用lua引擎对lua略有修改。
	1. 支持字符型整数。|AHbz|表示一个整数，其值和jass内的'AHbz'相等。
	2. math.randomseed改为使用jass函数SetRandomSeed实现。
	3. math.random改为使用jass函数GetRandomReal实现。
	4. table元素随机化种子依赖于魔兽内部的随机种子。

4. 内置库
lua引擎一共有5个内置库，可以通过"require '库名'"调用。5个内置库分别为jass.common、jass.japi、jass.hook、jass.runtime、jass.slk。

5. jass.common
jass.common库包含common.j内注册的所有函数。
例
	local jass = require 'jass.common'
	print(jass.GetHandleId(jass.Player(0)))
	
特别的,你可以通过jass.common库来访问jass中的自定义变量
例
	local jass = require 'jass.common'
	jass.udg_code = function() --将一个jass中定义的code变量赋值为一个lua函数
		print(jass.udg_strings[2]) --获取jass中定义的string数组
	end
	
你可以通过这个方式来实现和jass脚本之间的数据交互
注意，你无法通过这个方式来访问jass中的自定义函数。也就是说，你无法带着参数来调用对方的函数，但通过code变量可以不带参数的来调用
在上面的例子中,你可以在jass中执行:
	
	call TimerStart(CreateTimer(), 1, true, udg_code)
	
这个计时器将在每次到期时正确的回调你在lua中定义的函数

6. jass.japi
jass.japi库当前已经注册的所有japi函数。
例
	local jass = require 'jass.common'
	local japi = require 'jass.japi'
	japi.EXDisplayChat(jass.Player(0), 0, "Hello!")
	
你也可以在jass中通过native的方式注册japi函数，以便你在jass中调用它们
例
	native EXDisplayChat takes player p, type i, string text returns nothing
	call EXDisplayChat(Player(0), 0, "Hello!")

7. jass.hook
jass.hook库可以对common.j内注册的函数下钩子。注：jass.common库不会受到影响。
例
	local hook = require 'jass.hook'
	function hook.CreateUnit(pid, uid, x, y, face, realCreateUnit)
		-- 当jass内调用CreateUnit时，就会被执行
		print('CreateUnit')
		return realCreateUnit(pid, uid, x, y, face)
	end

8. jass.slk
jass.slk库可以在地图运行时读取地图内的slk/w3*文件。
例
	local slk = require 'jass.slk'
	print(slk.ability.AHbz.Name)
	
slk包含unit, item, destructable, doodad, ability, buff, upgrade，与你物体编辑器中的项目一一对应。
获取数据时使用的索引你可以在物体编辑器中通过Ctrl+D来查询到
注意，当访问正确时返回值永远是字符串。如果你获取的是某个单位的生命值，你可能需要使用tonumber来进行转换。当访问不正确时将返回nil。

9. jass.runtime
jass.runtime库可以在地图运行时获取lua引擎的信息或修改lua引擎的部分配置。
例
	local runtime = require 'jass.runtime'
	runtime.console = true --打开一个cmd窗口，print函数会将文本显示在这里
	runtime.console = false --关闭cmd窗口
	runtime.version -- 1 --当前lua引擎的版本号
	runtime.error_handle = function(msg) --当你的lua脚本出现错误时将回调此函数。注意，注册此函数后lua脚本的效率会降低，即使并没有发生错误。如果你不注册此函数，脚本出现错误也会在cmd窗口中显示提示，只是没有调用栈了。
		print("---------------------------------------")
		print("              LUA ERROR!!              ")
		print("---------------------------------------")
		print(tostring(msg) .. "\n")
		print(debug.traceback())
		print("---------------------------------------")
	end
	runtime.handle_level = 2 --lua的句柄等级，目前有3个可选值：0，1，2。当你分别使用0，1，2时，lua脚本的效率将依次降低，但是安全性会依次增加。这个值默认为2
		--0：handle直接使用number，jass无法了解你在lua中对这个handle的引用情况，不会通过增加引用计数来保护这个handle
		例
			local t = jass.CreateTimer()
			print(t) -- 1048000
			type(t) -- "number"
		--1: handle封装在lightuserdata中，0可以隐转为nil，同样不会增加这个handle的引用计数
		例1
			local t = jass.CreateTimer()
			print(t) -- "handle: 0x10005D"
			type(t) -- "userdata"
			jass.TimerStart(t, 1, false, 0) -- ok
		
		例2
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
		--2: handle封装在userdata中，lua持有该handle时将增加handle的引用计数。当然，函数结束后局部变量会自动回收并释放对handle的引用。
		例
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
	runtime.sleep = true (默认值为true)
	common.j中包含sleep操作的函数有4个，TriggerSleepAction/TriggerSyncReady/TriggerWaitForSound/SyncSelections。当此项关闭时，lua引擎会忽略这4个函数的调用，并给予运行时警告。当此项开启时，这4个函数将会得到正确的执行。
	但请注意开启此项将降低lua引擎的运行效率，即使你没有使用这4个函数。

		例
			local trg = jass.CreateTrigger()
			local a = 1
			jass.TriggerAddAction(trg, function()
				jass.TriggerSleepAction(0.2)
				print(a) -- 2
			end)
			jass.TriggerExecute(trg)
			a = 2