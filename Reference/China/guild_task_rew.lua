local __rt_1 = {
	53201,
	2
}
local __rt_2 = {
	44002,
	10
}
local __rt_3 = {
	81,
	65
}
local __rt_4 = {
	41,
	65
}
local __rt_5 = {
	__rt_3,
	__rt_4,
	__rt_1,
	__rt_2
}
local guild_task_rew = 
{
	{
		Guildta_reward = {
			{
				81,
				10
			},
			{
				41,
				10
			},
			__rt_1,
			__rt_2
		}
	},
	{
		Guildta_group = 29,
		Guildta_reward = {
			{
				81,
				15
			},
			{
				41,
				15
			},
			__rt_1,
			__rt_2
		}
	},
	{
		Guildta_group = 39,
		Guildta_reward = {
			{
				81,
				20
			},
			{
				41,
				20
			},
			__rt_1,
			__rt_2
		}
	},
	{
		Guildta_group = 49,
		Guildta_reward = {
			{
				81,
				35
			},
			{
				41,
				35
			},
			__rt_1,
			__rt_2
		}
	},
	{
		Guildta_group = 59,
		Guildta_reward = {
			{
				81,
				45
			},
			{
				41,
				45
			},
			__rt_1,
			__rt_2
		}
	},
	{
		Guildta_group = 69,
		Guildta_reward = {
			{
				81,
				55
			},
			{
				41,
				55
			},
			__rt_1,
			__rt_2
		}
	},
	{
		Guildta_group = 79
	},
	{
		Guildta_group = 89
	},
	{
		Guildta_group = 99,
		Guildta_reward = {
			__rt_3,
			__rt_4,
			{
				53201,
				3
			},
			__rt_2
		}
	},
	{
		Guildta_group = 109,
		Guildta_reward = {
			__rt_3,
			__rt_4,
			{
				53201,
				4
			},
			__rt_2
		}
	},
	{
		Guildta_group = 119,
		Guildta_reward = {
			__rt_3,
			__rt_4,
			{
				53201,
				5
			},
			__rt_2
		}
	}
}
local __default_values = {
	Guildta_group = 0,
	Guildta_reward = __rt_5
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( guild_task_rew ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( guild_task_rew, { __default = __default_values, __hash = 0x0ffe3482, __masked = false } )
end

return guild_task_rew
