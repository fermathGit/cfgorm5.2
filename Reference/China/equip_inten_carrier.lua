local __rt_1 = {
	__mask = "C",
	atk_phy = 2
}
local __rt_2 = {
	__mask = "B",
	atk_mag = 2
}
local equip_inten_carrier = 
{
	__rt_1,
	__rt_2,
	__rt_2,
	__rt_1
}
local __default_values = {
	atk_mag = 0,
	atk_phy = 0,
	def_mag = 1,
	def_phy = 1,
	hpmax = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( equip_inten_carrier ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( equip_inten_carrier, { __default = __default_values, __hash = 0x0ae96fd4, __masked = true } )
end

return equip_inten_carrier
