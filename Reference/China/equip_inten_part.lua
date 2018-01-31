local __rt_1 = {
	__mask = "T",
	atk_mag = 0.2,
	atk_phy = 0.2,
	hpmax = 0.15
}
local __rt_2 = {
	__mask = "M",
	def_mag = 0.2,
	def_phy = 0.2
}
local __rt_3 = {
	__mask = "D",
	atk_mag = 0.15,
	atk_phy = 0.15
}
local equip_inten_part = 
{
	{
		__mask = "T",
		atk_mag = 0.3,
		atk_phy = 0.3,
		hpmax = 0
	},
	__rt_1,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_3,
	__rt_3,
	__rt_1
}
local __default_values = {
	atk_mag = 0,
	atk_phy = 0,
	def_mag = 0,
	def_phy = 0,
	hpmax = 0.1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( equip_inten_part ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( equip_inten_part, { __default = __default_values, __hash = 0x0ae96fd4, __masked = true } )
end

return equip_inten_part
