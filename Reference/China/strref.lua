local strref = 
{
	{
		refdesc = "@355763"
	},
	{
		refdesc = "@433660"
	},
	{
	},
	{
		refdesc = "@406850"
	},
	{
		refdesc = "@439189"
	},
	{
		refdesc = "@371897"
	},
	{
		refdesc = "@354193"
	},
	{
		refdesc = "@81310"
	},
	{
		refdesc = "@49744"
	},
	{
		refdesc = "@398523"
	},
	[0] = {
		refdesc = "@500327"
	}
}
local __default_values = {
	refdesc = "@181867"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( strref ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( strref, { __default = __default_values, __hash = 0x59180785, __masked = false } )
end

return strref
