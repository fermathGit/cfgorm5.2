local __rt_1 = {
	__mask = "C",
	costItemNum = 2
}
local __rt_2 = {
	__mask = "C",
	costItemNum = 4
}
local __rt_3 = {
	__mask = "A"
}
local __rt_4 = {
	__mask = "C",
	costItemNum = 6
}
local __rt_5 = {
	__mask = "C",
	costItemNum = 10
}
local __rt_6 = {
	__mask = "C",
	costItemNum = 12
}
local __rt_7 = {
	__mask = "C",
	costItemNum = 14
}
local __rt_8 = {
	__mask = "C",
	costItemNum = 16
}
local __rt_9 = {
	__mask = "C",
	costItemNum = 18
}
local __rt_10 = {
	__mask = "C",
	costItemNum = 20
}
local __rt_11 = {
	__mask = "C",
	costItemNum = 22
}
local __rt_12 = {
	__mask = "C",
	costItemNum = 24
}
local pet_practicecost = 
{
	[10] = {
		__mask = "C",
		costItemNum = 1
	},
	[11] = __rt_1,
	[12] = __rt_2,
	[13] = __rt_3,
	[20] = __rt_1,
	[21] = __rt_4,
	[22] = __rt_3,
	[23] = __rt_5,
	[30] = {
		__mask = "C",
		costItemNum = 3
	},
	[31] = __rt_3,
	[32] = __rt_5,
	[33] = __rt_6,
	[40] = __rt_2,
	[41] = __rt_5,
	[42] = __rt_6,
	[43] = __rt_7,
	[50] = {
		__mask = "C",
		costItemNum = 5
	},
	[51] = __rt_6,
	[52] = __rt_7,
	[53] = __rt_8,
	[60] = __rt_4,
	[61] = __rt_7,
	[62] = __rt_8,
	[63] = __rt_9,
	[70] = {
		__mask = "C",
		costItemNum = 7
	},
	[71] = __rt_8,
	[72] = __rt_9,
	[73] = __rt_10,
	[80] = __rt_3,
	[81] = __rt_9,
	[82] = __rt_10,
	[83] = __rt_11,
	[90] = {
		__mask = "C",
		costItemNum = 9
	},
	[91] = __rt_10,
	[92] = __rt_11,
	[93] = __rt_12,
	[100] = __rt_5,
	[101] = __rt_11,
	[102] = __rt_12,
	[103] = {
		__mask = "C",
		costItemNum = 26
	}
}
local __default_values = {
	costItemDataId = 400,
	costItemNum = 8,
	costMoneyNum = 0,
	costMoneyType = 3
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( pet_practicecost ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( pet_practicecost, { __default = __default_values, __hash = 0x70e98cce, __masked = true } )
end

return pet_practicecost
