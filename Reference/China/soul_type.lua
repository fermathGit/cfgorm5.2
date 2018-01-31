local soul_type = 
{
	{
	},
	{
		name = "@408526",
		type = 1
	},
	{
		name = "@416492",
		type = 2
	},
	{
		ifhide = 1,
		name = "@82885",
		type = 3
	},
	{
		name = "@67639",
		type = 4
	},
	{
		name = "@9338",
		type = 5
	}
}
local __default_values = {
	ifhide = 0,
	name = "@397907",
	type = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( soul_type ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( soul_type, { __default = __default_values, __hash = 0x673236fc, __masked = false } )
end

return soul_type
