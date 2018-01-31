local __rt_1 = {
	{
		5800,
		1
	},
	{
		41,
		20
	},
	{
		922,
		1
	},
	{
		51204,
		1
	}
}
local __rt_2 = {
	{
		5801,
		1
	},
	{
		73,
		20
	},
	{
		922,
		3
	},
	{
		51204,
		2
	}
}
local __rt_3 = {
	{
		5801,
		2
	},
	{
		71,
		20
	},
	{
		922,
		6
	},
	{
		53304,
		2
	}
}
local daybuy = 
{
	{
		__mask = "A"
	},
	{
		__mask = "q",
		buyMoneyValue = 30,
		item = 4112,
		show_item = __rt_2
	},
	{
		__mask = "q",
		buyMoneyValue = 60,
		item = 4113,
		show_item = __rt_3
	},
	{
		__mask = "M",
		day = 2,
		item = 4114
	},
	{
		__mask = "u",
		buyMoneyValue = 30,
		day = 2,
		item = 4115,
		show_item = __rt_2
	},
	{
		__mask = "u",
		buyMoneyValue = 60,
		day = 2,
		item = 4116,
		show_item = __rt_3
	},
	{
		__mask = "M",
		day = 3,
		item = 4117
	},
	{
		__mask = "u",
		buyMoneyValue = 30,
		day = 3,
		item = 4118,
		show_item = __rt_2
	},
	{
		__mask = "u",
		buyMoneyValue = 60,
		day = 3,
		item = 4119,
		show_item = __rt_3
	},
	{
		__mask = "M",
		day = 4,
		item = 4120
	},
	{
		__mask = "u",
		buyMoneyValue = 30,
		day = 4,
		item = 4121,
		show_item = __rt_2
	},
	{
		__mask = "u",
		buyMoneyValue = 60,
		day = 4,
		item = 4122,
		show_item = __rt_3
	},
	{
		__mask = "M",
		day = 5,
		item = 4123
	},
	{
		__mask = "u",
		buyMoneyValue = 30,
		day = 5,
		item = 4124,
		show_item = __rt_2
	},
	{
		__mask = "u",
		buyMoneyValue = 60,
		day = 5,
		item = 4125,
		show_item = __rt_3
	},
	{
		__mask = "M",
		day = 6,
		item = 4126
	},
	{
		__mask = "u",
		buyMoneyValue = 30,
		day = 6,
		item = 4127,
		show_item = __rt_2
	},
	{
		__mask = "u",
		buyMoneyValue = 60,
		day = 6,
		item = 4128,
		show_item = __rt_3
	},
	{
		__mask = "M",
		day = 7,
		item = 4129
	},
	{
		__mask = "u",
		buyMoneyValue = 30,
		day = 7,
		item = 4130,
		show_item = __rt_2
	},
	{
		__mask = "u",
		buyMoneyValue = 60,
		day = 7,
		item = 4131,
		show_item = __rt_3
	}
}
local __default_values = {
	buyMoneyType = 2,
	buyMoneyValue = 10,
	day = 1,
	item = 4111,
	num = 1,
	show_item = __rt_1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( daybuy ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( daybuy, { __default = __default_values, __hash = 0x20b3dfc7, __masked = true } )
end

return daybuy
