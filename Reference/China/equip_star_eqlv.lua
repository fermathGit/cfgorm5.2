local equip_star_eqlv = 
{
	{
		__mask = "Q",
		name = "@104819"
	},
	{
		__mask = "Q",
		name = "@29721"
	},
	{
		__mask = "Q",
		name = "@501746"
	},
	{
		__mask = "Q",
		name = "@304342"
	},
	{
		__mask = "V",
		gold_num = 15000,
		item = 62,
		name = "@111071"
	},
	{
		__mask = "V",
		gold_num = 15000,
		item = 62,
		name = "@104604"
	},
	{
		__mask = "V",
		gold_num = 15000,
		item = 62,
		name = "@21316"
	},
	{
		__mask = "V",
		gold_num = 15000,
		item = 62,
		name = "@18252"
	},
	{
		__mask = "V",
		gold_num = 20000,
		item = 63,
		name = "@352992"
	},
	{
		__mask = "V",
		gold_num = 20000,
		item = 63,
		name = "@194979"
	},
	{
		__mask = "V",
		gold_num = 20000,
		item = 63,
		name = "@66172"
	},
	{
		__mask = "V",
		gold_num = 20000,
		item = 63,
		name = "@316406"
	},
	{
		__mask = "V",
		gold_num = 25000,
		item = 64,
		name = "@233414"
	},
	{
		__mask = "V",
		gold_num = 25000,
		item = 64,
		name = "@521866"
	},
	{
		__mask = "V",
		gold_num = 25000,
		item = 64,
		name = "@180189"
	},
	{
		__mask = "V",
		gold_num = 25000,
		item = 64,
		name = "@436850"
	},
	{
		__mask = "F",
		gold_num = 30000,
		item = 65
	},
	{
		__mask = "V",
		gold_num = 30000,
		item = 65,
		name = "@490922"
	},
	{
		__mask = "V",
		gold_num = 30000,
		item = 65,
		name = "@62002"
	},
	{
		__mask = "V",
		gold_num = 30000,
		item = 65,
		name = "@178382"
	}
}
local __default_values = {
	gold_num = 10000,
	gold_type = 1,
	item = 61,
	item_num = 1,
	name = "@101853"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( equip_star_eqlv ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( equip_star_eqlv, { __default = __default_values, __hash = 0x03351088, __masked = true } )
end

return equip_star_eqlv
