local shop_carry_weight = 
{
	[101] = {
		groupId = 1
	},
	[102] = {
		count = 2,
		groupId = 1,
		salerate = 40
	},
	[103] = {
		count = 3,
		groupId = 1,
		salerate = 60
	},
	[104] = {
		count = 4,
		groupId = 1,
		salerate = 80
	},
	[201] = {
		salerate = 10
	},
	[202] = {
		count = 2
	},
	[203] = {
		count = 3,
		salerate = 30
	},
	[204] = {
		count = 4,
		salerate = 40
	},
	[205] = {
		count = 5,
		salerate = 50
	},
	[206] = {
		count = 6,
		salerate = 60
	},
	[207] = {
		count = 7,
		salerate = 70
	},
	[208] = {
		count = 8,
		salerate = 80
	},
	[301] = {
		groupId = 3
	},
	[302] = {
		count = 2,
		groupId = 3,
		salerate = 40
	},
	[303] = {
		count = 3,
		groupId = 3,
		salerate = 80
	},
	[401] = {
		groupId = 4,
		salerate = 10
	}
}
local __default_values = {
	count = 1,
	groupId = 2,
	salerate = 20
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( shop_carry_weight ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( shop_carry_weight, { __default = __default_values, __hash = 0x20561bd6, __masked = false } )
end

return shop_carry_weight
