local __rt_1 = {
	{
		1001,
		20
	}
}
local __rt_2 = {
	{
		5001,
		20
	}
}
local __rt_3 = {
	{
		10001,
		30
	}
}
local __rt_4 = {
	{
		1003,
		10
	}
}
local __rt_5 = {
	{
		5003,
		20
	}
}
local __rt_6 = {
	10003,
	30
}
local __rt_7 = {
	{
		20001,
		50
	}
}
local redpacketsSystem = 
{
	{
		redpacketsContent = "@176315",
		redpacketsList = __rt_1,
		type = 0
	},
	{
		parm = 6,
		redpacketsContent = "@230162",
		redpacketsList = __rt_1,
		type = 0
	},
	{
		parm = 9,
		redpacketsContent = "@284009",
		redpacketsList = __rt_2,
		type = 0
	},
	{
		parm = 12,
		redpacketsContent = "@279891",
		redpacketsList = __rt_3,
		type = 0
	},
	{
		parm = 15,
		redpacketsContent = "@333738",
		redpacketsList = __rt_3,
		type = 0
	},
	{
		parm = 1,
		redpacketsContent = "@138770",
		redpacketsList = __rt_1,
		refreshType = 2,
		type = 1
	},
	{
		parm = 2,
		redpacketsContent = "@65838",
		redpacketsList = __rt_2,
		refreshType = 2,
		type = 1
	},
	{
		redpacketsContent = "@337396",
		redpacketsList = __rt_3,
		refreshType = 2,
		type = 1
	},
	{
		parm = 1000,
		redpacketsContent = "@36715",
		redpacketsList = __rt_4,
		refreshType = 0,
		type = 2
	},
	{
		parm = 1001,
		redpacketsContent = "@463919",
		redpacketsList = __rt_4,
		refreshType = 0,
		type = 2
	},
	{
		parm = 1002,
		redpacketsContent = "@445476",
		redpacketsList = __rt_4,
		refreshType = 0,
		type = 2
	},
	{
		parm = 1003,
		redpacketsContent = "@236923",
		redpacketsList = __rt_4,
		refreshType = 0,
		type = 2
	},
	{
		parm = 1004,
		redpacketsContent = "@79179",
		redpacketsList = __rt_4,
		refreshType = 0,
		type = 2
	},
	{
		redpacketsContent = "@121908"
	},
	{
		parm = 4,
		redpacketsContent = "@325443"
	},
	{
		parm = 5,
		redpacketsContent = "@4690"
	},
	{
		parm = 6,
		redpacketsContent = "@208227"
	},
	{
		parm = 7,
		redpacketsContent = "@411760"
	},
	{
		parm = 8,
		redpacketsContent = "@91008"
	},
	{
		parm = 9,
		redpacketsContent = "@294542"
	},
	{
		parm = 10,
		redpacketsContent = "@151082"
	},
	{
		parm = 1,
		redpacketsContent = "@253210",
		redpacketsList = __rt_1,
		type = 4
	},
	{
		parm = 0,
		redpacketsContent = "@339088",
		redpacketsList = {
			__rt_6,
			{
				20002,
				50
			}
		},
		refreshType = 0,
		type = 5
	},
	{
		parm = 1,
		redpacketsContent = "@212542",
		redpacketsList = __rt_7,
		type = 6
	},
	{
		parm = 2,
		redpacketsContent = "@419394",
		redpacketsList = __rt_7,
		type = 6
	},
	{
		redpacketsContent = "@441075",
		redpacketsList = __rt_7,
		type = 6
	},
	{
		parm = 4,
		redpacketsContent = "@79442",
		redpacketsList = __rt_7,
		type = 6
	},
	{
		parm = 5,
		redpacketsContent = "@230662",
		redpacketsList = __rt_7,
		type = 6
	},
	{
		parm = 6,
		redpacketsContent = "@356007",
		redpacketsList = __rt_7,
		type = 6
	},
	{
		parm = 7,
		redpacketsContent = "@164750",
		redpacketsList = __rt_7,
		type = 6
	},
	{
		parm = 0,
		redpacketsList = {
			__rt_6
		},
		refreshType = 0,
		type = 7
	}
}
local __default_values = {
	parm = 3,
	redpacketsContent = "@112834",
	redpacketsList = __rt_5,
	refreshType = 4,
	type = 3
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( redpacketsSystem ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( redpacketsSystem, { __default = __default_values, __hash = 0x28f8fe34, __masked = false } )
end

return redpacketsSystem
