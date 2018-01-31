local equip_addprop = 
{
	[100] = {
		Min = 300
	},
	[101] = {
		Min = 500
	},
	[102] = {
		Min = 700
	},
	[103] = {
		Min = 900
	},
	[104] = {
		Min = 1100
	},
	[105] = {
		Min = 1300
	},
	[106] = {
		Min = 1500
	},
	[107] = {
		Min = 1700
	},
	[108] = {
		Min = 1900
	},
	[109] = {
		Min = 2100
	},
	[110] = {
		Min = 2300
	},
	[111] = {
		Min = 2500
	},
	[200] = {
		Min = 300,
		PropType = 16
	},
	[201] = {
		Min = 500,
		PropType = 16
	},
	[202] = {
		Min = 700,
		PropType = 16
	},
	[203] = {
		Min = 900,
		PropType = 16
	},
	[204] = {
		Min = 1100,
		PropType = 16
	},
	[205] = {
		Min = 1300,
		PropType = 16
	},
	[206] = {
		Min = 1500,
		PropType = 16
	},
	[207] = {
		Min = 1700,
		PropType = 16
	},
	[208] = {
		Min = 1900,
		PropType = 16
	},
	[209] = {
		Min = 2100,
		PropType = 16
	},
	[210] = {
		Min = 2300,
		PropType = 16
	},
	[211] = {
		Min = 2500,
		PropType = 16
	},
	[300] = {
		PropType = 15
	},
	[301] = {
		Min = 0.015,
		PropType = 15
	},
	[302] = {
		Min = 0.02,
		PropType = 15
	},
	[303] = {
		Min = 0.025,
		PropType = 15
	},
	[304] = {
		Min = 0.03,
		PropType = 15
	},
	[305] = {
		Min = 0.035,
		PropType = 15
	},
	[306] = {
		Min = 0.04,
		PropType = 15
	},
	[307] = {
		Min = 0.045,
		PropType = 15
	},
	[308] = {
		Min = 0.05,
		PropType = 15
	},
	[309] = {
		Min = 0.055,
		PropType = 15
	},
	[310] = {
		Min = 0.06,
		PropType = 15
	},
	[311] = {
		Min = 0.065,
		PropType = 15
	},
	[400] = {
		PropType = 17
	},
	[401] = {
		Min = 0.015,
		PropType = 17
	},
	[402] = {
		Min = 0.02,
		PropType = 17
	},
	[403] = {
		Min = 0.025,
		PropType = 17
	},
	[404] = {
		Min = 0.03,
		PropType = 17
	},
	[405] = {
		Min = 0.035,
		PropType = 17
	},
	[406] = {
		Min = 0.04,
		PropType = 17
	},
	[407] = {
		Min = 0.045,
		PropType = 17
	},
	[408] = {
		Min = 0.05,
		PropType = 17
	},
	[409] = {
		Min = 0.055,
		PropType = 17
	},
	[410] = {
		Min = 0.06,
		PropType = 17
	},
	[411] = {
		Min = 0.065,
		PropType = 17
	},
	[500] = {
		PropType = 22
	},
	[501] = {
		Min = 0.015,
		PropType = 22
	},
	[502] = {
		Min = 0.02,
		PropType = 22
	},
	[503] = {
		Min = 0.025,
		PropType = 22
	},
	[504] = {
		Min = 0.03,
		PropType = 22
	},
	[505] = {
		Min = 0.035,
		PropType = 22
	},
	[506] = {
		Min = 0.04,
		PropType = 22
	},
	[507] = {
		Min = 0.045,
		PropType = 22
	},
	[508] = {
		Min = 0.05,
		PropType = 22
	},
	[509] = {
		Min = 0.055,
		PropType = 22
	},
	[510] = {
		Min = 0.06,
		PropType = 22
	},
	[511] = {
		Min = 0.065,
		PropType = 22
	},
	[600] = {
		PropType = 23
	},
	[601] = {
		Min = 0.015,
		PropType = 23
	},
	[602] = {
		Min = 0.02,
		PropType = 23
	},
	[603] = {
		Min = 0.025,
		PropType = 23
	},
	[604] = {
		Min = 0.03,
		PropType = 23
	},
	[605] = {
		Min = 0.035,
		PropType = 23
	},
	[606] = {
		Min = 0.04,
		PropType = 23
	},
	[607] = {
		Min = 0.045,
		PropType = 23
	},
	[608] = {
		Min = 0.05,
		PropType = 23
	},
	[609] = {
		Min = 0.055,
		PropType = 23
	},
	[610] = {
		Min = 0.06,
		PropType = 23
	},
	[611] = {
		Min = 0.065,
		PropType = 23
	}
}
local __default_values = {
	Min = 0.01,
	PropType = 14
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( equip_addprop ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( equip_addprop, { __default = __default_values, __hash = 0x25e4e04e, __masked = false } )
end

return equip_addprop
