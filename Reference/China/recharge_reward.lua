local recharge_reward = 
{
	{
		__mask = "ZAIY",
		desc = "@122285",
		item2 = 1000001,
		item3 = 20521,
		num4 = 200000,
		recharge = 60,
		type = 0
	},
	{
		__mask = "bAIY",
		desc = "@411436",
		item1 = 313800,
		item2 = 1000002,
		item3 = 10099,
		num4 = 400000,
		recharge = 360,
		type = 0
	},
	{
		__mask = "bgMQ",
		desc = "@393922",
		item1 = 32303,
		item2 = 1000003,
		item3 = 73,
		num1 = 75,
		num3 = 50,
		num4 = 600000,
		type = 0
	},
	{
		__mask = "bgMY",
		desc = "@348564",
		item1 = 15205,
		item2 = 1000004,
		item3 = 71,
		num1 = 75,
		num3 = 50,
		num4 = 800000,
		recharge = 1980,
		type = 0
	},
	{
		__mask = "bAIY",
		desc = "@70131",
		item1 = 2801,
		item2 = 1000005,
		item3 = 20522,
		num4 = 1000000,
		recharge = 6680,
		type = 2
	},
	{
		__mask = "bAMY",
		desc = "@89383",
		item1 = 315000,
		item2 = 1000006,
		item3 = 400,
		num3 = 20,
		num4 = 1500000,
		recharge = 12880,
		type = 2
	},
	{
		__mask = "bgMY",
		desc = "@295938",
		item1 = 32408,
		item2 = 1000007,
		item3 = 73,
		num1 = 100,
		num3 = 100,
		num4 = 2000000,
		recharge = 19880,
		type = 2
	},
	{
		__mask = "bgMY",
		desc = "@379437",
		item1 = 15306,
		item2 = 1000008,
		item3 = 71,
		num1 = 100,
		num3 = 100,
		num4 = 3000000,
		recharge = 28880,
		type = 2
	},
	[19] = {
		__mask = "iAGI",
		item1 = 5803,
		item4 = 0,
		num2 = 10,
		num3 = 10,
		recharge = 300
	},
	[20] = {
		__mask = "qgGI",
		item1 = 32203,
		item2 = 9202,
		item4 = 0,
		num1 = 18,
		num2 = 5,
		num3 = 20,
		recharge = 680
	},
	[21] = {
		__mask = "yACA",
		item1 = 5804,
		item3 = 70001,
		item4 = 0,
		num2 = 30
	},
	[23] = {
		__mask = "qgGI",
		item1 = 15300,
		item2 = 71,
		item4 = 0,
		num1 = 20,
		num2 = 50,
		num3 = 50,
		recharge = 3880
	},
	[24] = {
		__mask = "igGI",
		item1 = 32404,
		item4 = 0,
		num1 = 30,
		num2 = 80,
		num3 = 80,
		recharge = 6480
	}
}
local __default_values = {
	desc = "@131893",
	item1 = 2518,
	item10 = 0,
	item2 = 73,
	item3 = 41,
	item4 = 39,
	item5 = 0,
	item6 = 0,
	item7 = 0,
	item8 = 0,
	item9 = 0,
	num1 = 1,
	num10 = 0,
	num2 = 1,
	num3 = 1,
	num4 = 0,
	num5 = 0,
	num6 = 0,
	num7 = 0,
	num8 = 0,
	num9 = 0,
	recharge = 980,
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( recharge_reward ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( recharge_reward, { __default = __default_values, __hash = 0x5abc73b3, __masked = true } )
end

return recharge_reward
