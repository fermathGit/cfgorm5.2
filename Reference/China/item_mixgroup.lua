local item_mixgroup = 
{
	[21] = {
		group_name = "@216214",
		group_order = 2000,
		type_name = "@414984"
	},
	[22] = {
		group_name = "@172269",
		group_order = 2001,
		type_name = "@414984"
	},
	[23] = {
		group_name = "@128324",
		group_order = 2002,
		type_name = "@414984"
	},
	[24] = {
		group_name = "@84379",
		group_order = 2003,
		type_name = "@414984"
	},
	[25] = {
		group_name = "@40434",
		group_order = 2004,
		type_name = "@414984"
	},
	[26] = {
		group_name = "@149672",
		group_order = 2005,
		type_name = "@414984"
	},
	[27] = {
		group_order = 2006,
		type_name = "@414984"
	},
	[28] = {
		group_name = "@61782",
		type_name = "@414984"
	},
	[29] = {
		group_name = "@17837",
		show = 1,
		type_name = "@414984"
	},
	[31] = {
		group_name = "@218562",
		group_order = 3000,
		group_type = 3,
		type_name = "@417332"
	},
	[32] = {
		group_name = "@174617",
		group_order = 3001,
		group_type = 3,
		type_name = "@417332"
	},
	[33] = {
		group_name = "@130672",
		group_order = 3002,
		group_type = 3,
		type_name = "@417332"
	},
	[34] = {
		group_name = "@86727",
		group_order = 3003,
		group_type = 3,
		type_name = "@417332"
	},
	[35] = {
		group_name = "@42782",
		group_order = 3004,
		group_type = 3,
		type_name = "@417332"
	},
	[36] = {
		group_name = "@152020",
		group_order = 3005,
		group_type = 3,
		type_name = "@417332"
	},
	[37] = {
		group_name = "@108075",
		group_order = 3006,
		group_type = 3,
		type_name = "@417332"
	},
	[38] = {
		group_name = "@64130",
		group_order = 3007,
		group_type = 3,
		type_name = "@417332"
	},
	[39] = {
		group_name = "@20185",
		group_order = 3007,
		group_type = 3,
		show = 1,
		type_name = "@417332"
	},
	[41] = {
		group_name = "@62461",
		group_order = 4000,
		group_type = 4
	},
	[42] = {
		group_name = "@18516",
		group_order = 4001,
		group_type = 4
	},
	[43] = {
		group_name = "@498859",
		group_order = 4002,
		group_type = 4
	},
	[44] = {
		group_name = "@454914",
		group_order = 4003,
		group_type = 4
	},
	[45] = {
		group_name = "@410969",
		group_order = 4004,
		group_type = 4
	},
	[46] = {
		group_name = "@520207",
		group_order = 4005,
		group_type = 4
	},
	[47] = {
		group_name = "@476262",
		group_order = 4006,
		group_type = 4
	},
	[48] = {
		group_name = "@432317",
		group_order = 4007,
		group_type = 4
	},
	[49] = {
		group_name = "@388372",
		group_order = 4007,
		group_type = 4,
		show = 1
	},
	[51] = {
		group_name = "@252698",
		group_order = 100,
		group_type = 6,
		show = 1,
		type_name = "@17072"
	},
	[52] = {
		group_name = "@479762",
		group_order = 101,
		group_type = 6,
		type_name = "@17072"
	},
	[53] = {
		group_name = "@186411",
		group_order = 102,
		group_type = 6,
		type_name = "@17072"
	},
	[54] = {
		group_name = "@276083",
		group_order = 103,
		group_type = 6,
		type_name = "@17072"
	},
	[55] = {
		group_name = "@284991",
		group_order = 104,
		group_type = 6,
		type_name = "@17072"
	},
	[56] = {
		group_name = "@326242",
		group_order = 105,
		group_type = 6,
		type_name = "@17072"
	}
}
local __default_values = {
	group_name = "@105727",
	group_order = 2007,
	group_type = 2,
	show = 0,
	type_name = "@261231"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( item_mixgroup ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( item_mixgroup, { __default = __default_values, __hash = 0x4acd65ec, __masked = false } )
end

return item_mixgroup
