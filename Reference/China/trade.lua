local trade = 
{
	{
		all = 1,
		trade_groupname = "@377238"
	},
	{
		item_type = {
			17
		},
		trade_groupname = "@97562"
	},
	{
		item_type = {
			1
		},
		trade_groupname = "@75690"
	},
	{
		item_type = {
			7,
			8,
			9
		}
	},
	{
		item_type = {
			6
		},
		trade_groupname = "@298367"
	},
	{
		item_type = {
			0,
			2,
			3,
			4,
			5,
			10,
			11,
			12,
			13,
			14,
			15,
			16
		},
		trade_groupname = "@431933"
	}
}
local __default_values = {
	all = 0,
	item_type = {
		0,
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17
	},
	trade_groupname = "@17072"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( trade ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( trade, { __default = __default_values, __hash = 0x6fa08994, __masked = false } )
end

return trade
