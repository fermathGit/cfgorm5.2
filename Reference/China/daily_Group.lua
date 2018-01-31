local __rt_1 = {
}
local __rt_2 = {
	100316,
	39
}
local daily_Group = 
{
	[4001] = {
		__mask = "kA",
		dailyId = 4,
		maxLevel = 199
	},
	[5001] = {
		__mask = "0A",
		dailyId = 5,
		mapDataId = 700,
		maxLevel = 199
	},
	[6001] = {
		__mask = "0A",
		dailyId = 6,
		mapDataId = 800,
		maxLevel = 199
	},
	[10001] = {
		__mask = "YB",
		itemshow = __rt_2,
		mapDataId = 1521,
		minLevel = 55
	},
	[10002] = {
		__mask = "aB",
		count = 2,
		itemshow = __rt_2,
		mapDataId = 1522,
		minLevel = 75
	},
	[10003] = {
		__mask = "aB",
		count = 3,
		itemshow = __rt_2,
		mapDataId = 1523,
		minLevel = 95
	},
	[13001] = {
		__mask = "dB",
		atk_num = 180000,
		dailyId = 13,
		itemshow = {
			71,
			53202
		},
		mapDataId = 1801,
		minLevel = 62
	},
	[13002] = {
		__mask = "fB",
		atk_num = 480000,
		count = 2,
		dailyId = 13,
		itemshow = {
			71,
			53301
		},
		mapDataId = 1802,
		minLevel = 82
	},
	[13003] = {
		__mask = "fB",
		atk_num = 1200000,
		count = 3,
		dailyId = 13,
		itemshow = {
			71,
			53403
		},
		mapDataId = 1803,
		minLevel = 102
	},
	[24001] = {
		__mask = "0A",
		dailyId = 24,
		mapDataId = 900,
		maxLevel = 199
	}
}
local __default_values = {
	atk_num = 0,
	count = 1,
	dailyId = 10,
	itemshow = __rt_1,
	mapDataId = 600,
	maxLevel = 299,
	minLevel = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( daily_Group ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( daily_Group, { __default = __default_values, __hash = 0x60d95951, __masked = true } )
end

return daily_Group
