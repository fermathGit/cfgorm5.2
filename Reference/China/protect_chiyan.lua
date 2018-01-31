local __rt_1 = {
	interval = 8000
}
local __rt_2 = {
	level = 2
}
local __rt_3 = {
	level = 3
}
local __rt_4 = {
	level = 4
}
local __rt_5 = {
	level = 5
}
local __rt_6 = {
	level = 6
}
local __rt_7 = {
	level = 7
}
local __rt_8 = {
	level = 8
}
local __rt_9 = {
	level = 9
}
local __rt_10 = {
	level = 10
}
local protect_chiyan = 
{
	[152101] = __rt_1,
	[152102] = __rt_2,
	[152103] = __rt_3,
	[152104] = __rt_4,
	[152105] = __rt_5,
	[152106] = __rt_6,
	[152107] = __rt_7,
	[152108] = __rt_8,
	[152109] = __rt_9,
	[152110] = __rt_10,
	[152201] = __rt_1,
	[152202] = __rt_2,
	[152203] = __rt_3,
	[152204] = __rt_4,
	[152205] = __rt_5,
	[152206] = __rt_6,
	[152207] = __rt_7,
	[152208] = __rt_8,
	[152209] = __rt_9,
	[152210] = __rt_10,
	[152301] = __rt_1,
	[152302] = __rt_2,
	[152303] = __rt_3,
	[152304] = __rt_4,
	[152305] = __rt_5,
	[152306] = __rt_6,
	[152307] = __rt_7,
	[152308] = __rt_8,
	[152309] = __rt_9,
	[152310] = __rt_10
}
local __default_values = {
	chall_limit = 180000,
	interval = 5000,
	level = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( protect_chiyan ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( protect_chiyan, { __default = __default_values, __hash = 0x335b1711, __masked = false } )
end

return protect_chiyan
