local item_useVFX = 
{
	[4001] = {
	}
}
local __default_values = {
	Broadcast = "@17391"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( item_useVFX ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( item_useVFX, { __default = __default_values, __hash = 0x5157a80c, __masked = false } )
end

return item_useVFX
