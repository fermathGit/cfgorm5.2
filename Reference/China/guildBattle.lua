local __rt_1 = {
	20705,
	53406,
	32
}
local __rt_2 = {
	36,
	500
}
local __rt_3 = {
	32,
	500
}
local __rt_4 = {
	39,
	500000
}
local __rt_5 = {
	36,
	1000
}
local __rt_6 = {
	32,
	1000
}
local __rt_7 = {
	39,
	1000000
}
local __rt_8 = {
	{
		53406,
		25
	},
	__rt_5,
	__rt_6,
	__rt_7
}
local __rt_9 = {
	{
		53406,
		18
	},
	__rt_5,
	__rt_6,
	__rt_7
}
local __rt_10 = {
	{
		53406,
		14
	},
	__rt_5,
	__rt_6,
	__rt_7
}
local __rt_11 = {
	{
		53406,
		10
	},
	__rt_5,
	__rt_6,
	__rt_7
}
local __rt_12 = {
	{
		53406,
		6
	},
	__rt_5,
	__rt_6,
	__rt_7
}
local guildBattle = 
{
	{
		byeItem = __rt_8,
		loseItem = {
			{
				53406,
				20
			},
			__rt_2,
			__rt_3,
			__rt_4
		},
		winItem = __rt_8
	},
	{
		byeItem = __rt_9,
		loseItem = {
			{
				53406,
				16
			},
			__rt_2,
			__rt_3,
			__rt_4
		},
		winItem = __rt_9
	},
	{
		byeItem = __rt_10,
		winItem = __rt_10
	},
	{
		loseItem = {
			{
				53406,
				8
			},
			__rt_2,
			__rt_3,
			__rt_4
		}
	},
	{
		byeItem = __rt_12,
		loseItem = {
			{
				53406,
				4
			},
			__rt_2,
			__rt_3,
			__rt_4
		},
		winItem = __rt_12
	}
}
local __default_values = {
	byeItem = __rt_11,
	loseItem = {
		{
			53406,
			12
		},
		__rt_2,
		__rt_3,
		__rt_4
	},
	showItem = __rt_1,
	winItem = __rt_11
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( guildBattle ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( guildBattle, { __default = __default_values, __hash = 0x47c14793, __masked = false } )
end

return guildBattle
