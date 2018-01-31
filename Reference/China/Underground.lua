local Underground = 
{
	{
		__mask = "SH",
		des = "@428212",
		jjc_rank = 300,
		open_time = 4,
		pic1 = 4,
		pic2 = 4
	},
	{
		__mask = "yH",
		des = "@356471",
		jjc_rank = 700,
		map_id = 2252,
		open_time = 3,
		pic1 = 6,
		pic2 = 6
	},
	{
		__mask = "yH",
		des = "@502186",
		jjc_rank = 1000,
		map_id = 2253,
		open_time = 2,
		pic1 = 3,
		pic2 = 3
	},
	{
		__mask = "gG",
		map_id = 2254,
		pic1 = 5,
		pic2 = 5
	},
	{
		__mask = "iG",
		des = "@79123",
		map_id = 2255,
		pic1 = 2,
		pic2 = 2
	},
	{
		__mask = "mA",
		des = "@94135",
		des_pk = "@91847",
		map_id = 2256
	}
}
local __default_values = {
	boss_refresh = 10,
	des = "@141939",
	des_pk = "@279009",
	guild_num = 60,
	jjc_rank = -1,
	map_id = 2251,
	open_time = 0,
	pic1 = 1,
	pic2 = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( Underground ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( Underground, { __default = __default_values, __hash = 0x4d993999, __masked = true } )
end

return Underground
