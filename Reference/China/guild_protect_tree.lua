local guild_protect_tree = 
{
	{
		__mask = "AA"
	},
	{
		__mask = "vB",
		boss = {
			33002,
			59,
			94
		},
		boss_rew = {
			44302
		},
		exp = 500,
		level = 2,
		monster = {
			32002,
			32102,
			32202
		},
		monster_rew = {
			44202
		}
	},
	{
		__mask = "vB",
		boss = {
			33003,
			59,
			94
		},
		boss_rew = {
			44303
		},
		exp = 1000,
		level = 3,
		monster = {
			32003,
			32103,
			32203
		},
		monster_rew = {
			44203
		}
	},
	{
		__mask = "vB",
		boss = {
			33004,
			59,
			94
		},
		boss_rew = {
			44304
		},
		exp = 1500,
		level = 4,
		monster = {
			32004,
			32104,
			32204
		},
		monster_rew = {
			44204
		}
	},
	{
		__mask = "vB",
		boss = {
			33005,
			59,
			94
		},
		boss_rew = {
			44305
		},
		exp = 2000,
		level = 5,
		monster = {
			32005,
			32105,
			32205
		},
		monster_rew = {
			44205
		}
	}
}
local __default_values = {
	boss = {
		33001,
		59,
		94
	},
	boss_rew = {
		44301
	},
	exp = 0,
	level = 1,
	level_rew = "",
	monster = {
		32001,
		32101,
		32201
	},
	monster_rew = {
		44201
	},
	num = 20
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( guild_protect_tree ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( guild_protect_tree, { __default = __default_values, __hash = 0x54feb5b6, __masked = true } )
end

return guild_protect_tree
