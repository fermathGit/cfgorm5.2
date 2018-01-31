local bloom = 
{
	{
		__mask = "Q",
		threshhold = 0.455
	},
	{
		__mask = "Y",
		intensity = 0.28,
		threshhold = 0.45
	},
	{
		__mask = "Y",
		intensity = 0.6,
		threshhold = 0.4
	},
	{
		__mask = "I",
		intensity = 0.455
	}
}
local __default_values = {
	blur_inter = 1,
	blursize = 2,
	down_sample = 4,
	intensity = 0.15,
	threshhold = 0.35
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( bloom ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( bloom, { __default = __default_values, __hash = 0x4e85758d, __masked = true } )
end

return bloom
