local __rt_1 = {
	11,
	30
}
local __rt_2 = {
	{
		5108,
		1,
		1
	}
}
local __rt_3 = {
	{
		5100,
		1,
		1
	}
}
local __rt_4 = {
	3,
	3
}
local __rt_5 = {
	{
		5104,
		1,
		1
	}
}
local __rt_6 = {
	{
		5101,
		1,
		1
	}
}
local __rt_7 = {
	2,
	2
}
local __rt_8 = {
	{
		5106,
		1,
		1
	}
}
local __rt_9 = {
	{
		5107,
		1,
		1
	}
}
local __rt_10 = {
	71,
	100
}
local __rt_11 = {
	{
		5102,
		1,
		1
	}
}
local __rt_12 = {
	51,
	70
}
local __rt_13 = {
	{
		5105,
		1,
		1
	}
}
local __rt_14 = {
	31,
	50
}
local __rt_15 = {
	4,
	10
}
local __rt_16 = {
	{
		5103,
		1,
		1
	}
}
local __rt_17 = {
	1,
	1
}
local worldboss_setting = 
{
	{
		__mask = "AAAA"
	},
	{
		__mask = "EAAA",
		bossid = 1001
	},
	{
		__mask = "EAAA",
		bossid = 1002
	},
	{
		__mask = "EAAA",
		bossid = 1003
	},
	{
		__mask = "EAAA",
		bossid = 1004
	}
}
local __default_values = {
	PlayerNo1 = __rt_17,
	PlayerNo2 = __rt_7,
	PlayerNo3 = __rt_4,
	PlayerNo4 = __rt_15,
	PlayerNo5 = __rt_1,
	PlayerNo6 = __rt_14,
	PlayerNo7 = __rt_12,
	PlayerNo8 = __rt_10,
	RewardAll = __rt_2,
	Rewarditem1 = __rt_3,
	Rewarditem2 = __rt_6,
	Rewarditem3 = __rt_11,
	Rewarditem4 = __rt_16,
	Rewarditem5 = __rt_5,
	Rewarditem6 = __rt_13,
	Rewarditem7 = __rt_8,
	Rewarditem8 = __rt_9,
	boss_x = 17,
	boss_y = 23,
	bossid = 1000,
	mapid = 54
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( worldboss_setting ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( worldboss_setting, { __default = __default_values, __hash = 0x099b596d, __masked = true } )
end

return worldboss_setting
