local Accessresources = 
{
	[100] = {
		Type = 1
	},
	[101] = {
		Type = 1,
		Type_id = 2
	},
	[102] = {
		Type = 1,
		Type_id = 3
	},
	[103] = {
		Type = 1,
		Type_id = 4
	},
	[104] = {
		Type = 1,
		Type_id = 5
	},
	[105] = {
		Type = 1,
		Type_id = 6,
		hide = 1
	},
	[106] = {
		Type = 1,
		Type_id = 7,
		hide = 1
	},
	[107] = {
		Type = 1,
		Type_id = 8,
		hide = 1
	},
	[108] = {
		Type = 1,
		Type_id = 9,
		hide = 1
	},
	[200] = {
		Type_id = 41
	},
	[201] = {
		Type_id = 51
	},
	[202] = {
		Type_id = 100302
	},
	[203] = {
		Type_id = 71
	},
	[204] = {
		Type_id = 73
	},
	[205] = {
		Type_id = 81
	},
	[206] = {
		Type_id = 650
	},
	[207] = {
		Type_id = 651
	},
	[208] = {
		Type_id = 652
	},
	[209] = {
		Type_id = 660
	},
	[210] = {
		Type_id = 661
	},
	[211] = {
		Type_id = 662
	},
	[300] = {
		Type = 3,
		Type_id = 30
	},
	[301] = {
		Type = 3,
		Type_id = 32
	},
	[302] = {
		Type = 3,
		Type_id = 34
	}
}
local __default_values = {
	Type = 2,
	Type_id = 1,
	hide = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( Accessresources ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( Accessresources, { __default = __default_values, __hash = 0x2de3a3a9, __masked = false } )
end

return Accessresources
