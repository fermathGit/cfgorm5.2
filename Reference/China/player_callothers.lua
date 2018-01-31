local player_callothers = 
{
	{
		__mask = "4AA",
		camp_forrOfficeritem = -1,
		camp_forrOfficermoney = 0,
		camp_forrOfficermoneyType = 0
	},
	{
		__mask = "A4A",
		guild_forOwnitem = -1,
		guild_forOwnmoney = 0,
		guild_forOwnmoneyType = 0
	},
	{
		__mask = "HAA",
		camp_forOwnitem = 9001,
		camp_forOwnmoney = 50,
		camp_forOwnmoneyType = 3
	}
}
local __default_values = {
	camp_forOwnitem = -1,
	camp_forOwnmoney = 0,
	camp_forOwnmoneyType = 0,
	camp_forrOfficeritem = 9001,
	camp_forrOfficermoney = 50,
	camp_forrOfficermoneyType = 3,
	guild_forAllitem = -1,
	guild_forAllmoney = 0,
	guild_forAllmoneyType = 0,
	guild_forOwnitem = 9000,
	guild_forOwnmoney = 20,
	guild_forOwnmoneyType = 3,
	marital_forAllitem = -1,
	marital_forAllmoney = 0,
	marital_forAllmoneyType = 0,
	mentoring_forAllitem = -1,
	mentoring_forAllmoney = 0,
	mentoring_forAllmoneyType = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( player_callothers ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( player_callothers, { __default = __default_values, __hash = 0x7ab9fb31, __masked = true } )
end

return player_callothers
