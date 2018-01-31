local __rt_1 = {
	{
		5002,
		500,
		500
	},
	{
		5003,
		500,
		500
	},
	{
		5004,
		500,
		500
	},
	{
		5005,
		500,
		500
	}
}
local guild = 
{
	{
		__mask = "CI",
		guild_exp = 3000,
		shop = 5
	},
	{
		__mask = "KK",
		guild_exp = 8000,
		leader_2 = 15,
		menber_number = 45,
		shop = 5
	},
	{
		__mask = "KC",
		guild_exp = 15000,
		leader_2 = 18,
		menber_number = 50
	},
	{
		__mask = "KC",
		guild_exp = 50000,
		leader_2 = 20,
		menber_number = 55
	},
	{
		__mask = "KC",
		guild_exp = 100000,
		leader_2 = 22,
		menber_number = 60
	},
	{
		__mask = "KK",
		guild_exp = 500000,
		leader_2 = 24,
		menber_number = 62,
		shop = 7
	},
	{
		__mask = "KK",
		guild_exp = 1000000,
		leader_2 = 26,
		menber_number = 64,
		shop = 7
	},
	{
		__mask = "KK",
		guild_exp = 2000000,
		leader_2 = 28,
		menber_number = 66,
		shop = 7
	},
	{
		__mask = "KK",
		guild_exp = 4000000,
		leader_2 = 30,
		menber_number = 68,
		shop = 8
	},
	{
		__mask = "IK",
		leader_2 = 35,
		menber_number = 70,
		shop = 8
	}
}
local __default_values = {
	exp_fb = __rt_1,
	guild_exp = -1,
	leader_1 = -1,
	leader_2 = 10,
	leader_3 = 2,
	leader_4 = 2,
	leader_5 = 1,
	menber_number = 40,
	reward = 0,
	shop = 6,
	wonder = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( guild ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( guild, { __default = __default_values, __hash = 0x50f9f400, __masked = true } )
end

return guild
