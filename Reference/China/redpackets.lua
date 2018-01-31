local __rt_1 = {
	8,
	28,
	58
}
local __rt_2 = {
	8,
	28,
	58,
	68
}
local __rt_3 = {
	8,
	28,
	58,
	68,
	88
}
local __rt_4 = {
	8,
	28,
	58,
	68,
	88,
	108
}
local __rt_5 = {
	8,
	28,
	58,
	68,
	88,
	108,
	188
}
local redpackets = 
{
	[601] = {
		__mask = "I",
		num = __rt_1
	},
	[602] = {
		__mask = "o",
		num = __rt_1,
		type = 2
	},
	[603] = {
		__mask = "o",
		num = __rt_1,
		type = 3
	},
	[1001] = {
		__mask = "Z",
		getMoney = 100,
		num = __rt_2,
		redGold = 100
	},
	[1002] = {
		__mask = "5",
		getMoney = 100,
		num = __rt_2,
		redGold = 100,
		type = 2
	},
	[1003] = {
		__mask = "5",
		getMoney = 100,
		num = __rt_2,
		redGold = 100,
		type = 3
	},
	[3001] = {
		__mask = "Z",
		getMoney = 300,
		num = __rt_3,
		redGold = 300
	},
	[3002] = {
		__mask = "5",
		getMoney = 300,
		num = __rt_3,
		redGold = 300,
		type = 2
	},
	[3003] = {
		__mask = "5",
		getMoney = 300,
		num = __rt_3,
		redGold = 300,
		type = 3
	},
	[5001] = {
		__mask = "Z",
		getMoney = 500,
		num = __rt_4,
		redGold = 500
	},
	[5002] = {
		__mask = "5",
		getMoney = 500,
		num = __rt_4,
		redGold = 500,
		type = 2
	},
	[5003] = {
		__mask = "5",
		getMoney = 500,
		num = __rt_4,
		redGold = 500,
		type = 3
	},
	[10001] = {
		__mask = "R",
		getMoney = 1000,
		redGold = 1000
	},
	[10002] = {
		__mask = "x",
		getMoney = 1000,
		redGold = 1000,
		type = 2
	},
	[10003] = {
		__mask = "x",
		getMoney = 1000,
		redGold = 1000,
		type = 3
	},
	[20001] = {
		__mask = "R",
		getMoney = 2000,
		redGold = 2000
	},
	[20002] = {
		__mask = "x",
		getMoney = 2000,
		redGold = 2000,
		type = 2
	},
	[20003] = {
		__mask = "x",
		getMoney = 2000,
		redGold = 2000,
		type = 3
	},
	[100001] = {
		__mask = "R",
		getMoney = 10000,
		redGold = 10000
	}
}
local __default_values = {
	getMoney = 60,
	hide = 0,
	iconExistTime = 300,
	num = __rt_5,
	redGold = 60,
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( redpackets ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( redpackets, { __default = __default_values, __hash = 0x0321b984, __masked = true } )
end

return redpackets
