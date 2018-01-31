local __rt_1 = {
}
local __rt_2 = {
	cost = 15
}
local __rt_3 = {
	cost = 20
}
local arena_refresh = 
{
	{
		cost = 0,
		type = 1
	},
	{
		cost = 1
	},
	{
		cost = 2
	},
	{
		cost = 5
	},
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3
}
local __default_values = {
	cost = 10,
	type = 3
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( arena_refresh ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( arena_refresh, { __default = __default_values, __hash = 0x1e1f7fd8, __masked = false } )
end

return arena_refresh
