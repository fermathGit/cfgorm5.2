local wild_coordinates = 
{
	{
		coordinates = {
			{
				54,
				81
			},
			{
				40,
				49
			},
			{
				97,
				62
			},
			{
				42,
				20
			},
			{
				102,
				15
			}
		},
		map = "@499116"
	},
	{
		coordinates = {
			{
				153,
				64
			},
			{
				116,
				33
			},
			{
				150,
				42
			},
			{
				110,
				153
			},
			{
				130,
				58
			}
		},
		lv_max = 49,
		lv_min = 40,
		map = "@433901",
		map_id = 5
	},
	{
		coordinates = {
			{
				112,
				69
			},
			{
				130,
				65
			},
			{
				63,
				68
			}
		},
		lv_max = 59,
		lv_min = 50,
		map = "@317687",
		map_id = 6
	},
	{
		lv_max = 69,
		lv_min = 60,
		map = "@499276",
		map_id = 7
	},
	{
		coordinates = {
			{
				78,
				63
			},
			{
				133,
				105
			},
			{
				133,
				38
			},
			{
				141,
				88
			},
			{
				78,
				89
			}
		},
		lv_max = 79,
		lv_min = 70,
		map = "@311438",
		map_id = 8
	},
	{
		coordinates = {
			{
				120,
				119
			},
			{
				88,
				45
			}
		},
		lv_max = 89,
		lv_min = 80,
		map = "@413472",
		map_id = 9
	},
	{
		coordinates = {
			{
				77,
				18
			},
			{
				110,
				59
			},
			{
				147,
				55
			},
			{
				132,
				88
			},
			{
				148,
				110
			}
		},
		lv_max = 99,
		lv_min = 90,
		map = "@231438",
		map_id = 10
	},
	{
		coordinates = {
			{
				95,
				84
			},
			{
				158,
				70
			},
			{
				158,
				100
			},
			{
				114,
				144
			},
			{
				36,
				96
			}
		},
		lv_max = 109,
		lv_min = 100,
		map = "@452876",
		map_id = 11
	},
	{
		coordinates = {
			{
				67,
				29
			},
			{
				58,
				125
			},
			{
				56,
				94
			},
			{
				30,
				118
			},
			{
				88,
				78
			}
		},
		lv_max = 114,
		lv_min = 110,
		map_id = 12
	},
	{
		coordinates = {
			{
				128,
				139
			},
			{
				127,
				104
			},
			{
				98,
				70
			},
			{
				118,
				27
			},
			{
				27,
				45
			}
		},
		lv_max = 119,
		lv_min = 115,
		map = "@279894",
		map_id = 13
	}
}
local __default_values = {
	coordinates = {
		{
			104,
			100
		},
		{
			70,
			122
		},
		{
			62,
			48
		},
		{
			78,
			18
		},
		{
			108,
			138
		}
	},
	lv_max = 39,
	lv_min = 30,
	map = "@211576",
	map_id = 4
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( wild_coordinates ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( wild_coordinates, { __default = __default_values, __hash = 0x66a27850, __masked = false } )
end

return wild_coordinates
