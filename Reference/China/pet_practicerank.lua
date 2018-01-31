local pet_practicerank = 
{
	{
		maxQuilaty = 2
	},
	{
		maxQuilaty = 3,
		minQuilaty = 2
	},
	{
		maxQuilaty = 4,
		minQuilaty = 3
	},
	{
		minQuilaty = 4
	},
	{
		minQuilaty = 5,
		upNum = 99
	}
}
local __default_values = {
	maxQuilaty = 5,
	minQuilaty = 0,
	upNum = 4
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( pet_practicerank ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( pet_practicerank, { __default = __default_values, __hash = 0x30133749, __masked = false } )
end

return pet_practicerank
