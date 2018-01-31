local __rt_1 = {
	{
		5800,
		1
	},
	{
		73,
		1
	},
	{
		71,
		1
	},
	{
		41,
		1
	},
	{
		410,
		1
	}
}
local __rt_2 = {
	8,
	27
}
local __rt_3 = {
	{
		26,
		25,
		0
	},
	{
		11,
		14,
		0
	},
	{
		23,
		14,
		0
	}
}
local killmonster = 
{
	{
		__mask = "AA"
	},
	{
		__mask = "3E",
		beginTime = 1320,
		endTime = 1350,
		icon = "kilmonster_4",
		monsterDataIds = {
			1307
		},
		name = "@432143",
		refreshMoster = {
			{
				1307,
				9,
				100
			}
		}
	}
}
local __default_values = {
	beginTime = 870,
	endTime = 900,
	icon = "kilmonster_3",
	mapDataId = 2203,
	monsterDataIds = {
		1306
	},
	name = "@125972",
	pathfinding = __rt_2,
	posSet = __rt_3,
	refreshMoster = {
		{
			1306,
			9,
			100
		}
	},
	showItems = __rt_1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( killmonster ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( killmonster, { __default = __default_values, __hash = 0x26bc5d13, __masked = true } )
end

return killmonster
