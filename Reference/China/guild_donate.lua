local __rt_1 = {
	{
		21,
		0
	}
}
local guild_donate = 
{
	{
		__mask = "CA",
		des = "@88757"
	},
	{
		__mask = "XH",
		consumption = {
			{
				3,
				40
			}
		},
		des = "@66093",
		giveItemId = 15205,
		guild_contri = 50,
		guild_paly = 25,
		guild_prot = 50,
		self_exp = {
			{
				1,
				59,
				20000
			},
			{
				60,
				69,
				900000
			},
			{
				70,
				79,
				1350000
			},
			{
				80,
				89,
				1800000
			},
			{
				90,
				99,
				2250000
			},
			{
				100,
				109,
				2700000
			},
			{
				110,
				119,
				3150000
			}
		}
	},
	{
		__mask = "VH",
		consumption = {
			{
				3,
				200
			}
		},
		giveItemId = 15300,
		guild_contri = 200,
		guild_paly = 100,
		guild_prot = 200,
		self_exp = {
			{
				1,
				59,
				50000
			},
			{
				60,
				69,
				1200000
			},
			{
				70,
				79,
				1800000
			},
			{
				80,
				89,
				2400000
			},
			{
				90,
				99,
				3000000
			},
			{
				100,
				109,
				3600000
			},
			{
				110,
				119,
				4200000
			}
		}
	}
}
local __default_values = {
	consumption = {
		{
			1,
			100000
		}
	},
	des = "@269259",
	giveItemId = 15100,
	guid_expe = 0,
	guild_contri = 20,
	guild_ewards = __rt_1,
	guild_paly = 10,
	guild_prot = 20,
	self_exp = {
		{
			1,
			59,
			10000
		},
		{
			60,
			69,
			600000
		},
		{
			70,
			79,
			900000
		},
		{
			80,
			89,
			1200000
		},
		{
			90,
			99,
			1500000
		},
		{
			100,
			109,
			1800000
		},
		{
			110,
			119,
			2100000
		}
	}
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( guild_donate ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( guild_donate, { __default = __default_values, __hash = 0x23757e56, __masked = true } )
end

return guild_donate
