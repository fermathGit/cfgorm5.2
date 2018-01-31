local gem_bonus = 
{
	[10] = {
	},
	[20] = {
		bonus_prop = {
			{
				15,
				0.01
			},
			{
				17,
				0.01
			}
		}
	},
	[30] = {
		bonus_prop = {
			{
				15,
				0.015
			},
			{
				17,
				0.015
			}
		}
	},
	[40] = {
		bonus_prop = {
			{
				15,
				0.02
			},
			{
				17,
				0.02
			}
		}
	},
	[50] = {
		bonus_prop = {
			{
				15,
				0.025
			},
			{
				17,
				0.025
			}
		}
	},
	[60] = {
		bonus_prop = {
			{
				15,
				0.03
			},
			{
				17,
				0.03
			}
		}
	},
	[70] = {
		bonus_prop = {
			{
				15,
				0.035
			},
			{
				17,
				0.035
			}
		}
	},
	[80] = {
		bonus_prop = {
			{
				15,
				0.04
			},
			{
				17,
				0.04
			}
		}
	},
	[90] = {
		bonus_prop = {
			{
				15,
				0.045
			},
			{
				17,
				0.045
			}
		}
	},
	[100] = {
		bonus_prop = {
			{
				15,
				0.05
			},
			{
				17,
				0.05
			}
		}
	},
	[110] = {
		bonus_prop = {
			{
				15,
				0.055
			},
			{
				17,
				0.055
			}
		}
	},
	[120] = {
		bonus_prop = {
			{
				15,
				0.06
			},
			{
				17,
				0.06
			}
		}
	},
	[130] = {
		bonus_prop = {
			{
				15,
				0.065
			},
			{
				17,
				0.065
			}
		}
	},
	[140] = {
		bonus_prop = {
			{
				15,
				0.07
			},
			{
				17,
				0.07
			}
		}
	},
	[150] = {
		bonus_prop = {
			{
				15,
				0.075
			},
			{
				17,
				0.075
			}
		}
	},
	[160] = {
		bonus_prop = {
			{
				15,
				0.08
			},
			{
				17,
				0.08
			}
		}
	},
	[170] = {
		bonus_prop = {
			{
				15,
				0.085
			},
			{
				17,
				0.085
			}
		}
	},
	[180] = {
		bonus_prop = {
			{
				15,
				0.09
			},
			{
				17,
				0.09
			}
		}
	},
	[190] = {
		bonus_prop = {
			{
				15,
				0.095
			},
			{
				17,
				0.095
			}
		}
	},
	[200] = {
		bonus_prop = {
			{
				15,
				0.1
			},
			{
				17,
				0.1
			}
		}
	},
	[210] = {
		bonus_prop = {
			{
				15,
				0.11
			},
			{
				17,
				0.11
			}
		}
	},
	[220] = {
		bonus_prop = {
			{
				15,
				0.12
			},
			{
				17,
				0.12
			}
		}
	},
	[230] = {
		bonus_prop = {
			{
				15,
				0.13
			},
			{
				17,
				0.13
			}
		}
	},
	[240] = {
		bonus_prop = {
			{
				15,
				0.14
			},
			{
				17,
				0.14
			}
		}
	},
	[250] = {
		bonus_prop = {
			{
				15,
				0.15
			},
			{
				17,
				0.15
			}
		}
	},
	[260] = {
		bonus_prop = {
			{
				15,
				0.16
			},
			{
				17,
				0.16
			}
		}
	},
	[270] = {
		bonus_prop = {
			{
				15,
				0.17
			},
			{
				17,
				0.17
			}
		}
	},
	[280] = {
		bonus_prop = {
			{
				15,
				0.18
			},
			{
				17,
				0.18
			}
		}
	},
	[290] = {
		bonus_prop = {
			{
				15,
				0.19
			},
			{
				17,
				0.19
			}
		}
	},
	[300] = {
		bonus_prop = {
			{
				15,
				0.2
			},
			{
				17,
				0.2
			}
		}
	},
	[310] = {
		bonus_prop = {
			{
				15,
				0.22
			},
			{
				17,
				0.22
			}
		}
	},
	[320] = {
		bonus_prop = {
			{
				15,
				0.24
			},
			{
				17,
				0.24
			}
		}
	},
	[330] = {
		bonus_prop = {
			{
				15,
				0.26
			},
			{
				17,
				0.26
			}
		}
	},
	[340] = {
		bonus_prop = {
			{
				15,
				0.28
			},
			{
				17,
				0.28
			}
		}
	},
	[350] = {
		bonus_prop = {
			{
				15,
				0.3
			},
			{
				17,
				0.3
			}
		}
	},
	[360] = {
		bonus_prop = {
			{
				15,
				0.32
			},
			{
				17,
				0.32
			}
		}
	},
	[370] = {
		bonus_prop = {
			{
				15,
				0.34
			},
			{
				17,
				0.34
			}
		}
	},
	[380] = {
		bonus_prop = {
			{
				15,
				0.36
			},
			{
				17,
				0.36
			}
		}
	},
	[390] = {
		bonus_prop = {
			{
				15,
				0.38
			},
			{
				17,
				0.38
			}
		}
	},
	[400] = {
		bonus_prop = {
			{
				15,
				0.4
			},
			{
				17,
				0.4
			}
		}
	}
}
local __default_values = {
	bonus_prop = {
		{
			15,
			0.005
		},
		{
			17,
			0.005
		}
	}
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( gem_bonus ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( gem_bonus, { __default = __default_values, __hash = 0x3529c371, __masked = false } )
end

return gem_bonus
