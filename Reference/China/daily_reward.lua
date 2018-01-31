local __rt_1 = {
	810,
	1
}
local __rt_2 = {
	890,
	10
}
local __rt_3 = {
	9202,
	2
}
local __rt_4 = {
	80,
	1
}
local daily_reward = 
{
	{
		__mask = "Q",
		show_reward = {
			{
				903,
				5
			},
			{
				799,
				10
			},
			__rt_1,
			__rt_2
		}
	},
	{
		__mask = "D",
		active_point = 60,
		active_reward = 5501
	},
	{
		__mask = "T",
		active_point = 90,
		active_reward = 5502,
		show_reward = {
			{
				903,
				15
			},
			__rt_3,
			__rt_1,
			__rt_4,
			__rt_2
		}
	},
	{
		__mask = "T",
		active_point = 120,
		active_reward = 5503,
		show_reward = {
			{
				903,
				20
			},
			__rt_3,
			__rt_1,
			__rt_4,
			__rt_2
		}
	},
	{
		__mask = "T",
		active_point = 150,
		active_reward = 5504,
		show_reward = {
			{
				924,
				1
			},
			{
				9203,
				1
			},
			{
				811,
				1
			},
			__rt_4,
			__rt_2
		}
	},
	[10] = {
		__mask = "z",
		active_point = 400,
		active_reward = 5505,
		show_reward = {
			{
				924,
				3
			},
			{
				811,
				2
			},
			{
				51305,
				5
			}
		},
		type = 2
	},
	[11] = {
		__mask = "z",
		active_point = 700,
		active_reward = 5506,
		show_reward = {
			{
				925,
				1
			},
			{
				812,
				2
			},
			{
				51408,
				5
			}
		},
		type = 2
	},
	[12] = {
		__mask = "z",
		active_point = 900,
		active_reward = 5507,
		show_reward = {
			{
				926,
				1
			},
			{
				813,
				2
			},
			{
				53404,
				5
			}
		},
		type = 2
	}
}
local __default_values = {
	active_point = 30,
	active_reward = 5500,
	active_reward_bind = 1,
	active_reward_num = 1,
	show_reward = {
		{
			903,
			10
		},
		{
			9201,
			2
		},
		__rt_1,
		__rt_2
	},
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( daily_reward ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( daily_reward, { __default = __default_values, __hash = 0x2557444d, __masked = true } )
end

return daily_reward
