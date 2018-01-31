local exp_increase = 
{
	{
		icon = 76,
		name = "@27199"
	},
	{
		icon = 77,
		name = "@447152",
		type = 2
	},
	{
		icon = 74,
		type = 3
	},
	{
		icon = 75,
		name = "@216523",
		type = 4
	},
	{
		name = "@474670",
		type = 5
	},
	{
		dec = "@14829",
		name = "@119886",
		type = 6
	},
	{
		dec = "@504190",
		icon = 74,
		type = 7
	},
	{
		icon = 75,
		name = "@226120",
		type = 8
	},
	{
		dec = "{0}{1}",
		name = "@314140",
		type = 9
	}
}
local __default_values = {
	dec = "@172266",
	icon = 73,
	name = "@92226",
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( exp_increase ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( exp_increase, { __default = __default_values, __hash = 0x3b59ed66, __masked = false } )
end

return exp_increase
