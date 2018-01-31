local shop_guild = 
{
	{
		__mask = "MQ",
		item_name = "@391400",
		itemid = 44001,
		payItem = 250
	},
	{
		__mask = "MY",
		item_name = "@350555",
		itemid = 44002,
		ordernum = 2,
		payItem = 50
	},
	{
		__mask = "AI",
		ordernum = 3
	},
	{
		__mask = "MI",
		item_name = "@223602",
		itemid = 15000,
		ordernum = 4
	},
	{
		__mask = "Me",
		item_name = "@276473",
		itemid = 15102,
		openType = 2,
		openValue = 10,
		ordernum = 5,
		payItem = 800
	},
	{
		__mask = "Me",
		item_name = "@39597",
		itemid = 15200,
		openType = 2,
		openValue = 15,
		ordernum = 6,
		payItem = 1500
	},
	{
		__mask = "Me",
		item_name = "@388483",
		itemid = 15302,
		openType = 2,
		openValue = 20,
		ordernum = 7,
		payItem = 5000
	}
}
local __default_values = {
	Occupation = 0,
	buy_level = 1,
	foreverLimit = 0,
	item_name = "@186016",
	itemid = 71,
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
	for k, v in pairs( shop_guild ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( shop_guild, { __default = __default_values, __hash = 0x07b1555b, __masked = true } )
end

return shop_guild
