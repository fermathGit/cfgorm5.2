local __rt_1 = {
}
local __rt_2 = {
	content = "@51976"
}
local __rt_3 = {
	content = "@23366"
}
local __rt_4 = {
	content = "@347086"
}
local __rt_5 = {
	content = "@207916"
}
local __rt_6 = {
	content = "@431388"
}
local __rt_7 = {
	content = "@344956"
}
local talktoplayer = 
{
	{
		content = "@437601"
	},
	{
		content = "@301322"
	},
	{
		content = "@374895"
	},
	{
		content = "@177250"
	},
	__rt_1,
	{
		content = "@340034"
	},
	{
		content = "@132790"
	},
	{
		content = "@157383"
	},
	{
		content = "@435002"
	},
	{
		content = "@88905"
	},
	{
		content = "@100771"
	},
	{
		content = "@261975"
	},
	{
		content = "@266686"
	},
	{
		content = "@112339"
	},
	__rt_2,
	{
		content = "@419419"
	},
	{
		content = "@164346"
	},
	{
		content = "@175110"
	},
	{
		content = "@261952"
	},
	{
		content = "@137180"
	},
	{
		content = "@162773"
	},
	{
		content = "@390202"
	},
	{
		content = "@36646"
	},
	{
		content = "@324455"
	},
	{
		content = "@300339"
	},
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_1,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_2,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_3,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_4,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_5,
	__rt_6,
	__rt_6,
	__rt_6,
	__rt_6,
	__rt_7,
	__rt_7,
	__rt_7,
	__rt_7
}
local __default_values = {
	content = "@140463"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( talktoplayer ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( talktoplayer, { __default = __default_values, __hash = 0x74322696, __masked = false } )
end

return talktoplayer
