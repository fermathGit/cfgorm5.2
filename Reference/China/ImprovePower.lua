local __rt_1 = {
	1,
	1,
	200
}
local __rt_2 = {
	1,
	1,
	6
}
local __rt_3 = {
	2,
	1,
	10
}
local __rt_4 = {
	2200,
	0
}
local ImprovePower = 
{
	[100] = {
		Description = "@288984",
		Relation_UI = {
			100,
			0
		},
		__mask = "SB",
		name = "@290423"
	},
	[200] = {
		Description = "@480301",
		Relation_UI = {
			503,
			0
		},
		Type = 3,
		__mask = "XD",
		allParameter = __rt_2,
		icon = 100200,
		name = "@291354"
	},
	[201] = {
		Description = "@478181",
		Relation_UI = {
			504,
			0
		},
		Type = 4,
		__mask = "XD",
		allParameter = {
			1,
			1,
			30
		},
		icon = 100201,
		name = "@246786"
	},
	[202] = {
		Description = "@39321",
		Relation_UI = {
			505,
			0
		},
		Type = 5,
		__mask = "XD",
		allParameter = __rt_2,
		icon = 100202,
		name = "@86878"
	},
	[203] = {
		Description = "@40981",
		Relation_UI = {
			501,
			0
		},
		Type = 6,
		__mask = "WD",
		icon = 100203,
		name = "@234362"
	},
	[300] = {
		Description = "@313618",
		Relation_UI = {
			2002,
			0
		},
		Type = 7,
		__mask = "XD",
		allParameter = __rt_3,
		icon = 100300,
		name = "@292145"
	},
	[301] = {
		Description = "@454807",
		Relation_UI = {
			2000,
			0
		},
		Type = 8,
		__mask = "XD",
		allParameter = {
			1,
			1,
			12
		},
		icon = 100301,
		name = "@19416"
	},
	[400] = {
		Description = "@234992",
		Relation_UI = {
			2600,
			0
		},
		Type = 9,
		__mask = "XD",
		allParameter = {
			1,
			1,
			60
		},
		icon = 100400,
		name = "@410699"
	},
	[500] = {
		Description = "@318700",
		Relation_UI = {
			502,
			0
		},
		Type = 10,
		__mask = "XD",
		allParameter = {
			1,
			1,
			10
		},
		icon = 100500,
		name = "@25436"
	},
	[600] = {
		Description = "@26960",
		Relation_UI = {
			2100,
			0
		},
		Type = 11,
		__mask = "XD",
		allParameter = __rt_3,
		icon = 100600,
		name = "@367087"
	},
	[700] = {
		Description = "@473879",
		Relation_UI = {
			2500,
			0
		},
		Type = 12,
		__mask = "WD",
		icon = 100700,
		name = "@246748"
	},
	[800] = {
		Description = "@229230",
		Type = 15,
		__mask = "GC",
		icon = 100800
	},
	[801] = {
		Description = "@380260",
		Type = 16,
		__mask = "XC",
		allParameter = __rt_2,
		icon = 100801,
		name = "@3813"
	},
	[900] = {
		Relation_UI = {
			3100,
			0
		},
		Type = 17,
		__mask = "VD",
		allParameter = {
			1,
			1,
			100
		},
		icon = 100900,
		name = "@438678"
	},
	[1000] = {
		Description = "@497244",
		Relation_UI = {
			400,
			0
		},
		Type = 18,
		__mask = "WD",
		icon = 101000,
		name = "@24983"
	}
}
local __default_values = {
	Description = "@156306",
	Relation_UI = __rt_4,
	Type = 1,
	allParameter = __rt_1,
	icon = 100100,
	level = 20,
	name = "@126277",
	parameterType = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( ImprovePower ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( ImprovePower, { __default = __default_values, __hash = 0x6cffb763, __masked = true } )
end

return ImprovePower
