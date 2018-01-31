local campaign = 
{
	{
		__mask = "A"
	}
}
local __default_values = {
	activeMission = 100103,
	chapter = 2104,
	info_chapter = "@139073",
	info_mission = "@324386",
	reward = {
		{
			71,
			999
		},
		{
			73,
			999
		}
	},
	sence = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( campaign ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( campaign, { __default = __default_values, __hash = 0x28c772b6, __masked = true } )
end

return campaign
