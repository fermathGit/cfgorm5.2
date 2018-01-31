local exp_offline = 
{
	{
		__mask = "AA"
	},
	{
		__mask = "bA",
		exp_free = 350000,
		exp_glod = 420000,
		level_max = 59,
		level_min = 50
	},
	{
		__mask = "bA",
		exp_free = 600000,
		exp_glod = 720000,
		level_max = 69,
		level_min = 60
	},
	{
		__mask = "bA",
		exp_free = 750000,
		exp_glod = 900000,
		level_max = 79,
		level_min = 70
	},
	{
		__mask = "bA",
		exp_free = 900000,
		exp_glod = 1080000,
		level_max = 89,
		level_min = 80
	},
	{
		__mask = "bA",
		exp_free = 1050000,
		exp_glod = 1260000,
		level_max = 99,
		level_min = 90
	},
	{
		__mask = "bA",
		exp_free = 1200000,
		exp_glod = 1440000,
		level_max = 109,
		level_min = 100
	},
	{
		__mask = "bA",
		exp_free = 1350000,
		exp_glod = 1620000,
		level_max = 119,
		level_min = 110
	},
	{
		__mask = "bA",
		exp_free = 1500000,
		exp_glod = 1800000,
		level_max = 129,
		level_min = 120
	},
	{
		__mask = "bA",
		exp_free = 3456000,
		exp_glod = 4147200,
		level_max = 139,
		level_min = 130
	},
	{
		__mask = "bA",
		exp_free = 3744000,
		exp_glod = 4492800,
		level_max = 149,
		level_min = 140
	},
	{
		__mask = "bA",
		exp_free = 4032000,
		exp_glod = 4838400,
		level_max = 159,
		level_min = 150
	},
	{
		__mask = "bA",
		exp_free = 4320000,
		exp_glod = 5184000,
		level_max = 169,
		level_min = 160
	},
	{
		__mask = "bA",
		exp_free = 4608000,
		exp_glod = 5529600,
		level_max = 179,
		level_min = 170
	},
	{
		__mask = "bA",
		exp_free = 4896000,
		exp_glod = 5875200,
		level_max = 189,
		level_min = 180
	},
	{
		__mask = "bA",
		exp_free = 5184000,
		exp_glod = 6220800,
		level_max = 199,
		level_min = 190
	},
	{
		__mask = "bA",
		exp_free = 5472000,
		exp_glod = 6566400,
		level_max = 209,
		level_min = 200
	}
}
local __default_values = {
	exp_free = 0,
	exp_glod = 0,
	item = 800,
	level_max = 49,
	level_min = 1,
	money_num = 10,
	money_type = 3
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( exp_offline ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( exp_offline, { __default = __default_values, __hash = 0x22d17244, __masked = true } )
end

return exp_offline
