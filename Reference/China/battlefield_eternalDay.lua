local battlefield_eternalDay = 
{
	{
		__mask = "AA"
	},
	{
		__mask = "gH",
		num2 = 10,
		num3 = 250,
		num4 = 250,
		score = 800
	},
	{
		__mask = "gH",
		num2 = 15,
		num3 = 300,
		num4 = 300,
		score = 1300
	},
	{
		__mask = "gH",
		num2 = 20,
		num3 = 400,
		num4 = 400,
		score = 1800
	},
	{
		__mask = "gH",
		num2 = 25,
		num3 = 500,
		num4 = 500,
		score = 2500
	}
}
local __default_values = {
	item1 = 51303,
	item2 = 71,
	item3 = 34,
	item4 = 37,
	num1 = 2,
	num2 = 5,
	num3 = 200,
	num4 = 200,
	score = 300
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( battlefield_eternalDay ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( battlefield_eternalDay, { __default = __default_values, __hash = 0x0037a669, __masked = true } )
end

return battlefield_eternalDay
