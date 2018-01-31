--$cmd luaf Preload.lua
local LuaThread = LuaThread
local yield = yield
local sleep = sleep
local exit = exit

function main()
	local am = FGDKit.Core.AssetManager.sharedInstance
	yield()
	am:Preload( "Shaders/ShaderCollection", true )
	yield()
end

