local player_deadguide = 
{
	{
		__mask = "Sc",
		des2 = "@457491",
		icon2 = 3,
		type1 = 0,
		type2 = 0,
		type3 = 0
	},
	{
		__mask = "SD",
		des2 = "@457491",
		icon2 = 3,
		maxlevel = 15,
		minlevel = 11
	},
	{
		__mask = "/D",
		des1 = "@286184",
		des2 = "@228999",
		des3 = "@457491",
		icon1 = 6,
		icon2 = 4,
		icon3 = 3,
		maxlevel = 26,
		minlevel = 16
	},
	{
		__mask = "AD",
		maxlevel = 36,
		minlevel = 27
	},
	{
		__mask = "tD",
		des1 = "@286184",
		des3 = "@457491",
		icon1 = 6,
		icon3 = 3,
		maxlevel = 41,
		minlevel = 37
	},
	{
		__mask = "2D",
		des2 = "@364135",
		des3 = "@297455",
		icon2 = 7,
		icon3 = 8,
		maxlevel = 46,
		minlevel = 42
	},
	{
		__mask = "AD",
		maxlevel = 51,
		minlevel = 47
	},
	{
		__mask = "/D",
		des1 = "@364135",
		des2 = "@297455",
		des3 = "@228999",
		icon1 = 7,
		icon2 = 8,
		icon3 = 4,
		maxlevel = 56,
		minlevel = 52
	},
	{
		__mask = "SD",
		des2 = "@364135",
		icon2 = 7,
		maxlevel = 66,
		minlevel = 57
	},
	{
		__mask = "kD",
		des3 = "@364135",
		icon3 = 7,
		maxlevel = 71,
		minlevel = 67
	},
	{
		__mask = "SD",
		des2 = "@364135",
		icon2 = 7,
		maxlevel = 120,
		minlevel = 72
	}
}
local __default_values = {
	des1 = "@228999",
	des2 = "@349780",
	des3 = "@286184",
	icon1 = 4,
	icon2 = 11,
	icon3 = 6,
	maxlevel = 10,
	minlevel = 0,
	type1 = 1,
	type2 = 1,
	type3 = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( player_deadguide ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( player_deadguide, { __default = __default_values, __hash = 0x3f0de535, __masked = true } )
end

return player_deadguide
