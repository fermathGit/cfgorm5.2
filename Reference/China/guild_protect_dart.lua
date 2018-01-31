local __rt_1 = {
}
local guild_protect_dart = 
{
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1
}
local __default_values = {
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( guild_protect_dart ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( guild_protect_dart, { __default = __default_values, __hash = 0x00000000, __masked = false } )
end

return guild_protect_dart
