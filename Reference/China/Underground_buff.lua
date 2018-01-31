local __rt_1 = {
}
local __rt_2 = {
	buff = 53,
	dec = 2
}
local __rt_3 = {
	buff = 54,
	dec = 3
}
local __rt_4 = {
	buff = 55,
	dec = 4
}
local __rt_5 = {
	buff = 56,
	dec = 5
}
local Underground_buff = 
{
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_5
}
local __default_values = {
	buff = 52,
	dec = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( Underground_buff ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( Underground_buff, { __default = __default_values, __hash = 0x2654540e, __masked = false } )
end

return Underground_buff
