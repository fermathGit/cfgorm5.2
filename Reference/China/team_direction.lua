local team_direction = 
{
	{
		__mask = "9",
		desc = "@319969",
		direction = 303,
		mapdataId = 303,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@154492",
		direction = 304,
		mapdataId = 304,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@50626",
		direction = 305,
		mapdataId = 305,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@139029",
		direction = 306,
		mapdataId = 306,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@455691",
		direction = 307,
		mapdataId = 307,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@43678",
		direction = 308,
		mapdataId = 308,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@161519",
		direction = 309,
		mapdataId = 309,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@137748",
		direction = 310,
		mapdataId = 310,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@507128",
		direction = 311,
		mapdataId = 311,
		showname = 0,
		type = 5
	},
	{
		__mask = "9",
		desc = "@155451",
		direction = 312,
		mapdataId = 312,
		showname = 0,
		type = 5
	},
	{
		__mask = "t",
		desc = "@213410",
		direction = 24,
		mapdataId = 900,
		type = 1
	},
	{
		__mask = "t",
		desc = "@44401",
		direction = 5,
		mapdataId = 700,
		type = 2
	},
	{
		__mask = "t",
		desc = "@232310",
		direction = 6,
		mapdataId = 800,
		type = 3
	},
	{
		__mask = "t",
		desc = "@522302",
		direction = 4,
		mapdataId = 600,
		type = 4
	},
	{
		__mask = "J",
		desc = "@190254",
		mapdataId = 5
	},
	{
		__mask = "B",
		desc = "@334769"
	},
	{
		__mask = "B",
		desc = "@227477"
	},
	{
		__mask = "J",
		desc = "@450911",
		mapdataId = 7
	},
	{
		__mask = "J",
		desc = "@99608",
		mapdataId = 7
	},
	{
		__mask = "J",
		desc = "@41400",
		mapdataId = 8
	},
	{
		__mask = "J",
		desc = "@41217",
		mapdataId = 8
	},
	{
		__mask = "I",
		mapdataId = 9
	},
	{
		__mask = "J",
		desc = "@414204",
		mapdataId = 9
	},
	{
		__mask = "J",
		desc = "@508549",
		mapdataId = 10
	},
	{
		__mask = "J",
		desc = "@420660",
		mapdataId = 10
	},
	{
		__mask = "J",
		desc = "@375492",
		mapdataId = 11
	},
	{
		__mask = "J",
		desc = "@487532",
		mapdataId = 11
	},
	{
		__mask = "J",
		desc = "@354297",
		mapdataId = 12
	},
	{
		__mask = "J",
		desc = "@79502",
		mapdataId = 12
	},
	{
		__mask = "J",
		desc = "@95548",
		mapdataId = 13
	},
	{
		__mask = "9",
		desc = "@470882",
		direction = 7,
		mapdataId = 1501,
		showname = 0,
		type = 9
	},
	{
		__mask = "/",
		desc = "@520937",
		difficulty = 1,
		direction = 10,
		mapdataId = 1521,
		showname = 0,
		type = 6
	},
	{
		__mask = "/",
		desc = "@125932",
		difficulty = 2,
		direction = 10,
		mapdataId = 1522,
		showname = 0,
		type = 6
	},
	{
		__mask = "/",
		desc = "@360698",
		difficulty = 3,
		direction = 10,
		mapdataId = 1523,
		showname = 0,
		type = 6
	},
	{
		__mask = "9",
		desc = "@213519",
		direction = 9,
		mapdataId = 91,
		showname = 0,
		type = 7
	},
	{
		__mask = "9",
		desc = "@310154",
		direction = 9,
		mapdataId = 92,
		showname = 0,
		type = 7
	},
	{
		__mask = "9",
		desc = "@362183",
		direction = 9,
		mapdataId = 93,
		showname = 0,
		type = 7
	},
	{
		__mask = "t",
		desc = "@190591",
		direction = 28,
		mapdataId = 2202,
		type = 10
	},
	{
		__mask = "t",
		desc = "@18837",
		direction = 19,
		mapdataId = 2203,
		type = 11
	},
	{
		__mask = "t",
		desc = "@278047",
		direction = 31,
		mapdataId = 0,
		type = 12
	}
}
local __default_values = {
	desc = "@114717",
	difficulty = 0,
	direction = 2,
	mapdataId = 6,
	showname = 1,
	type = 8
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( team_direction ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( team_direction, { __default = __default_values, __hash = 0x1eab7fe9, __masked = true } )
end

return team_direction
