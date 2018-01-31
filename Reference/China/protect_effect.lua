local protect_effect = 
{
	{
		__mask = "eB",
		des = "@516581",
		icon = 5513,
		name = "@139911",
		notice = "@386647",
		skilldes = "@497025"
	},
	{
		__mask = "aJ",
		des = "@483772",
		name = "@450588",
		notice = "@413881",
		skilldes = "@84782",
		warntips = 11
	},
	{
		__mask = "cO",
		icon = 5221,
		name = "@246852",
		notice = "@292915",
		slot = "slot_origin",
		vfx = "buff/S_lt",
		warntips = 12
	},
	{
		__mask = "GJ",
		des = "@517330",
		icon = 5204,
		skilldes = "@132690",
		warntips = 13
	}
}
local __default_values = {
	cd = 3,
	des = "@391832",
	icon = 2024,
	name = "@128164",
	notice = "@106254",
	publiccd = 2,
	skilldes = "@106687",
	slot = "",
	vfx = "",
	warntips = 10
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( protect_effect ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( protect_effect, { __default = __default_values, __hash = 0x17f2728c, __masked = true } )
end

return protect_effect
