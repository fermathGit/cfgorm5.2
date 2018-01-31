local land_reward = 
{
	{
		__mask = "BA",
		item1 = 20400
	},
	{
		__mask = "ZF",
		item1 = 2501,
		key = 1,
		land = 2,
		num2 = 100000,
		pic = 2
	},
	{
		__mask = "RF",
		item1 = 6101,
		land = 3,
		num2 = 150000,
		pic = 3
	},
	{
		__mask = "YF",
		key = 1,
		land = 4,
		num2 = 200000,
		pic = 4
	},
	{
		__mask = "RF",
		item1 = 2801,
		land = 5,
		num2 = 250000,
		pic = 5
	},
	{
		__mask = "RF",
		item1 = 73400,
		land = 6,
		num2 = 300000,
		pic = 6
	},
	{
		__mask = "ZF",
		item1 = 20402,
		key = 1,
		land = 7,
		num2 = 350000,
		pic = 7
	},
	{
		__mask = "RF",
		item1 = 2505,
		land = 8,
		num2 = 400000,
		pic = 8
	},
	{
		__mask = "RF",
		item1 = 2805,
		land = 9,
		num2 = 450000,
		pic = 9
	},
	{
		__mask = "ZF",
		item1 = 20403,
		key = 1,
		land = 10,
		num2 = 500000,
		pic = 10
	},
	{
		__mask = "RF",
		item1 = 323100,
		land = 11,
		num2 = 550000,
		pic = 11
	},
	{
		__mask = "RF",
		item1 = 1305,
		land = 12,
		num2 = 600000,
		pic = 12
	},
	{
		__mask = "RF",
		item1 = 2810,
		land = 13,
		num2 = 650000,
		pic = 13
	},
	{
		__mask = "ZF",
		item1 = 6107,
		key = 1,
		land = 14,
		num2 = 700000,
		pic = 14
	}
}
local __default_values = {
	item1 = 1304,
	item2 = 39,
	item3 = 405,
	key = 0,
	land = 1,
	num1 = 1,
	num2 = 50000,
	num3 = 5,
	pic = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( land_reward ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( land_reward, { __default = __default_values, __hash = 0x5192bfdb, __masked = true } )
end

return land_reward
