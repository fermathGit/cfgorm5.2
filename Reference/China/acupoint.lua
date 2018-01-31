local acupoint = 
{
	{
		desc = "@247673"
	},
	{
		allLevel = 300,
		desc = "@299680"
	},
	{
		allLevel = 750,
		desc = "@443512",
		upNeedLevel = 79
	},
	{
		allLevel = 1350,
		desc = "@450606",
		upNeedLevel = 79
	},
	{
		allLevel = 2100,
		upNeedLevel = 89
	},
	{
		allLevel = 3000,
		desc = "@179041",
		upNeedLevel = 89
	},
	{
		allLevel = 4050,
		desc = "@450758",
		upNeedLevel = 99
	},
	{
		allLevel = 5250,
		desc = "@89537",
		upNeedLevel = 99
	},
	{
		allLevel = 6600,
		desc = "@220546",
		upNeedLevel = 109
	},
	{
		allLevel = 8100,
		desc = "@422168",
		upNeedLevel = 109
	},
	{
		allLevel = 9750,
		desc = "@326658",
		upNeedLevel = 119
	},
	{
		allLevel = 11550,
		desc = "@369697",
		upNeedLevel = 119
	}
}
local __default_values = {
	allLevel = 0,
	desc = "@15974",
	haveNum = 6,
	upNeedLevel = 69
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( acupoint ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( acupoint, { __default = __default_values, __hash = 0x705ee005, __masked = false } )
end

return acupoint
