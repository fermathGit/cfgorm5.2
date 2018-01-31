local __rt_1 = {
	39,
	1000000
}
local nextMenu = 
{
	{
		Frontshowtips = "",
		__mask = "GC",
		description = "@284323",
		name = "@516588"
	},
	{
		__mask = "DX",
		dailyID = 16,
		description = "@82592",
		level = 45,
		name = "@62680",
		showlevel = 40,
		textures = 2
	},
	{
		__mask = "BV",
		dailyID = 20,
		level = 50,
		showlevel = 45,
		textures = 3
	}
}
local __default_values = {
	Frontshowtips = "@339856",
	dailyID = 0,
	description = "@273745",
	icon = 18,
	ishide = 0,
	item1 = __rt_1,
	level = 40,
	name = "@452837",
	showlevel = 15,
	showtips = "@51535",
	textures = 1,
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( nextMenu ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( nextMenu, { __default = __default_values, __hash = 0x6f02b0b4, __masked = true } )
end

return nextMenu
