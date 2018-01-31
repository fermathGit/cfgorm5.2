local __rt_1 = {
	810,
	1
}
local __rt_2 = {
	924,
	1
}
local __rt_3 = {
	811,
	1
}
local month_card = 
{
	{
		__mask = "iV",
		daygold = 120,
		head = "platinum",
		name = "@27373",
		preachExpAddPer = 0,
		time = 7
	},
	{
		__mask = "1a",
		dayAddItem = {
			__rt_1,
			{
				7201,
				1
			}
		},
		dec = {
			12,
			10,
			9,
			1,
			5,
			7,
			8
		},
		gold = 280,
		head = "gold",
		nowgold = 280,
		showItem = {
			__rt_3,
			{
				832,
				1
			},
			__rt_2
		},
		time = 30
	},
	{
		__mask = "XL",
		dayAddItem = {
			__rt_3,
			{
				7301,
				1
			}
		},
		daygold = 200,
		dec = {
			13,
			10,
			9,
			2,
			6,
			7,
			8
		},
		gold = 880,
		name = "@38110",
		nowgold = 880,
		showItem = {
			{
				813,
				1
			},
			{
				841,
				1
			},
			__rt_2
		}
	}
}
local __default_values = {
	dayAddItem = {
		__rt_1,
		{
			7101,
			1
		}
	},
	daygold = 100,
	dec = {
		11,
		10,
		9,
		1,
		4,
		7
	},
	expAddPer = 5,
	gold = 80,
	head = "extreme",
	name = "@254619",
	nowgold = 80,
	preachExpAddPer = 10,
	showItem = {
		__rt_1,
		{
			831,
			1
		},
		__rt_2
	},
	time = -1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( month_card ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( month_card, { __default = __default_values, __hash = 0x276e2d55, __masked = true } )
end

return month_card
