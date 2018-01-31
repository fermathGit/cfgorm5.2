local shop_camp = 
{
	{
		__mask = "cQ",
		item_name = "@220590",
		itemid = 79,
		maxchange = 1,
		payItem = 3000
	},
	{
		__mask = "EI",
		item_name = "@80789",
		ordernum = 2
	},
	{
		__mask = "II",
		itemid = 32102,
		ordernum = 3
	},
	{
		__mask = "Me",
		item_name = "@436924",
		itemid = 32202,
		openType = 1,
		openValue = 10,
		ordernum = 4,
		payItem = 800
	},
	{
		__mask = "Me",
		item_name = "@261795",
		itemid = 32306,
		openType = 1,
		openValue = 15,
		ordernum = 5,
		payItem = 1500
	},
	{
		__mask = "Me",
		item_name = "@407726",
		itemid = 32405,
		openType = 1,
		openValue = 20,
		ordernum = 6,
		payItem = 5000
	}
}
local __default_values = {
	Occupation = 0,
	buy_level = 1,
	foreverLimit = 0,
	item_name = "@138362",
	itemid = 73,
	maxchange = 100,
	openType = 0,
	openValue = 0,
	openlv = 1,
	ordernum = 1,
	payItem = 300,
	server_maxchange_day = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( shop_camp ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( shop_camp, { __default = __default_values, __hash = 0x07b1555b, __masked = true } )
end

return shop_camp
