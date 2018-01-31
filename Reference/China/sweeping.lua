local sweeping = 
{
	[102] = {
		__mask = "QA",
		levelMin = 35
	},
	[103] = {
		__mask = "wA",
		levelMin = 45,
		sub_id = 103
	},
	[104] = {
		__mask = "wA",
		levelMin = 55,
		sub_id = 104
	},
	[105] = {
		__mask = "wA",
		levelMin = 65,
		sub_id = 105
	},
	[106] = {
		__mask = "wA",
		levelMin = 75,
		sub_id = 106
	},
	[107] = {
		__mask = "wA",
		levelMin = 85,
		sub_id = 107
	},
	[108] = {
		__mask = "wA",
		levelMin = 95,
		sub_id = 108
	},
	[109] = {
		__mask = "wA",
		levelMin = 105,
		sub_id = 109
	},
	[110] = {
		__mask = "wA",
		levelMin = 115,
		sub_id = 110
	},
	[111] = {
		__mask = "gA",
		sub_id = 111
	},
	[112] = {
		__mask = "gA",
		sub_id = 112
	},
	[113] = {
		__mask = "wA",
		levelMin = 25,
		sub_id = 113
	}
}
local __default_values = {
	cost_item = 799,
	cost_moneynum = 3,
	cost_moneytype = 3,
	levelMax = 14000,
	levelMin = 120,
	sub_id = 102,
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( sweeping ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( sweeping, { __default = __default_values, __hash = 0x5af31346, __masked = true } )
end

return sweeping
