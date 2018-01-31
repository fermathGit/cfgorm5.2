local Root = "L:/Client"

if io and io.popen and not LuaTinker then
	local cd = io.popen( "cd" ):read( '*l' )
	print( "cd: "..cd )
	local s, e = string.find( cd, "Client" )
	if e then
		Root = string.sub( cd, 1, e )
	end
end

if arg and arg[1] then
	Root = arg[1]
end

Root = string.gsub( Root, '\\', '/' )
local DatabaseRoot = Root.."/Assets/StreamingAssets/Database"
local LuaRoot = Root.."/Assets/StreamingAssets/LuaRoot"

print( "project root: "..Root )
print( "lua root: "..LuaRoot )
print( "database root: "..DatabaseRoot )

return {
	Path = Root,
	LuaRoot = LuaRoot,
	DatabaseRoot = DatabaseRoot,
}

