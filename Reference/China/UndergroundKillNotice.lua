local UndergroundKillNotice = 
{
	{
		notice = "@60316"
	},
	{
		killNum = 30,
		notice = "@222929"
	},
	{
		killNum = 40,
		notice = "@496495"
	},
	{
		killNum = 50,
		notice = "@494411"
	},
	{
		killNum = 60,
		notice = "@370742"
	},
	{
		killNum = 70
	},
	{
		killNum = 80,
		notice = "@339302"
	},
	{
		killNum = 90,
		notice = "@381182"
	},
	{
		killNum = 100,
		notice = "@513717"
	}
}
local __default_values = {
	killNum = 20,
	notice = "@110430",
	type = 18
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( UndergroundKillNotice ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( UndergroundKillNotice, { __default = __default_values, __hash = 0x5dcb3f56, __masked = false } )
end

return UndergroundKillNotice
