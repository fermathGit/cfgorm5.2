local __rt_1 = {
	51302,
	1
}
local __rt_2 = {
	51302,
	2
}
local arena_point = 
{
	{
		arena_reward = {
			__rt_1,
			{
				34,
				200
			},
			{
				37,
				200
			}
		},
		pos_max = 2001,
		pos_min = 999999
	},
	{
		arena_reward = {
			__rt_1,
			{
				34,
				300
			},
			{
				37,
				300
			}
		},
		pos_max = 1001,
		pos_min = 2000
	},
	{
		arena_reward = {
			__rt_1,
			{
				34,
				400
			},
			{
				37,
				400
			}
		},
		pos_max = 501,
		pos_min = 1000
	},
	{
		arena_reward = {
			__rt_1,
			{
				34,
				600
			},
			{
				37,
				600
			}
		},
		pos_max = 201,
		pos_min = 500
	},
	{
		arena_reward = {
			__rt_1,
			{
				34,
				700
			},
			{
				37,
				700
			}
		},
		pos_max = 101,
		pos_min = 200
	},
	{
		arena_reward = {
			__rt_1,
			{
				34,
				800
			},
			{
				37,
				800
			}
		},
		pos_max = 51,
		pos_min = 100
	},
	{
		arena_reward = {
			__rt_2,
			{
				34,
				900
			},
			{
				37,
				900
			}
		},
		pos_max = 21,
		pos_min = 50
	},
	{
		arena_reward = {
			__rt_2,
			{
				34,
				1000
			},
			{
				37,
				1000
			}
		},
		pos_max = 11,
		pos_min = 20
	},
	{
		arena_reward = {
			{
				51302,
				3
			},
			{
				34,
				1200
			},
			{
				37,
				1200
			}
		},
		pos_max = 6,
		pos_min = 10
	},
	{
		arena_reward = {
			{
				51302,
				4
			},
			{
				34,
				1400
			},
			{
				37,
				1400
			}
		},
		pos_max = 4,
		pos_min = 5
	},
	{
		arena_reward = {
			{
				51302,
				5
			},
			{
				34,
				1600
			},
			{
				37,
				1600
			}
		},
		pos_max = 3,
		pos_min = 3
	},
	{
		arena_reward = {
			{
				51302,
				6
			},
			{
				34,
				1800
			},
			{
				37,
				1800
			}
		},
		pos_max = 2,
		pos_min = 2
	},
	{
	}
}
local __default_values = {
	arena_point = 0,
	arena_reward = {
		{
			20807,
			1
		},
		{
			51302,
			8
		},
		{
			34,
			2000
		},
		{
			37,
			2000
		}
	},
	pos_max = 1,
	pos_min = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( arena_point ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( arena_point, { __default = __default_values, __hash = 0x0748f16b, __masked = false } )
end

return arena_point
