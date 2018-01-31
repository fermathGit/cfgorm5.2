local task_masterexpend = 
{
	{
		__mask = "A"
	},
	{
		__mask = "B",
		altercost = 10000
	},
	{
		__mask = "B",
		altercost = 15000
	},
	{
		__mask = "B",
		altercost = 20000
	},
	{
		__mask = "B",
		altercost = 30000
	},
	{
		__mask = "B",
		altercost = 50000
	}
}
local __default_values = {
	altercost = 5000,
	completecost = 5,
	moneytype = 1,
	moneytype1 = 3,
	moneytype2 = 3,
	orangecost = 50
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( task_masterexpend ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( task_masterexpend, { __default = __default_values, __hash = 0x151d1f4e, __masked = true } )
end

return task_masterexpend
