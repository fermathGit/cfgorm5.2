local __rt_1 = {
	{
		20,
		100
	},
	{
		34,
		100
	},
	{
		23,
		0.05
	},
	{
		22,
		0.05
	}
}
local player_wardrobe = 
{
	{
		__mask = "CtA",
		forever = 6880,
		month = 888,
		property = {
			{
				14,
				100
			},
			{
				16,
				100
			},
			{
				15,
				0.05
			},
			{
				17,
				0.05
			}
		},
		sevenday = 268,
		sort = 3
	},
	{
		__mask = "cmA",
		icon_man = 90022,
		icon_woman = 90021,
		model = 102,
		name = "@195444",
		property = {
			{
				18,
				100
			},
			{
				47,
				100
			},
			{
				25,
				0.05
			},
			{
				26,
				0.05
			}
		},
		sort = 5
	},
	{
		__mask = "eLA",
		forever = 2880,
		icon_man = 90032,
		icon_woman = 90031,
		model = 103,
		month = 328,
		name = "@62834",
		sevenday = 88
	},
	{
		__mask = "frB",
		describe = "@391202",
		forever = 4880,
		icon_man = 90042,
		icon_woman = 90041,
		model = 104,
		month = 588,
		name = "@225401",
		sevenday = 168,
		sort = 10,
		special = 1
	},
	{
		__mask = "ciA",
		icon_man = 90052,
		icon_woman = 90051,
		model = 105,
		name = "@387727",
		sort = 4
	}
}
local __default_values = {
	describe = "@402058",
	forever = 8880,
	icon_man = 90012,
	icon_woman = 90011,
	model = 101,
	money = 2,
	month = 1280,
	name = "@170752",
	property = __rt_1,
	sevenday = 398,
	show = 0,
	sort = 1,
	special = 0,
	subtype = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( player_wardrobe ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( player_wardrobe, { __default = __default_values, __hash = 0x33fc1429, __masked = true } )
end

return player_wardrobe
