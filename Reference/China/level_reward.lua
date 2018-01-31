local level_reward = 
{
	{
		__mask = "gAQA",
		item5 = 81,
		num5 = 10
	},
	{
		__mask = "gQaA",
		item5 = 81,
		level = 19,
		num2 = 100000,
		num4 = 15,
		num5 = 15
	},
	{
		__mask = "gQKA",
		item5 = 81,
		level = 29,
		num2 = 150000,
		num4 = 20
	},
	{
		__mask = "gQKA",
		item5 = 32201,
		level = 39,
		num2 = 200000,
		num4 = 25
	},
	{
		__mask = "gQaA",
		item5 = 32201,
		level = 49,
		num2 = 250000,
		num4 = 30,
		num5 = 25
	},
	{
		__mask = "gQaA",
		item5 = 32201,
		level = 59,
		num2 = 300000,
		num4 = 35,
		num5 = 30
	},
	{
		__mask = "gwaA",
		item5 = 32201,
		level = 69,
		num1 = 2,
		num2 = 350000,
		num4 = 40,
		num5 = 40
	},
	{
		__mask = "AwKA",
		level = 79,
		num1 = 2,
		num2 = 400000,
		num4 = 45
	},
	{
		__mask = "AwaA",
		level = 89,
		num1 = 2,
		num2 = 450000,
		num4 = 50,
		num5 = 25
	},
	{
		__mask = "AwaA",
		level = 99,
		num1 = 2,
		num2 = 500000,
		num4 = 55,
		num5 = 30
	},
	{
		__mask = "AwaA",
		level = 109,
		num1 = 3,
		num2 = 550000,
		num4 = 60,
		num5 = 35
	},
	{
		__mask = "AwaA",
		level = 114,
		num1 = 3,
		num2 = 600000,
		num4 = 65,
		num5 = 40
	},
	{
		__mask = "AwaA",
		level = 119,
		num1 = 3,
		num2 = 650000,
		num4 = 70,
		num5 = 50
	}
}
local __default_values = {
	item1 = 924,
	item10 = 0,
	item2 = 39,
	item3 = 799,
	item4 = 41,
	item5 = 32307,
	item6 = 0,
	item7 = 0,
	item8 = 0,
	item9 = 0,
	level = 9,
	num1 = 1,
	num10 = 0,
	num2 = 50000,
	num3 = 10,
	num4 = 10,
	num5 = 20,
	num6 = 0,
	num7 = 0,
	num8 = 0,
	num9 = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( level_reward ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( level_reward, { __default = __default_values, __hash = 0x2c88c95c, __masked = true } )
end

return level_reward
