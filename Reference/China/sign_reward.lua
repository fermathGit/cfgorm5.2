local __rt_1 = {
	item = 15000
}
local __rt_2 = {
	item = 41
}
local __rt_3 = {
	item = 5800,
	num = 2
}
local __rt_4 = {
	item = 73
}
local __rt_5 = {
	item = 71
}
local sign_reward = 
{
	{
		num = 10000
	},
	__rt_1,
	__rt_2,
	__rt_3,
	{
		item = 921,
		num = 20
	},
	{
		num = 20000
	},
	__rt_1,
	__rt_4,
	__rt_3,
	{
		item = 921,
		num = 40
	},
	{
		num = 30000
	},
	__rt_1,
	__rt_5,
	__rt_3,
	{
		item = 921,
		num = 60
	},
	{
		num = 40000
	},
	__rt_1,
	__rt_2,
	__rt_3,
	{
		item = 921,
		num = 80
	},
	{
		num = 50000
	},
	__rt_1,
	__rt_4,
	__rt_3,
	{
		item = 921,
		num = 100
	},
	{
		num = 100000
	},
	__rt_1,
	__rt_5,
	__rt_3,
	{
		item = 921,
		num = 150
	},
	{
		num = 200000
	}
}
local __default_values = {
	item = 39,
	num = 5,
	vip = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( sign_reward ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( sign_reward, { __default = __default_values, __hash = 0x0a239c1d, __masked = false } )
end

return sign_reward
