local girlitem_type = 
{
	{
		Ornamty_name = "@86125",
		__mask = "C"
	},
	{
		Ornamty_name = "@511167",
		Ornamty_show = {
			2,
			5
		},
		__mask = "G"
	},
	{
		Ornamty_name = "@497827",
		Ornamty_show = {
			6,
			7
		},
		ParentType = 1,
		Slot = "slot_head",
		__mask = "e"
	},
	{
		Ornamty_name = "@412614",
		Ornamty_show = {
		},
		ParentType = 1,
		Slot = "slot_l",
		__mask = "f",
		open = 0
	},
	{
		Ornamty_name = "@461651",
		Ornamty_show = {
			8
		},
		ParentType = 1,
		Slot = "slot_lf",
		__mask = "e"
	},
	{
		Ornamty_name = "@407996",
		Ornamty_show = {
			3
		},
		__mask = "H",
		open = 0
	},
	{
		Ornamty_show = {
			9,
			10,
			11,
			12,
			13,
			14,
			15
		},
		__mask = "E"
	}
}
local __default_values = {
	Ornamty_name = "@310488",
	Ornamty_show = {
		1,
		4
	},
	ParentType = 0,
	Slot = "",
	open = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( girlitem_type ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( girlitem_type, { __default = __default_values, __hash = 0x14fef240, __masked = true } )
end

return girlitem_type
