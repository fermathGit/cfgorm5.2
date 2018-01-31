local world_lv = 
{
	{
	},
	{
		open_time = 4,
		world_lv = 79
	},
	{
		open_time = 10,
		world_lv = 89
	},
	{
		open_time = 19,
		world_lv = 99
	},
	{
		open_time = 34,
		world_lv = 109
	},
	{
		open_time = 58,
		world_lv = 114
	},
	{
		open_time = 85,
		world_lv = 119
	}
}
local __default_values = {
	open_time = 0,
	world_lv = 69
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( world_lv ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( world_lv, { __default = __default_values, __hash = 0x3052a96b, __masked = false } )
end

return world_lv
