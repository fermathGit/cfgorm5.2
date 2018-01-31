local first_recharge = 
{
	[60] = {
		ios_special = 1
	},
	[300] = {
		gold_id = 2,
		ios_special = 1,
		reward_num = 300
	},
	[680] = {
		gold_id = 3,
		reward_num = 680
	},
	[980] = {
		gold_id = 4,
		reward_num = 980
	},
	[1280] = {
		gold_id = 5,
		reward_num = 1280
	},
	[2580] = {
		gold_id = 6,
		reward_num = 2580
	},
	[3280] = {
		gold_id = 7,
		reward_num = 3280
	},
	[6480] = {
		gold_id = 8,
		reward_num = 6480
	}
}
local __default_values = {
	gold_id = 1,
	ios_special = 0,
	reward_num = 60,
	reward_type = 3
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( first_recharge ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( first_recharge, { __default = __default_values, __hash = 0x5d353e99, __masked = false } )
end

return first_recharge
