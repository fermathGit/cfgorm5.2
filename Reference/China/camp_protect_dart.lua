local camp_protect_dart = 
{
	[1001] = {
		__mask = "Y",
		posX = 139.9,
		poxY = 59
	},
	[1002] = {
		__mask = "a",
		index = 2,
		posX = 143.6,
		poxY = 63.4
	},
	[1003] = {
		__mask = "a",
		index = 3,
		posX = 145.4,
		poxY = 67.6
	},
	[1004] = {
		__mask = "a",
		index = 4,
		posX = 145.7,
		poxY = 73.4
	},
	[1005] = {
		__mask = "a",
		index = 5,
		posX = 146.2,
		poxY = 80.4
	},
	[1006] = {
		__mask = "a",
		index = 6,
		posX = 146.7,
		poxY = 87.7
	},
	[1007] = {
		__mask = "a",
		index = 7,
		posX = 152,
		poxY = 90.4
	},
	[1008] = {
		__mask = "e",
		index = 8,
		notice = 1,
		posX = 157.1,
		poxY = 90.7
	},
	[1009] = {
		__mask = "a",
		index = 9,
		posX = 162.3,
		poxY = 92.2
	},
	[1010] = {
		__mask = "a",
		index = 10,
		posX = 167.1,
		poxY = 92.8
	},
	[1011] = {
		__mask = "a",
		index = 11,
		posX = 165.3,
		poxY = 99.1
	},
	[1012] = {
		__mask = "a",
		index = 12,
		posX = 163,
		poxY = 104.1
	},
	[1013] = {
		__mask = "e",
		index = 13,
		notice = 1,
		posX = 159,
		poxY = 107.5
	},
	[1014] = {
		__mask = "a",
		index = 14,
		posX = 152.5,
		poxY = 107.8
	},
	[1015] = {
		__mask = "S",
		index = 15,
		poxY = 107.7
	},
	[1016] = {
		__mask = "S",
		index = 16,
		poxY = 112.1
	},
	[1017] = {
		__mask = "e",
		index = 17,
		notice = 1,
		posX = 147.1,
		poxY = 122.9
	},
	[1018] = {
		__mask = "a",
		index = 18,
		posX = 144.3,
		poxY = 128.4
	},
	[1019] = {
		__mask = "a",
		index = 19,
		posX = 136.7,
		poxY = 132.9
	},
	[1020] = {
		__mask = "6",
		index = 20,
		posX = 139,
		poxY = 141.7,
		time = 2
	},
	[2001] = {
		__mask = "Z",
		camp = 2,
		posX = 56.4,
		poxY = 107.3
	},
	[2002] = {
		__mask = "L",
		camp = 2,
		index = 2,
		posX = 62.5
	},
	[2003] = {
		__mask = "L",
		camp = 2,
		index = 3,
		posX = 68.8
	},
	[2004] = {
		__mask = "L",
		camp = 2,
		index = 4,
		posX = 74.9
	},
	[2005] = {
		__mask = "b",
		camp = 2,
		index = 5,
		posX = 81.1,
		poxY = 106.6
	},
	[2006] = {
		__mask = "b",
		camp = 2,
		index = 6,
		posX = 85.2,
		poxY = 106.9
	},
	[2007] = {
		__mask = "f",
		camp = 2,
		index = 7,
		notice = 1,
		posX = 85.6,
		poxY = 111.2
	},
	[2008] = {
		__mask = "b",
		camp = 2,
		index = 8,
		posX = 85.9,
		poxY = 115.7
	},
	[2009] = {
		__mask = "b",
		camp = 2,
		index = 9,
		posX = 86.2,
		poxY = 121.1
	},
	[2010] = {
		__mask = "b",
		camp = 2,
		index = 10,
		posX = 92.6,
		poxY = 122.6
	},
	[2011] = {
		__mask = "b",
		camp = 2,
		index = 11,
		posX = 98.3,
		poxY = 122.4
	},
	[2012] = {
		__mask = "b",
		camp = 2,
		index = 12,
		posX = 104.4,
		poxY = 122.2
	},
	[2013] = {
		__mask = "f",
		camp = 2,
		index = 13,
		notice = 1,
		posX = 104.5,
		poxY = 116.1
	},
	[2014] = {
		__mask = "b",
		camp = 2,
		index = 14,
		posX = 104.8,
		poxY = 109.9
	},
	[2015] = {
		__mask = "b",
		camp = 2,
		index = 15,
		posX = 112.8,
		poxY = 110.1
	},
	[2016] = {
		__mask = "f",
		camp = 2,
		index = 16,
		notice = 1,
		posX = 120,
		poxY = 108.2
	},
	[2017] = {
		__mask = "b",
		camp = 2,
		index = 17,
		posX = 125.6,
		poxY = 106.3
	},
	[2018] = {
		__mask = "b",
		camp = 2,
		index = 18,
		posX = 130.9,
		poxY = 101.6
	},
	[2019] = {
		__mask = "f",
		camp = 2,
		index = 19,
		notice = 1,
		posX = 136.1,
		poxY = 107
	},
	[2020] = {
		__mask = "7",
		camp = 2,
		index = 20,
		posX = 140.8,
		poxY = 113.6,
		time = 2
	}
}
local __default_values = {
	camp = 1,
	index = 1,
	notice = 0,
	posX = 147.7,
	poxY = 107.1,
	time = 52
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( camp_protect_dart ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( camp_protect_dart, { __default = __default_values, __hash = 0x2e7ef2e1, __masked = true } )
end

return camp_protect_dart
