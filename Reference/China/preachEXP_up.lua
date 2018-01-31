local preachEXP_up = 
{
	[22001] = {
		__mask = "AA"
	},
	[22002] = {
		__mask = "TA",
		conunt = 2,
		costMoney = 2,
		expAddPer = 40
	},
	[22003] = {
		__mask = "TA",
		conunt = 3,
		costMoney = 4,
		expAddPer = 60
	},
	[22004] = {
		__mask = "TA",
		conunt = 4,
		costMoney = 6,
		expAddPer = 80
	},
	[22005] = {
		__mask = "TA",
		conunt = 5,
		costMoney = 8,
		expAddPer = 100
	},
	[22006] = {
		__mask = "TA",
		conunt = 6,
		costMoney = 10,
		expAddPer = 120
	},
	[22007] = {
		__mask = "TA",
		conunt = 7,
		costMoney = 12,
		expAddPer = 140
	},
	[22008] = {
		__mask = "TA",
		conunt = 8,
		costMoney = 14,
		expAddPer = 160
	},
	[22009] = {
		__mask = "TA",
		conunt = 9,
		costMoney = 16,
		expAddPer = 180
	},
	[22010] = {
		__mask = "TA",
		conunt = 10,
		costMoney = 18,
		expAddPer = 200
	}
}
local __default_values = {
	conunt = 1,
	costMoney = 1,
	costMoneyType = 3,
	dailyid = 22,
	expAddPer = 20,
	mapId = 2,
	moneyAddPer = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( preachEXP_up ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( preachEXP_up, { __default = __default_values, __hash = 0x0b994a66, __masked = true } )
end

return preachEXP_up
