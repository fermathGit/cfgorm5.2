local shop_friendship = 
{
	{
		__mask = "UQ",
		item_name = "@328102",
		maxchange = 2,
		payItem = 50
	},
	{
		__mask = "MI",
		item_name = "@497197",
		itemid = 7200,
		ordernum = 2
	},
	{
		__mask = "MI",
		item_name = "@312426",
		itemid = 7201,
		ordernum = 3
	},
	{
		__mask = "MY",
		item_name = "@453252",
		itemid = 7300,
		ordernum = 4,
		payItem = 1000
	},
	{
		__mask = "MY",
		item_name = "@268481",
		itemid = 7301,
		ordernum = 5,
		payItem = 1000
	},
	[7] = {
		__mask = "IY",
		itemid = 32302,
		ordernum = 8,
		payItem = 3000
	},
	[8] = {
		__mask = "MY",
		item_name = "@407726",
		itemid = 32405,
		ordernum = 9,
		payItem = 5000
	},
	[9] = {
		__mask = "cY",
		item_name = "@397979",
		itemid = 2510,
		maxchange = 1,
		ordernum = 6,
		payItem = 2000
	}
}
local __default_values = {
	Occupation = 0,
	buy_level = 1,
	foreverLimit = 0,
	item_name = "@110361",
	itemid = 810,
	maxchange = 100,
	openType = 4,
	openValue = 0,
	openlv = 1,
	ordernum = 1,
	payItem = 300,
	server_maxchange_day = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( shop_friendship ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( shop_friendship, { __default = __default_values, __hash = 0x07b1555b, __masked = true } )
end

return shop_friendship
