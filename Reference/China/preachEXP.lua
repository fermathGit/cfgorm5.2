local preachEXP = 
{
	{
	},
	{
		level = 2
	},
	{
		level = 3
	},
	{
		level = 4
	},
	{
		level = 5
	},
	{
		level = 6
	},
	{
		level = 7
	},
	{
		level = 8
	},
	{
		level = 9
	},
	{
		level = 10
	},
	{
		level = 11
	},
	{
		level = 12
	},
	{
		level = 13
	},
	{
		level = 14
	},
	{
		level = 15
	},
	{
		level = 16
	},
	{
		level = 17
	},
	{
		level = 18
	},
	{
		level = 19
	},
	{
		level = 20
	},
	{
		level = 21
	},
	{
		level = 22
	},
	{
		level = 23
	},
	{
		level = 24
	},
	{
		level = 25
	},
	{
		level = 26
	},
	{
		level = 27
	},
	{
		level = 28
	},
	{
		level = 29
	},
	{
		level = 30
	},
	{
		level = 31
	},
	{
		level = 32
	},
	{
		level = 33
	},
	{
		level = 34
	},
	{
		level = 35
	},
	{
		level = 36
	},
	{
		level = 37
	},
	{
		level = 38
	},
	{
		level = 39
	},
	{
		level = 40
	},
	{
		level = 41
	},
	{
		level = 42
	},
	{
		level = 43
	},
	{
		level = 44
	},
	{
		level = 45
	},
	{
		level = 46
	},
	{
		level = 47
	},
	{
		level = 48
	},
	{
		level = 49
	},
	{
		level = 50
	},
	{
		level = 51
	},
	{
		level = 52
	},
	{
		level = 53
	},
	{
		level = 54
	},
	{
		level = 55
	},
	{
		level = 56
	},
	{
		level = 57
	},
	{
		level = 58
	},
	{
		level = 59
	},
	{
		exp = 6500,
		level = 60
	},
	{
		exp = 6500,
		level = 61
	},
	{
		exp = 6500,
		level = 62
	},
	{
		exp = 6500,
		level = 63
	},
	{
		exp = 6500,
		level = 64
	},
	{
		exp = 6500,
		level = 65
	},
	{
		exp = 6500,
		level = 66
	},
	{
		exp = 6500,
		level = 67
	},
	{
		exp = 6500,
		level = 68
	},
	{
		exp = 6500,
		level = 69
	},
	{
		exp = 8000,
		level = 70
	},
	{
		exp = 8000,
		level = 71
	},
	{
		exp = 8000,
		level = 72
	},
	{
		exp = 8000,
		level = 73
	},
	{
		exp = 8000,
		level = 74
	},
	{
		exp = 8000,
		level = 75
	},
	{
		exp = 8000,
		level = 76
	},
	{
		exp = 8000,
		level = 77
	},
	{
		exp = 8000,
		level = 78
	},
	{
		exp = 8000,
		level = 79
	},
	{
		exp = 9500,
		level = 80
	},
	{
		exp = 9500,
		level = 81
	},
	{
		exp = 9500,
		level = 82
	},
	{
		exp = 9500,
		level = 83
	},
	{
		exp = 9500,
		level = 84
	},
	{
		exp = 9500,
		level = 85
	},
	{
		exp = 9500,
		level = 86
	},
	{
		exp = 9500,
		level = 87
	},
	{
		exp = 9500,
		level = 88
	},
	{
		exp = 9500,
		level = 89
	},
	{
		exp = 11000,
		level = 90
	},
	{
		exp = 11000,
		level = 91
	},
	{
		exp = 11000,
		level = 92
	},
	{
		exp = 11000,
		level = 93
	},
	{
		exp = 11000,
		level = 94
	},
	{
		exp = 11000,
		level = 95
	},
	{
		exp = 11000,
		level = 96
	},
	{
		exp = 11000,
		level = 97
	},
	{
		exp = 11000,
		level = 98
	},
	{
		exp = 11000,
		level = 99
	},
	{
		exp = 12500,
		level = 100
	},
	{
		exp = 12500,
		level = 101
	},
	{
		exp = 12500,
		level = 102
	},
	{
		exp = 12500,
		level = 103
	},
	{
		exp = 12500,
		level = 104
	},
	{
		exp = 12500,
		level = 105
	},
	{
		exp = 12500,
		level = 106
	},
	{
		exp = 12500,
		level = 107
	},
	{
		exp = 12500,
		level = 108
	},
	{
		exp = 12500,
		level = 109
	},
	{
		exp = 14000,
		level = 110
	},
	{
		exp = 14000,
		level = 111
	},
	{
		exp = 14000,
		level = 112
	},
	{
		exp = 14000,
		level = 113
	},
	{
		exp = 14000,
		level = 114
	},
	{
		exp = 14000,
		level = 115
	},
	{
		exp = 14000,
		level = 116
	},
	{
		exp = 14000,
		level = 117
	},
	{
		exp = 14000,
		level = 118
	},
	{
		exp = 14000,
		level = 119
	},
	{
		exp = 16000,
		level = 120
	}
}
local __default_values = {
	exp = 5000,
	level = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( preachEXP ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( preachEXP, { __default = __default_values, __hash = 0x3ab8a227, __masked = false } )
end

return preachEXP
