local Chaosbattle_Dayreward = 
{
	{
		__mask = "AA"
	},
	{
		__mask = "wE",
		num1 = 200,
		num2 = 200,
		score = 300
	},
	{
		__mask = "wE",
		num1 = 300,
		num2 = 300,
		score = 500
	},
	{
		__mask = "wE",
		num1 = 400,
		num2 = 400,
		score = 750
	},
	{
		__mask = "wE",
		num1 = 500,
		num2 = 500,
		score = 1000
	}
}
local __default_values = {
	item1 = 34,
	item2 = 37,
	item3 = 921,
	item4 = 0,
	num1 = 100,
	num2 = 100,
	num3 = 20,
	num4 = 0,
	score = 150
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( Chaosbattle_Dayreward ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( Chaosbattle_Dayreward, { __default = __default_values, __hash = 0x0037a669, __masked = true } )
end

return Chaosbattle_Dayreward
