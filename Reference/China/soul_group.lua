local __rt_1 = {
	0
}
local soul_group = 
{
	[100001] = {
		__mask = "H",
		groupId = 1000,
		max = 5,
		name = "@387764"
	},
	[100002] = {
		__mask = "v",
		groupId = 1000,
		max = 5,
		name = "@387764",
		num = 2,
		tempid = {
			100002
		}
	},
	[100003] = {
		__mask = "v",
		groupId = 1000,
		max = 5,
		name = "@387764",
		num = 3,
		tempid = {
			100003
		}
	},
	[100004] = {
		__mask = "v",
		groupId = 1000,
		max = 5,
		name = "@387764",
		num = 4,
		tempid = {
			100004
		}
	},
	[100005] = {
		__mask = "v",
		groupId = 1000,
		max = 5,
		name = "@387764",
		num = 5,
		tempid = {
			100005
		}
	},
	[110001] = {
		__mask = "n",
		groupId = 1100,
		max = 8,
		name = "@105881",
		tempid = {
			110001
		}
	},
	[110002] = {
		__mask = "v",
		groupId = 1100,
		max = 8,
		name = "@105881",
		num = 2,
		tempid = {
			110002
		}
	},
	[110003] = {
		__mask = "v",
		groupId = 1100,
		max = 8,
		name = "@105881",
		num = 3,
		tempid = {
			110003
		}
	},
	[110004] = {
		__mask = "v",
		groupId = 1100,
		max = 8,
		name = "@105881",
		num = 4,
		tempid = {
			110004
		}
	},
	[110005] = {
		__mask = "v",
		groupId = 1100,
		max = 8,
		name = "@105881",
		num = 5,
		tempid = {
			110005
		}
	},
	[110006] = {
		__mask = "v",
		groupId = 1100,
		max = 8,
		name = "@105881",
		num = 6,
		tempid = {
			110006
		}
	},
	[110007] = {
		__mask = "v",
		groupId = 1100,
		max = 8,
		name = "@105881",
		num = 7,
		tempid = {
			110007
		}
	},
	[110008] = {
		__mask = "v",
		groupId = 1100,
		max = 8,
		name = "@105881",
		num = 8,
		tempid = {
			110008
		}
	},
	[200001] = {
		__mask = "g",
		tempid = {
			200001
		}
	},
	[200002] = {
		__mask = "o",
		num = 2,
		tempid = {
			200002
		}
	},
	[200003] = {
		__mask = "o",
		num = 3,
		tempid = {
			200003
		}
	},
	[200004] = {
		__mask = "o",
		num = 4,
		tempid = {
			200004
		}
	},
	[200005] = {
		__mask = "o",
		num = 5,
		tempid = {
			200005
		}
	},
	[200006] = {
		__mask = "o",
		num = 6,
		tempid = {
			200006
		}
	},
	[200007] = {
		__mask = "o",
		num = 7,
		tempid = {
			200007
		}
	},
	[200008] = {
		__mask = "o",
		num = 8,
		tempid = {
			200008
		}
	},
	[200009] = {
		__mask = "o",
		num = 9,
		tempid = {
			200009
		}
	},
	[200010] = {
		__mask = "o",
		num = 10,
		tempid = {
			200010
		}
	},
	[300001] = {
		__mask = "n",
		groupId = 3000,
		max = 4,
		name = "@214899",
		tempid = {
			300001
		}
	},
	[300002] = {
		__mask = "v",
		groupId = 3000,
		max = 4,
		name = "@214899",
		num = 2,
		tempid = {
			300002
		}
	},
	[300003] = {
		__mask = "v",
		groupId = 3000,
		max = 4,
		name = "@214899",
		num = 3,
		tempid = {
			300003
		}
	},
	[300004] = {
		__mask = "v",
		groupId = 3000,
		max = 4,
		name = "@214899",
		num = 4,
		tempid = {
			300004
		}
	},
	[310001] = {
		__mask = "n",
		groupId = 3100,
		max = 4,
		name = "@371255",
		tempid = {
			300101
		}
	},
	[310002] = {
		__mask = "v",
		groupId = 3100,
		max = 4,
		name = "@371255",
		num = 2,
		tempid = {
			300102
		}
	},
	[310003] = {
		__mask = "v",
		groupId = 3100,
		max = 4,
		name = "@371255",
		num = 3,
		tempid = {
			300103
		}
	},
	[310004] = {
		__mask = "v",
		groupId = 3100,
		max = 4,
		name = "@371255",
		num = 4,
		tempid = {
			300104
		}
	},
	[400001] = {
		__mask = "n",
		groupId = 4000,
		max = 1,
		name = "@93433",
		tempid = {
			400001
		}
	}
}
local __default_values = {
	groupId = 2000,
	max = 10,
	name = "@165400",
	num = 1,
	skillIds = __rt_1,
	tempid = {
		100001
	}
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( soul_group ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( soul_group, { __default = __default_values, __hash = 0x54ac2d7f, __masked = true } )
end

return soul_group
