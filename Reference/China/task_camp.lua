local __rt_1 = {
	411101
}
local __rt_2 = {
	421111
}
local task_camp = 
{
	{
		__mask = "gC",
		npc = 539,
		taskId = {
			411021
		}
	},
	{
		__mask = "4C",
		maxLv = 39,
		minLV = 30,
		npc = 539,
		taskId = {
			411031
		}
	},
	{
		__mask = "4C",
		maxLv = 49,
		minLV = 40,
		npc = 539,
		taskId = {
			411041
		}
	},
	{
		__mask = "4C",
		maxLv = 59,
		minLV = 50,
		npc = 539,
		taskId = {
			411051
		}
	},
	{
		__mask = "YC",
		maxLv = 69,
		minLV = 60,
		taskId = {
			411061
		}
	},
	{
		__mask = "YC",
		maxLv = 79,
		minLV = 70,
		taskId = {
			411071
		}
	},
	{
		__mask = "YC",
		maxLv = 89,
		minLV = 80,
		taskId = {
			411081
		}
	},
	{
		__mask = "YC",
		maxLv = 99,
		minLV = 90,
		taskId = {
			411091
		}
	},
	{
		__mask = "YA",
		maxLv = 109,
		minLV = 100
	},
	{
		__mask = "YA",
		maxLv = 119,
		minLV = 110
	},
	{
		__mask = "YA",
		maxLv = 129,
		minLV = 120
	},
	{
		__mask = "YA",
		maxLv = 139,
		minLV = 130
	},
	{
		__mask = "YA",
		maxLv = 149,
		minLV = 140
	},
	{
		__mask = "YA",
		maxLv = 159,
		minLV = 150
	},
	{
		__mask = "YA",
		maxLv = 169,
		minLV = 160
	},
	{
		__mask = "YA",
		maxLv = 179,
		minLV = 170
	},
	{
		__mask = "YA",
		maxLv = 189,
		minLV = 180
	},
	{
		__mask = "YA",
		maxLv = 199,
		minLV = 190
	},
	{
		__mask = "hC",
		camp = 2,
		npc = 541,
		taskId = {
			421021
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 39,
		minLV = 30,
		npc = 541,
		taskId = {
			421031
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 49,
		minLV = 40,
		npc = 541,
		taskId = {
			421041
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 59,
		minLV = 50,
		npc = 541,
		taskId = {
			421051
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 69,
		minLV = 60,
		npc = 545,
		taskId = {
			421061
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 79,
		minLV = 70,
		npc = 545,
		taskId = {
			421071
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 89,
		minLV = 80,
		npc = 545,
		taskId = {
			421081
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 99,
		minLV = 90,
		npc = 545,
		taskId = {
			421091
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 109,
		minLV = 100,
		npc = 545,
		taskId = {
			421101
		}
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 119,
		minLV = 110,
		npc = 545,
		taskId = __rt_2
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 129,
		minLV = 120,
		npc = 545,
		taskId = __rt_2
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 139,
		minLV = 130,
		npc = 545,
		taskId = __rt_2
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 149,
		minLV = 140,
		npc = 545,
		taskId = __rt_2
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 159,
		minLV = 150,
		npc = 545,
		taskId = __rt_2
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 169,
		minLV = 160,
		npc = 545,
		taskId = __rt_2
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 179,
		minLV = 170,
		npc = 545,
		taskId = __rt_2
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 189,
		minLV = 180,
		npc = 545,
		taskId = __rt_2
	},
	{
		__mask = "5C",
		camp = 2,
		maxLv = 199,
		minLV = 190,
		npc = 545,
		taskId = __rt_2
	}
}
local __default_values = {
	camp = 1,
	describe = "@301187",
	doubleTime = "",
	maxLv = 29,
	minLV = 20,
	npc = 543,
	num = 2,
	taskId = __rt_1,
	tasktype = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( task_camp ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( task_camp, { __default = __default_values, __hash = 0x3fa59662, __masked = true } )
end

return task_camp
