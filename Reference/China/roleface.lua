local roleface = 
{
	[100] = {
	}
}
local __default_values = {
	site = {
		{
			66.3,
			59.9,
			-90
		},
		{
			118.3,
			61,
			162
		}
	}
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( roleface ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( roleface, { __default = __default_values, __hash = 0x5a8daba1, __masked = false } )
end

return roleface
