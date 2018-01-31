local __rt_1 = {
}
local __rt_2 = {
	3,
	600
}
local __rt_3 = {
	4,
	601
}
local __rt_4 = {
	73,
	200
}
local honor = 
{
	{
		item = __rt_1,
		name = "@356837",
		prop = {
			{
				1,
				1000
			},
			{
				3,
				500
			},
			{
				4,
				500
			}
		}
	},
	{
		fighting = 150000,
		item = __rt_1,
		name = "@80094",
		prop = {
			{
				1,
				1500
			},
			__rt_2,
			{
				4,
				600
			}
		}
	},
	{
		fighting = 200000,
		item = {
			73,
			10
		},
		name = "@197615",
		prop = {
			{
				1,
				2000
			},
			__rt_2,
			__rt_3
		}
	},
	{
		fighting = 250000,
		item = {
			73,
			100
		},
		name = "@311996",
		prop = {
			{
				1,
				3000
			},
			__rt_2,
			__rt_3
		}
	},
	{
		fighting = 350000,
		name = "@65471",
		prop = {
			{
				1,
				4000
			},
			__rt_2,
			__rt_3
		}
	},
	{
		fighting = 450000,
		prop = {
			{
				1,
				5000
			},
			__rt_2,
			__rt_3
		}
	},
	{
		fighting = 600000,
		name = "@12069",
		prop = {
			{
				1,
				6000
			},
			__rt_2,
			__rt_3
		}
	},
	{
		fighting = 800000,
		name = "@323843",
		prop = {
			{
				1,
				7000
			},
			__rt_2,
			__rt_3
		}
	},
	{
		fighting = 1050000,
		name = "@381796",
		prop = {
			{
				1,
				8000
			},
			__rt_2,
			__rt_3
		}
	},
	{
		fighting = 1400000,
		name = "@142797",
		prop = {
			{
				1,
				9000
			},
			__rt_2,
			__rt_3
		}
	},
	{
		fighting = 1800000,
		name = "@255460"
	}
}
local __default_values = {
	fighting = 100000,
	item = __rt_4,
	name = "@10237",
	prop = {
		{
			1,
			10000
		},
		__rt_2,
		__rt_3
	}
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( honor ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( honor, { __default = __default_values, __hash = 0x1b3e87a8, __masked = false } )
end

return honor
