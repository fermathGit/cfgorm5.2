local __rt_1 = {
	1,
	2,
	1
}
local __rt_2 = {
	0.25,
	0.25,
	0.25,
	0.25
}
local __rt_3 = {
	1,
	2,
	2,
	1
}
local __rt_4 = {
	0.2,
	0.2,
	0.2,
	0.2,
	0.2
}
local __rt_5 = {
	1,
	2,
	3,
	2,
	1
}
local turnplate = 
{
	{
		__mask = "OE",
		number = 3,
		pile = __rt_1,
		reward = {
			88,
			98,
			88
		},
		weight = {
			0.15,
			0.7,
			0.15
		}
	},
	{
		__mask = "HE",
		cost = 88,
		number = 3,
		pile = __rt_1,
		weight = {
			0.3,
			0.4,
			0.3
		}
	},
	{
		__mask = "PE",
		cost = 168,
		number = 4,
		pile = __rt_3,
		reward = {
			208,
			268,
			268,
			208
		},
		weight = __rt_2
	},
	{
		__mask = "vE",
		cost = 328,
		number = 4,
		pile = __rt_3,
		reward = {
			368,
			428,
			428,
			368
		},
		speed = 340,
		weight = __rt_2
	},
	{
		__mask = "pA",
		cost = 628,
		reward = {
			808,
			828,
			888,
			828,
			808
		},
		speed = 360
	},
	{
		__mask = "pA",
		cost = 1688,
		reward = {
			2288,
			2488,
			2888,
			2488,
			2288
		},
		speed = 380
	},
	{
		__mask = "pA",
		cost = 3888,
		reward = {
			4288,
			4488,
			4888,
			4488,
			4288
		},
		speed = 400
	},
	{
		__mask = "pA",
		cost = 6888,
		reward = {
			8288,
			8488,
			8888,
			8488,
			8288
		},
		speed = 400
	}
}
local __default_values = {
	cost = 0,
	number = 5,
	pile = __rt_5,
	reward = {
		138,
		158,
		138
	},
	reward_type = 3,
	speed = 320,
	start = 1.5,
	type = 3,
	weight = __rt_4
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( turnplate ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( turnplate, { __default = __default_values, __hash = 0x111c77e6, __masked = true } )
end

return turnplate
