local achievementDaily = 
{
	{
	},
	{
		level = 60,
		maxLevel = 69
	},
	{
		level = 70,
		maxLevel = 79
	},
	{
		level = 80,
		maxLevel = 89
	},
	{
		level = 90,
		maxLevel = 99
	},
	{
		level = 100,
		maxLevel = 109
	},
	{
		level = 110,
		maxLevel = 114
	},
	{
		level = 115,
		maxLevel = 119
	},
	{
		level = 120,
		maxLevel = 200
	}
}
local __default_values = {
	level = 1,
	maxLevel = 59,
	num = 20
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( achievementDaily ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( achievementDaily, { __default = __default_values, __hash = 0x56cda1e8, __masked = false } )
end

return achievementDaily
