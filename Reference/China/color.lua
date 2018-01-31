local __rt_1 = {
}
local color = 
{
	__rt_1,
	{
		blue = 10,
		green = 10,
		red = 10
	},
	{
		blue = 240,
		green = 240,
		red = 240
	},
	{
		blue = 20,
		green = 240,
		red = 20
	},
	{
		blue = 240,
		green = 60,
		red = 20
	},
	{
		blue = 200,
		green = 20,
		red = 200
	},
	{
		blue = 20,
		green = 140,
		red = 255
	},
	{
		blue = 30,
		green = 30,
		red = 250
	},
	{
		blue = 20,
		green = 230,
		red = 230
	},
	{
		blue = 45,
		green = 34,
		red = 36
	},
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1
}
local __default_values = {
	blue = 0,
	green = 0,
	red = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( color ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( color, { __default = __default_values, __hash = 0x5c7ad972, __masked = false } )
end

return color
