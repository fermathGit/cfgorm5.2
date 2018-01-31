local __rt_1 = {
	73,
	40
}
local __rt_2 = {
	__rt_1,
	{
		32302,
		10
	}
}
local arena = 
{
	{
		first_reward_item = {
		},
		next_rank = 2,
		pos_max = 2001,
		pos_min = 999999,
		rankname = "@19924"
	},
	{
		first_reward_item = {
			{
				73,
				20
			},
			{
				32302,
				4
			}
		},
		next_rank = 3,
		pos_max = 1501,
		pos_min = 2000,
		rankname = "@62708"
	},
	{
		first_reward_item = {
			__rt_1,
			{
				32302,
				6
			}
		},
		next_rank = 4,
		pos_max = 1001,
		pos_min = 1500,
		rankname = "@388169"
	},
	{
		next_rank = 5,
		pos_max = 751,
		pos_min = 1000,
		rankname = "@96325"
	},
	{
		next_rank = 6,
		pos_max = 501,
		pos_min = 750,
		rankname = "@469300"
	},
	{
		first_reward_item = {
			{
				73,
				60
			},
			{
				32302,
				15
			}
		},
		next_rank = 7,
		pos_max = 201,
		pos_min = 500,
		rankname = "@36511"
	},
	{
		first_reward_item = {
			{
				73,
				80
			},
			{
				32302,
				20
			}
		},
		next_rank = 8,
		pos_max = 101,
		pos_min = 200,
		rankname = "@439601"
	},
	{
		first_reward_item = {
			{
				73,
				100
			},
			{
				32302,
				25
			}
		},
		next_rank = 9,
		pos_max = 11,
		pos_min = 100
	},
	{
		first_reward_item = {
			{
				73,
				120
			},
			{
				32302,
				30
			}
		},
		rankname = "@135135"
	}
}
local __default_values = {
	first_reward_item = __rt_2,
	next_rank = 0,
	pos_max = 1,
	pos_min = 10,
	rankname = "@13083"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( arena ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( arena, { __default = __default_values, __hash = 0x4cbe1869, __masked = false } )
end

return arena
