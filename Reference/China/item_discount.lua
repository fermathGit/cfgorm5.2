local __rt_1 = {
	0,
	0,
	0
}
local __rt_2 = {
	2,
	1000
}
local __rt_3 = {
	0,
	100
}
local __rt_4 = {
	2,
	299
}
local __rt_5 = {
	0,
	80
}
local __rt_6 = {
	2,
	2000
}
local __rt_7 = {
	0,
	-40,
	0
}
local __rt_8 = {
	2,
	5025
}
local __rt_9 = {
	2,
	1499
}
local item_discount = 
{
	[60000] = {
		__mask = "KA",
		itemid = {
			41,
			100
		},
		model_name = "Prefab/other/other_6"
	},
	[60001] = {
		__mask = "GA",
		itemid = {
			73,
			100
		},
		model_hight = __rt_5
	},
	[60002] = {
		__mask = "KA",
		itemid = {
			71,
			100
		},
		model_name = "Prefab/other/other_3"
	},
	[60003] = {
		__mask = "KA",
		itemid = {
			61,
			100
		},
		model_name = "Prefab/other/other_2"
	},
	[60004] = {
		OriginalPrice = __rt_6,
		PresentPrice = {
			2,
			599
		},
		__mask = "GD",
		itemid = {
			400,
			100
		},
		model_hight = __rt_5
	},
	[60005] = {
		OriginalPrice = __rt_8,
		PresentPrice = __rt_9,
		__mask = "+D",
		itemid = {
			32301,
			75
		},
		model_hight = {
			0,
			-60
		},
		model_name = "Prefab/role/mount/mount_9",
		model_s = __rt_7,
		model_zoom = 1.4
	},
	[60006] = {
		OriginalPrice = __rt_8,
		PresentPrice = __rt_9,
		__mask = "oD",
		model_name = "Prefab/role/wing/wing_x_6",
		model_zoom = 1
	},
	[60007] = {
		OriginalPrice = __rt_6,
		PresentPrice = {
			2,
			799
		},
		__mask = "vD",
		discount = 4,
		itemid = {
			312401,
			50
		},
		model_hight = {
			0,
			-160
		},
		model_name = "Prefab/role/monster/m_68",
		model_zoom = 1
	},
	[60008] = {
		OriginalPrice = __rt_8,
		PresentPrice = __rt_9,
		__mask = "+D",
		itemid = {
			313401,
			75
		},
		model_hight = {
			0,
			-50
		},
		model_name = "Prefab/role/monster/m_73",
		model_s = __rt_7,
		model_zoom = 1.4
	},
	[60009] = {
		OriginalPrice = {
			2,
			20000
		},
		PresentPrice = {
			2,
			3999
		},
		__mask = "/D",
		discount = 2,
		itemid = {
			314801,
			100
		},
		model_hight = {
			0,
			-30
		},
		model_name = "Prefab/role/monster/m_10008",
		model_s = {
			0,
			-20,
			0
		},
		model_zoom = 1.2
	}
}
local __default_values = {
	OriginalPrice = __rt_2,
	PresentPrice = __rt_4,
	discount = 3,
	itemid = {
		15201,
		75
	},
	model_hight = __rt_3,
	model_name = "Prefab/other/other_1",
	model_s = __rt_1,
	model_zoom = 1.7
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( item_discount ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( item_discount, { __default = __default_values, __hash = 0x3a04b117, __masked = true } )
end

return item_discount
