local single_tower_rew = 
{
	{
		star_rew = {
			{
				81,
				5
			},
			{
				5800,
				2
			}
		}
	},
	{
		star = 6,
		star_rew = {
			{
				81,
				10
			},
			{
				5800,
				4
			}
		}
	},
	{
		star = 9,
		star_rew = {
			{
				81,
				15
			},
			{
				5800,
				6
			}
		}
	},
	{
		star = 12,
		star_rew = {
			{
				81,
				20
			},
			{
				5800,
				8
			}
		}
	},
	{
		star = 18,
		star_rew = {
			{
				81,
				25
			},
			{
				5800,
				10
			}
		}
	},
	{
		star = 24,
		star_rew = {
			{
				81,
				30
			},
			{
				5800,
				12
			}
		}
	},
	{
		star = 30,
		star_rew = {
			{
				81,
				35
			},
			{
				5800,
				14
			}
		}
	},
	{
		star = 36,
		star_rew = {
			{
				81,
				40
			},
			{
				5800,
				16
			}
		}
	},
	{
		star = 42,
		star_rew = {
			{
				81,
				45
			},
			{
				5800,
				18
			}
		}
	},
	{
		star = 48,
		star_rew = {
			{
				81,
				50
			},
			{
				5800,
				20
			}
		}
	},
	{
		star = 54,
		star_rew = {
			{
				81,
				55
			},
			{
				5800,
				22
			}
		}
	},
	{
		star = 60,
		star_rew = {
			{
				81,
				60
			},
			{
				5800,
				24
			}
		}
	},
	{
		star = 66,
		star_rew = {
			{
				81,
				65
			},
			{
				5800,
				26
			}
		}
	},
	{
		star = 72,
		star_rew = {
			{
				81,
				70
			},
			{
				5800,
				28
			}
		}
	},
	{
		star = 78,
		star_rew = {
			{
				81,
				75
			},
			{
				5800,
				30
			}
		}
	},
	{
		star = 84,
		star_rew = {
			{
				81,
				80
			},
			{
				5800,
				32
			}
		}
	},
	{
		star = 90,
		star_rew = {
			{
				81,
				85
			},
			{
				5800,
				34
			}
		}
	},
	{
		star = 96,
		star_rew = {
			{
				81,
				90
			},
			{
				5800,
				36
			}
		}
	},
	{
		star = 102,
		star_rew = {
			{
				81,
				95
			},
			{
				5800,
				38
			}
		}
	},
	{
		star = 108
	},
	{
		star = 114,
		star_rew = {
			{
				81,
				105
			},
			{
				5800,
				42
			}
		}
	},
	{
		star = 120,
		star_rew = {
			{
				81,
				110
			},
			{
				5800,
				44
			}
		}
	},
	{
		star = 126,
		star_rew = {
			{
				81,
				115
			},
			{
				5800,
				46
			}
		}
	},
	{
		star = 132,
		star_rew = {
			{
				81,
				120
			},
			{
				5800,
				48
			}
		}
	},
	{
		star = 138,
		star_rew = {
			{
				81,
				125
			},
			{
				5800,
				50
			}
		}
	},
	{
		star = 144,
		star_rew = {
			{
				81,
				130
			},
			{
				5800,
				52
			}
		}
	},
	{
		star = 150,
		star_rew = {
			{
				81,
				135
			},
			{
				5800,
				54
			}
		}
	},
	{
		star = 156,
		star_rew = {
			{
				81,
				140
			},
			{
				5800,
				56
			}
		}
	},
	{
		star = 162,
		star_rew = {
			{
				81,
				145
			},
			{
				5800,
				58
			}
		}
	},
	{
		star = 168,
		star_rew = {
			{
				81,
				150
			},
			{
				5800,
				60
			}
		}
	},
	{
		star = 174,
		star_rew = {
			{
				81,
				155
			},
			{
				5800,
				62
			}
		}
	},
	{
		star = 180,
		star_rew = {
			{
				81,
				160
			},
			{
				5800,
				64
			}
		}
	}
}
local __default_values = {
	star = 3,
	star_rew = {
		{
			81,
			100
		},
		{
			5800,
			40
		}
	}
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( single_tower_rew ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( single_tower_rew, { __default = __default_values, __hash = 0x02def87a, __masked = false } )
end

return single_tower_rew
