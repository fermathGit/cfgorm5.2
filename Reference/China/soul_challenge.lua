local soul_challenge = 
{
	[1000] = {
		__mask = "hA",
		description = "@335503",
		standard_combat = 500
	},
	[1001] = {
		__mask = "ZA",
		description = "@464393",
		monster_1 = {
			20002,
			1
		},
		monster_show = 20002
	},
	[1002] = {
		__mask = "ZA",
		description = "@209569",
		monster_1 = {
			20003,
			1
		},
		monster_show = 20003
	},
	[1003] = {
		__mask = "ZA",
		description = "@431795",
		monster_1 = {
			20004,
			1
		},
		monster_show = 20004
	},
	[1004] = {
		__mask = "ZA",
		description = "@260663",
		monster_1 = {
			20005,
			1
		},
		monster_show = 20005
	},
	[1100] = {
		__mask = "ZA",
		description = "@121948",
		monster_1 = {
			20006,
			1
		},
		monster_show = 20006
	},
	[1101] = {
		__mask = "bA",
		description = "@268095",
		finish_type = 1,
		monster_1 = {
			20007,
			1
		},
		monster_show = 20007
	},
	[1102] = {
		__mask = "ZA",
		description = "@21533",
		monster_1 = {
			20008,
			1
		},
		monster_show = 20008
	},
	[1103] = {
		__mask = "ZA",
		description = "@296976",
		monster_1 = {
			20009,
			1
		},
		monster_show = 20009
	},
	[1104] = {
		__mask = "ZA",
		description = "@455163",
		monster_1 = {
			20010,
			1
		},
		monster_show = 20010
	},
	[1105] = {
		__mask = "ZA",
		description = "@276342",
		monster_1 = {
			20011,
			1
		},
		monster_show = 20011
	},
	[1106] = {
		__mask = "ZA",
		description = "@337055",
		monster_1 = {
			20012,
			1
		},
		monster_show = 20012
	},
	[1107] = {
		__mask = "ZA",
		description = "@390780",
		monster_1 = {
			20013,
			1
		},
		monster_show = 20013
	},
	[2000] = {
		__mask = "ZA",
		description = "@29872",
		monster_1 = {
			20101,
			1
		},
		monster_show = 20101
	},
	[2001] = {
		__mask = "YA",
		monster_1 = {
			20102,
			1
		},
		monster_show = 20102
	},
	[2002] = {
		__mask = "ZA",
		description = "@44929",
		monster_1 = {
			20103,
			1
		},
		monster_show = 20103
	},
	[2003] = {
		__mask = "ZA",
		description = "@136413",
		monster_1 = {
			20104,
			1
		},
		monster_show = 20104
	},
	[2004] = {
		__mask = "ZA",
		description = "@499158",
		monster_1 = {
			20105,
			1
		},
		monster_show = 20105
	},
	[2005] = {
		__mask = "ZA",
		description = "@490758",
		monster_1 = {
			20106,
			1
		},
		monster_show = 20106
	},
	[2006] = {
		__mask = "ZA",
		description = "@17873",
		monster_1 = {
			20107,
			1
		},
		monster_show = 20107
	},
	[2007] = {
		__mask = "ZA",
		description = "@31797",
		monster_1 = {
			20108,
			1
		},
		monster_show = 20108
	},
	[2008] = {
		__mask = "ZA",
		description = "@267702",
		monster_1 = {
			20109,
			1
		},
		monster_show = 20109
	},
	[2009] = {
		__mask = "ZA",
		description = "@166443",
		monster_1 = {
			20110,
			1
		},
		monster_show = 20110
	},
	[3000] = {
		__mask = "ZA",
		description = "@353801",
		monster_1 = {
			20201,
			1
		},
		monster_show = 20201
	},
	[3001] = {
		__mask = "ZA",
		description = "@214390",
		monster_1 = {
			20202,
			1
		},
		monster_show = 20202
	},
	[3002] = {
		__mask = "ZA",
		description = "@369784",
		monster_1 = {
			20203,
			1
		},
		monster_show = 20203
	},
	[3003] = {
		__mask = "ZA",
		description = "@386874",
		monster_1 = {
			20204,
			1
		},
		monster_show = 20204
	},
	[3100] = {
		__mask = "ZA",
		description = "@312189",
		monster_1 = {
			20301,
			1
		},
		monster_show = 20301
	},
	[3101] = {
		__mask = "ZA",
		description = "@324585",
		monster_1 = {
			20302,
			1
		},
		monster_show = 20302
	},
	[3102] = {
		__mask = "ZA",
		description = "@39410",
		monster_1 = {
			20303,
			1
		},
		monster_show = 20303
	},
	[3103] = {
		__mask = "ZA",
		description = "@514893",
		monster_1 = {
			20304,
			1
		},
		monster_show = 20304
	},
	[4000] = {
		__mask = "ZA",
		description = "@296704",
		monster_1 = {
			20401,
			1
		},
		monster_show = 20401
	},
	[4001] = {
		__mask = "ZA",
		description = "@82513",
		monster_1 = {
			20402,
			1
		},
		monster_show = 20402
	}
}
local __default_values = {
	description = "@113642",
	finish_type = 0,
	model_angle = -40,
	monster_1 = {
		20001,
		1
	},
	monster_show = 20001,
	standard_combat = 1000,
	time = 120
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( soul_challenge ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( soul_challenge, { __default = __default_values, __hash = 0x484eeb5e, __masked = true } )
end

return soul_challenge
