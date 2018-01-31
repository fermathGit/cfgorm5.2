local __rt_1 = {
	30,
	1
}
local __rt_2 = {
	__rt_1
}
local practice = 
{
	[91] = {
		__mask = "I",
		mapname = "@424983"
	},
	[92] = {
		__mask = "I",
		mapname = "@311058"
	},
	[93] = {
		__mask = "X",
		dropshow = {
			__rt_1,
			__rt_1
		},
		droptime_s = 120,
		ifchannel = 0,
		pkflag = 1
	}
}
local __default_values = {
	dropshow = __rt_2,
	droptime_s = 0,
	ifchannel = 1,
	mapname = "@193200",
	pkflag = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( practice ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( practice, { __default = __default_values, __hash = 0x34c760ee, __masked = true } )
end

return practice
