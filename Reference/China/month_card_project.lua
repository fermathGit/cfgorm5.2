local month_card_project = 
{
	{
		__mask = "H",
		dec = "@222952",
		level1 = 1,
		level2 = 1
	},
	{
		__mask = "J",
		dec = "@489584",
		level3 = 1
	},
	{
		__mask = "D",
		dec = "@473057",
		level1 = 1
	},
	{
		__mask = "D",
		dec = "@494975",
		level1 = 1
	},
	{
		__mask = "F",
		dec = "@185389",
		level2 = 1
	},
	{
		__mask = "J",
		dec = "@400092",
		level3 = 1
	},
	{
		__mask = "P",
		dec = "@264403",
		level1 = 5,
		level2 = 5,
		level3 = 5
	},
	{
		__mask = "N",
		dec = "@212755",
		level2 = 10,
		level3 = 10
	},
	{
		__mask = "P",
		dec = "@148911",
		level1 = 120,
		level2 = 100,
		level3 = 200
	},
	{
		__mask = "P",
		dec = "@266464",
		level1 = 80,
		level2 = 280,
		level3 = 880
	},
	{
		__mask = "D",
		dec = "@54717",
		level1 = 920
	},
	{
		__mask = "F",
		dec = "@144462",
		level2 = 4780
	},
	{
		__mask = "Q",
		type = 1
	}
}
local __default_values = {
	dec = "@112398",
	level1 = 0,
	level2 = 0,
	level3 = 0,
	type = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( month_card_project ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( month_card_project, { __default = __default_values, __hash = 0x04318075, __masked = true } )
end

return month_card_project
