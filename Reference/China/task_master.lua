local __rt_1 = {
	314100,
	314200,
	314300,
	314400,
	314500,
	314600,
	314700,
	314800
}
local task_master = 
{
	{
		__mask = "AB",
		taskGroupId = 1100
	},
	{
		__mask = "mA",
		maxLv = 49,
		minLV = 40,
		rewardGroupId = 2
	},
	{
		__mask = "mA",
		maxLv = 59,
		minLV = 50,
		rewardGroupId = 3
	},
	{
		__mask = "mB",
		maxLv = 69,
		minLV = 60,
		rewardGroupId = 4,
		taskGroupId = 1102
	},
	{
		__mask = "mB",
		maxLv = 79,
		minLV = 70,
		rewardGroupId = 5,
		taskGroupId = 1103
	},
	{
		__mask = "mB",
		maxLv = 89,
		minLV = 80,
		rewardGroupId = 6,
		taskGroupId = 1104
	},
	{
		__mask = "mB",
		maxLv = 99,
		minLV = 90,
		rewardGroupId = 7,
		taskGroupId = 1105
	},
	{
		__mask = "mB",
		maxLv = 109,
		minLV = 100,
		rewardGroupId = 8,
		taskGroupId = 1106
	},
	{
		__mask = "mB",
		maxLv = 120,
		minLV = 110,
		rewardGroupId = 9,
		taskGroupId = 1107
	}
}
local __default_values = {
	masterReward = 82000,
	maxLv = 39,
	minLV = 30,
	num = 5,
	rewardGroupId = 1,
	reward_item = __rt_1,
	taskGroupId = 1101
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( task_master ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( task_master, { __default = __default_values, __hash = 0x44f4de26, __masked = true } )
end

return task_master
