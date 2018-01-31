local __rt_1 = {
	924,
	1
}
local camp_rew = 
{
	[2] = {
		rew_item = {
			__rt_1,
			{
				39,
				200000
			}
		}
	},
	[3] = {
		rew_item = {
			__rt_1,
			{
				39,
				400000
			}
		}
	},
	[4] = {
		rew_item = {
			__rt_1,
			{
				39,
				600000
			}
		}
	},
	[5] = {
		rew_item = {
			__rt_1,
			{
				39,
				800000
			}
		}
	},
	[6] = {
	},
	[7] = {
		rew_item = {
			__rt_1,
			{
				39,
				1500000
			}
		}
	}
}
local __default_values = {
	rew_item = {
		__rt_1,
		{
			39,
			1000000
		}
	}
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( camp_rew ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( camp_rew, { __default = __default_values, __hash = 0x65b87e8a, __masked = false } )
end

return camp_rew
