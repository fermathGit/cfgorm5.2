local pet_fightadd = 
{
	{
		Dec = "@423769",
		__mask = "DB",
		fightadd = "@463746",
		quality = 1
	},
	{
		Dec = "@522949",
		__mask = "bB",
		fightadd = "@53023",
		maxFightPoint = 10000,
		mingFightPoint = 101,
		quality = 1
	},
	{
		Dec = "@480459",
		__mask = "bB",
		fightadd = "@221464",
		maxFightPoint = 20000,
		mingFightPoint = 10001,
		quality = 2
	},
	{
		Dec = "@242356",
		__mask = "bB",
		fightadd = "@98534",
		maxFightPoint = 50000,
		mingFightPoint = 20001,
		quality = 2
	},
	{
		Dec = "@56865",
		__mask = "bB",
		fightadd = "@514465",
		maxFightPoint = 100000,
		mingFightPoint = 50001,
		quality = 3
	},
	{
		Dec = "@320502",
		__mask = "bB",
		fightadd = "@394945",
		maxFightPoint = 200000,
		mingFightPoint = 100001,
		quality = 3
	},
	{
		Dec = "@181645",
		__mask = "bB",
		fightadd = "@415619",
		maxFightPoint = 400000,
		mingFightPoint = 200001,
		quality = 4
	},
	{
		Dec = "@370788",
		__mask = "bB",
		fightadd = "@426897",
		maxFightPoint = 600000,
		mingFightPoint = 400001,
		quality = 4
	},
	{
		Dec = "@258546",
		__mask = "bA",
		fightadd = "@217930",
		maxFightPoint = 800000,
		mingFightPoint = 600001
	},
	{
		Dec = "@243447",
		__mask = "bA",
		fightadd = "@32080",
		maxFightPoint = 1000000,
		mingFightPoint = 800001
	},
	{
		Dec = "@524008",
		__mask = "ZA",
		maxFightPoint = 1500000,
		mingFightPoint = 1000001
	},
	{
		Dec = "@450848",
		__mask = "bA",
		fightadd = "@316138",
		maxFightPoint = 2000000,
		mingFightPoint = 1500001
	},
	{
		Dec = "@488212",
		__mask = "bA",
		fightadd = "@464213",
		maxFightPoint = 2500000,
		mingFightPoint = 2000001
	},
	{
		Dec = "@87665",
		__mask = "bA",
		fightadd = "@365546",
		maxFightPoint = 3000000,
		mingFightPoint = 2500001
	},
	{
		Dec = "@233403",
		__mask = "bA",
		fightadd = "@469447",
		maxFightPoint = 3500000,
		mingFightPoint = 3000001
	},
	{
		Dec = "@92221",
		__mask = "bA",
		fightadd = "@453421",
		maxFightPoint = 4000000,
		mingFightPoint = 3500001
	},
	{
		__mask = "aA",
		fightadd = "@57498",
		maxFightPoint = 4500000,
		mingFightPoint = 4000001
	},
	{
		Dec = "@480739",
		__mask = "bA",
		fightadd = "@46327",
		maxFightPoint = 5000000,
		mingFightPoint = 4500001
	},
	{
		Dec = "@195482",
		__mask = "bA",
		fightadd = "@434975",
		maxFightPoint = 6000000,
		mingFightPoint = 5000001
	},
	{
		Dec = "@396553",
		__mask = "bA",
		fightadd = "@316880",
		maxFightPoint = 8000000,
		mingFightPoint = 6000001
	},
	{
		Dec = "@328749",
		__mask = "bA",
		fightadd = "@519796",
		maxFightPoint = 999999999,
		mingFightPoint = 8000001
	}
}
local __default_values = {
	Dec = "@110184",
	fightadd = "@190290",
	icon = 51,
	maxFightPoint = 100,
	mingFightPoint = 0,
	name = "@109138",
	quality = 5
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( pet_fightadd ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( pet_fightadd, { __default = __default_values, __hash = 0x10243338, __masked = true } )
end

return pet_fightadd
