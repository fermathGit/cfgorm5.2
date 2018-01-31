local __rt_1 = {
}
local girlBless = 
{
	[101] = {
		__mask = "AA"
	},
	[102] = {
		__mask = "wA",
		item = 9102,
		level = 2
	},
	[201] = {
		__mask = "fB",
		addExpPer = 0,
		att = {
			{
				25,
				0,
				0.2
			},
			{
				26,
				0,
				0.05
			}
		},
		des = "@347654",
		icon = 883,
		item = 9103,
		type = 2
	}
}
local __default_values = {
	addExpPer = 20,
	att = __rt_1,
	des = "@235199",
	icon = 882,
	item = 9101,
	level = 1,
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( girlBless ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( girlBless, { __default = __default_values, __hash = 0x5a42f5c2, __masked = true } )
end

return girlBless
