local show3 = 
{
	{
		__mask = "AH",
		show3_time = 4500,
		show_3_VFX = "boom_fracture",
		show_in = 1200
	},
	{
		__mask = "qC",
		show3_bg = "guide_3",
		show3_content = "@513040",
		show3_speech = "sc_507",
		show_3_VFX = "dragon_roar"
	},
	{
		__mask = "rB",
		if_lp = 0,
		show3_bg = "guide_2",
		show3_content = "@377520",
		show3_speech = "sc_318",
		show3_time = 4000
	},
	{
		__mask = "qA",
		show3_bg = "guide_4",
		show3_content = "@358460",
		show3_speech = "sc_508"
	},
	{
		__mask = "qJ",
		show3_bg = "guide_5",
		show3_content = "@364947",
		show3_speech = "sc_509",
		show3_time = 4800,
		show_out = 2000
	}
}
local __default_values = {
	if_lp = 1,
	show3_bg = "guide_1",
	show3_color = 0,
	show3_content = "@206881",
	show3_group = 1,
	show3_speech = "",
	show3_time = 5000,
	show_3_VFX = "",
	show_in = 1000,
	show_out = 600
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( show3 ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( show3, { __default = __default_values, __hash = 0x0be973b6, __masked = true } )
end

return show3
