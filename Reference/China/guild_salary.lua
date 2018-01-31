local guild_salary = 
{
	{
		addPer = 10
	},
	{
		max = 20,
		min = 11
	},
	{
		addPer = 30,
		max = 30,
		min = 21
	},
	{
		addPer = 40,
		max = 40,
		min = 31
	},
	{
		addPer = 50,
		max = 50,
		min = 41
	},
	{
		addPer = 60,
		max = 60,
		min = 51
	},
	{
		addPer = 70,
		max = 70,
		min = 61
	},
	{
		addPer = 80,
		max = 80,
		min = 71
	},
	{
		addPer = 90,
		max = 90,
		min = 81
	},
	{
		addPer = 100,
		max = 100,
		min = 91
	},
	{
		addPer = 110,
		max = 110,
		min = 101
	},
	{
		addPer = 120,
		max = 120,
		min = 111
	},
	{
		addPer = 130,
		max = 130,
		min = 121
	},
	{
		addPer = 140,
		max = 140,
		min = 131
	},
	{
		addPer = 150,
		max = 9999,
		min = 141
	},
	{
		max = 899,
		min = 750,
		type = 1
	},
	{
		addPer = 25,
		max = 1049,
		min = 900,
		type = 1
	},
	{
		addPer = 30,
		max = 1199,
		min = 1050,
		type = 1
	},
	{
		addPer = 35,
		max = 1349,
		min = 1200,
		type = 1
	},
	{
		addPer = 40,
		max = 1499,
		min = 1350,
		type = 1
	},
	{
		addPer = 45,
		max = 1649,
		min = 1500,
		type = 1
	},
	{
		addPer = 50,
		max = 1799,
		min = 1650,
		type = 1
	},
	{
		addPer = 55,
		max = 1949,
		min = 1800,
		type = 1
	},
	{
		addPer = 60,
		max = 2099,
		min = 1950,
		type = 1
	},
	{
		addPer = 65,
		max = 2249,
		min = 2100,
		type = 1
	},
	{
		addPer = 70,
		max = 2399,
		min = 2250,
		type = 1
	},
	{
		addPer = 75,
		max = 2549,
		min = 2400,
		type = 1
	},
	{
		addPer = 80,
		max = 2699,
		min = 2550,
		type = 1
	},
	{
		addPer = 85,
		max = 2849,
		min = 2700,
		type = 1
	},
	{
		addPer = 90,
		max = 99999,
		min = 2850,
		type = 1
	}
}
local __default_values = {
	addPer = 20,
	max = 10,
	min = 1,
	type = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( guild_salary ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( guild_salary, { __default = __default_values, __hash = 0x79207b46, __masked = false } )
end

return guild_salary
