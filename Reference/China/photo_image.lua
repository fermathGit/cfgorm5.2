local photo_image = 
{
	{
		p1 = "C00000"
	},
	{
		p1 = "FF0000"
	},
	{
		p1 = "FFC000"
	},
	{
		p1 = "FFFF00"
	},
	{
		p1 = "92D000"
	},
	{
		p1 = "00B050"
	},
	{
		p1 = "00B0F0"
	},
	{
		p1 = "0070C0"
	},
	{
	},
	{
		p1 = "7030A0"
	},
	{
		p1 = "bg1",
		type = 2
	},
	{
		p1 = "bg2",
		type = 2
	},
	{
		p1 = "bg3",
		type = 2
	},
	{
		p1 = "bg4",
		type = 2
	},
	{
		p1 = "photo_bg",
		type = 2
	},
	{
		p1 = "butterfly",
		type = 3
	},
	{
		p1 = "fireworks",
		type = 3
	},
	{
		p1 = "love",
		type = 3
	},
	{
		p1 = "moon",
		type = 3
	},
	{
		p1 = "rose",
		type = 3
	},
	{
		p1 = "sun",
		type = 3
	}
}
local __default_values = {
	p1 = "002060",
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( photo_image ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( photo_image, { __default = __default_values, __hash = 0x714c104d, __masked = false } )
end

return photo_image
