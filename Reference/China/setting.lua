local setting = 
{
	{
		__mask = "KF",
		name = "@438513",
		petshow = 0,
		sfxshow = 0,
		soulshow = 0
	},
	{
		__mask = "yC",
		name = "@450891",
		playernum = 10,
		sfxlv = 2,
		shadowlv = 2
	},
	{
		__mask = "wC",
		playernum = 20,
		sfxlv = 3,
		shadowlv = 3
	}
}
local __default_values = {
	bloom = 0,
	name = "@136892",
	nameshow = 1,
	petshow = 1,
	playernum = 5,
	sfxlv = 1,
	sfxshow = 1,
	shadowlv = 1,
	soulshow = 1,
	wingshow = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( setting ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( setting, { __default = __default_values, __hash = 0x0e1b5d4a, __masked = true } )
end

return setting
