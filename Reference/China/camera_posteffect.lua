local camera_posteffect = 
{
	{
		colorname = "@430008",
		contrast = 0,
		curve_b = 0,
		saturation = 1
	},
	{
		colorname = "@508204",
		contrast = 0.7,
		curve_b = 0,
		saturation = 0
	},
	{
		colorname = "@239669",
		contrast = 0.18,
		curve_b = 31,
		curve_g = 31,
		curve_r = 31,
		saturation = 0.7
	},
	{
		colorname = "@220399",
		curve_b = 11,
		curve_r = 21
	},
	{
		contrast = 0.21,
		curve_g = 31,
		curve_r = 31,
		saturation = 0.5
	},
	{
		colorname = "@236801",
		contrast = 0.2,
		curve_b = 31,
		saturation = 0.85
	},
	{
		colorname = "@108810",
		contrast = 0.18,
		curve_r = 22,
		saturation = 0.9
	},
	{
		colorname = "@457378",
		curve_b = 31,
		curve_r = 21,
		saturation = 0.34
	},
	{
		colorname = "@475615",
		contrast = 0.14,
		curve_g = 31,
		curve_r = 31
	}
}
local __default_values = {
	colorname = "@108339",
	contrast = 0.1,
	curve_b = 22,
	curve_g = 0,
	curve_r = 0,
	saturation = 0.6
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( camera_posteffect ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( camera_posteffect, { __default = __default_values, __hash = 0x2a711e69, __masked = false } )
end

return camera_posteffect
