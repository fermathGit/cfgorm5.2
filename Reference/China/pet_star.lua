local pet_star = 
{
	{
		attes = {
			{
				1,
				163
			},
			{
				3,
				17
			},
			{
				4,
				17
			},
			{
				5,
				11
			},
			{
				6,
				11
			},
			{
				14,
				4
			},
			{
				16,
				4
			},
			{
				18,
				4
			},
			{
				47,
				4
			},
			{
				20,
				4
			},
			{
				34,
				4
			}
		}
	},
	{
		attes = {
			{
				1,
				506
			},
			{
				3,
				45
			},
			{
				4,
				45
			},
			{
				5,
				30
			},
			{
				6,
				30
			},
			{
				14,
				8
			},
			{
				16,
				8
			},
			{
				18,
				8
			},
			{
				47,
				8
			},
			{
				20,
				8
			},
			{
				34,
				8
			}
		},
		degree = 15,
		moneyNum = 200000,
		need_level = 10,
		petMoney = 100
	},
	{
		degree = 20,
		moneyNum = 300000,
		need_level = 30,
		petMoney = 200
	},
	{
		attes = {
			{
				1,
				1807
			},
			{
				3,
				153
			},
			{
				4,
				153
			},
			{
				5,
				105
			},
			{
				6,
				105
			},
			{
				14,
				22
			},
			{
				16,
				22
			},
			{
				18,
				22
			},
			{
				47,
				22
			},
			{
				20,
				22
			},
			{
				34,
				22
			}
		},
		degree = 25,
		moneyNum = 400000,
		need_level = 50,
		petMoney = 400
	},
	{
		attes = {
			{
				1,
				2763
			},
			{
				3,
				233
			},
			{
				4,
				233
			},
			{
				5,
				159
			},
			{
				6,
				159
			},
			{
				14,
				34
			},
			{
				16,
				34
			},
			{
				18,
				34
			},
			{
				47,
				34
			},
			{
				20,
				34
			},
			{
				34,
				34
			}
		},
		degree = 30,
		moneyNum = 500000,
		need_level = 70,
		petMoney = 600
	},
	{
		attes = {
			{
				1,
				3920
			},
			{
				3,
				329
			},
			{
				4,
				329
			},
			{
				5,
				226
			},
			{
				6,
				226
			},
			{
				14,
				48
			},
			{
				16,
				48
			},
			{
				18,
				48
			},
			{
				47,
				48
			},
			{
				20,
				48
			},
			{
				34,
				48
			}
		},
		degree = 35,
		moneyNum = 600000,
		need_level = 90,
		petMoney = 800
	},
	{
		attes = {
			{
				1,
				5280
			},
			{
				3,
				443
			},
			{
				4,
				443
			},
			{
				5,
				303
			},
			{
				6,
				303
			},
			{
				14,
				65
			},
			{
				16,
				65
			},
			{
				18,
				65
			},
			{
				47,
				65
			},
			{
				20,
				65
			},
			{
				34,
				65
			}
		},
		degree = 40,
		moneyNum = 700000,
		need_level = 110,
		petMoney = 1600
	}
}
local __default_values = {
	attes = {
		{
			1,
			1054
		},
		{
			3,
			90
		},
		{
			4,
			90
		},
		{
			5,
			62
		},
		{
			6,
			62
		},
		{
			14,
			13
		},
		{
			16,
			13
		},
		{
			18,
			13
		},
		{
			47,
			13
		},
		{
			20,
			13
		},
		{
			34,
			13
		}
	},
	degree = 10,
	moneyNum = 100000,
	need_level = 1,
	petMoney = 50
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( pet_star ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( pet_star, { __default = __default_values, __hash = 0x3522ae85, __masked = false } )
end

return pet_star
