local __rt_1 = {
	720,
	1440
}
local shop_list = 
{
	{
		__mask = "6fG",
		open_level = 30,
		reset_currency = 2,
		reset_currency_add = 20,
		reset_currency_max = 200,
		reset_currency_number = 20,
		reset_item = 80,
		reset_item_num = 1,
		reset_time = {
			720,
			1080,
			1440
		},
		shop_configure = "shop_carry",
		sort = 4,
		window = 9
	},
	{
		__mask = "BwD",
		money_Type = 4,
		shop_configure = "shop_guild",
		shop_des = "@416451",
		shop_name = "@372693",
		sort = 3
	},
	{
		__mask = "BgB",
		money_Type = 9,
		shop_des = "@368651",
		shop_name = "@97562"
	},
	{
		__mask = "BwD",
		money_Type = 5,
		shop_configure = "shop_camp",
		shop_des = "@510649",
		shop_name = "@189067",
		sort = 2
	},
	{
		__mask = "BwD",
		money_Type = 6,
		shop_configure = "shop_friendship",
		shop_des = "@254339",
		shop_name = "@321834",
		sort = 5
	}
}
local __default_values = {
	money_Type = 2,
	open_level = 20,
	open_time = "",
	reset_currency = 0,
	reset_currency_add = 0,
	reset_currency_max = 0,
	reset_currency_number = 0,
	reset_item = 0,
	reset_item_num = 0,
	reset_time = __rt_1,
	shop_configure = "shop_arena",
	shop_des = "",
	shop_name = "@155800",
	sort = 1,
	window = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( shop_list ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( shop_list, { __default = __default_values, __hash = 0x09715908, __masked = true } )
end

return shop_list
