local __rt_1 = {
	EffectTargetType = 1,
	EffectType = 11,
	Param1 = 1.8,
	Param2 = 301,
	__mask = "8A"
}
local __rt_2 = {
	EffectType = 11,
	Param1 = 2,
	Param2 = 1501,
	__mask = "4A"
}
local __rt_3 = {
	EffectType = 6,
	Param1 = 0,
	Param2 = 1.5,
	__mask = "4A"
}
local __rt_4 = {
	Param1 = 2500,
	Param2 = 40021,
	__mask = "wA"
}
local __rt_5 = {
	EffectType = 11,
	Param1 = 1.8,
	Param2 = 30022,
	__mask = "4A"
}
local __rt_6 = {
	EffectType = 10,
	Param1 = 3,
	Param2 = 51520,
	__mask = "4A"
}
local skilleffect = 
{
	[102] = {
		EffectTargetType = 1,
		EffectType = 10,
		Param1 = 0.7,
		Param2 = 102,
		__mask = "8A"
	},
	[103] = {
		EffectTargetType = 1,
		Param1 = 103,
		Param2 = 5000,
		__mask = "0A"
	},
	[104] = {
		EffectTargetType = 1,
		EffectType = 11,
		Param1 = 1.8,
		Param2 = 104,
		__mask = "8A"
	},
	[202] = {
		EffectTargetType = 1,
		EffectType = 10,
		Param1 = 0.7,
		Param2 = 202,
		__mask = "8A"
	},
	[203] = {
		EffectTargetType = 1,
		EffectType = 11,
		Param1 = 1.8,
		Param2 = 203,
		__mask = "8A"
	},
	[301] = __rt_1,
	[302] = {
		EffectTargetType = 1,
		EffectType = 10,
		Param1 = 0.1,
		Param2 = 0,
		__mask = "8A"
	},
	[401] = {
		EffectTargetType = 1,
		EffectType = 11,
		Param1 = 1.8,
		Param2 = 401,
		__mask = "8A"
	},
	[1501] = __rt_2,
	[1502] = {
		EffectType = 3,
		Param1 = 411,
		Param2 = 6,
		__mask = "4A"
	},
	[1503] = {
		EffectType = 3,
		Param1 = 410,
		Param2 = 6,
		__mask = "4A"
	},
	[1504] = {
		Param2 = 1502,
		__mask = "gA"
	},
	[1505] = {
		Param2 = 1503,
		__mask = "gA"
	},
	[1506] = {
		EffectType = 8,
		Param1 = 2,
		Param2 = 0.65,
		__mask = "4A"
	},
	[1507] = {
		Param2 = 1505,
		__mask = "gA"
	},
	[1508] = {
		EffectDelay = 300,
		Param2 = 1506,
		__mask = "hA"
	},
	[1509] = {
		Param1 = 5000,
		Param2 = 1506,
		__mask = "wA"
	},
	[1510] = {
		EffectDelay = 300,
		Param2 = 1507,
		__mask = "hA"
	},
	[1511] = {
		EffectTargetType = 15,
		EffectType = 3,
		Param1 = 2096,
		Param2 = 3,
		__mask = "8A"
	},
	[1512] = __rt_3,
	[1513] = {
		EffectDelay = 300,
		EffectType = 11,
		Param1 = 4,
		Param2 = 1501,
		__mask = "5A"
	},
	[1514] = {
		EffectType = 3,
		Param1 = 413,
		Param2 = 6,
		__mask = "4A"
	},
	[1515] = {
		Param2 = 1509,
		__mask = "gA"
	},
	[1516] = {
		EffectTarget = 1,
		EffectTargetType = 15,
		EffectType = 9,
		Param1 = 35,
		__mask = "eA"
	},
	[1517] = {
		EffectDelay = 300,
		Param2 = 1510,
		__mask = "hA"
	},
	[1518] = {
		EffectDelay = 300,
		Param2 = 1511,
		__mask = "hA"
	},
	[1520] = {
		EffectTarget = 1,
		EffectTargetType = 15,
		EffectType = 9,
		Param1 = 38,
		__mask = "eA"
	},
	[1521] = {
		EffectTargetType = 15,
		EffectType = 3,
		Param1 = 39,
		__mask = "cA"
	},
	[1522] = {
		EffectTargetType = 15,
		Param2 = 1512,
		__mask = "kA"
	},
	[1530] = {
		EffectTargetType = 15,
		Param2 = 1513,
		__mask = "kA"
	},
	[1531] = {
		EffectTarget = 1,
		Param1 = 650,
		Param2 = 7521,
		__mask = "yA"
	},
	[5000] = {
		EffectTargetType = 15,
		Param2 = 5000,
		__mask = "kA"
	},
	[5001] = {
		EffectTargetType = 15,
		EffectType = 3,
		Param1 = 1141,
		__mask = "cA"
	},
	[5002] = {
		EffectTargetType = 15,
		EffectType = 3,
		Param1 = 1142,
		__mask = "cA"
	},
	[5003] = {
		EffectTarget = 1,
		Param2 = 5003,
		__mask = "iA"
	},
	[5004] = {
		EffectType = 9,
		Param1 = 1143,
		__mask = "YA"
	},
	[5005] = {
		EffectTargetType = 15,
		EffectType = 3,
		Param1 = 1144,
		__mask = "cA"
	},
	[5006] = {
		EffectTargetType = 15,
		EffectType = 3,
		Param1 = 1145,
		__mask = "cA"
	},
	[5007] = {
		EffectTargetType = 15,
		EffectType = 3,
		Param1 = 1146,
		__mask = "cA"
	},
	[5008] = {
		EffectTargetType = 15,
		Param2 = 5004,
		__mask = "kA"
	},
	[5009] = {
		EffectTargetType = 15,
		Param2 = 5005,
		__mask = "kA"
	},
	[5010] = {
		EffectTargetType = 15,
		Param2 = 5006,
		__mask = "kA"
	},
	[5011] = {
		EffectTargetType = 15,
		Param2 = 5007,
		__mask = "kA"
	},
	[5012] = {
		EffectTargetType = 15,
		Param2 = 5008,
		__mask = "kA"
	},
	[5101] = {
		Param1 = 5000,
		Param2 = 33011,
		__mask = "wA"
	},
	[5102] = __rt_1,
	[5103] = __rt_4,
	[5104] = {
		EffectTargetType = 4,
		Param1 = 13021,
		Param2 = 10000,
		__mask = "0A"
	},
	[7521] = {
		EffectTarget = 1,
		Param1 = 5000,
		Param2 = 7521,
		__mask = "yA"
	},
	[7522] = {
		EffectTarget = 1,
		Param1 = 2000,
		Param2 = 7522,
		__mask = "yA"
	},
	[7523] = {
		EffectTarget = 1,
		Param1 = 8000,
		Param2 = 7522,
		__mask = "yA"
	},
	[7524] = {
		EffectTarget = 1,
		Param2 = 7522,
		__mask = "iA"
	},
	[7525] = {
		EffectTarget = 3,
		EffectTargetType = 3,
		EffectType = 8,
		Param1 = 4,
		Param2 = 0.2,
		__mask = "+A"
	},
	[7526] = {
		EffectTarget = 3,
		EffectTargetType = 3,
		EffectType = 8,
		Param1 = 4,
		Param2 = 0.5,
		__mask = "+A"
	},
	[7527] = {
		EffectTarget = 1,
		Param1 = 5000,
		Param2 = 7522,
		__mask = "yA"
	},
	[7528] = {
		EffectTarget = 1,
		Param1 = 1000,
		Param2 = 7528,
		__mask = "yA"
	},
	[7529] = {
		EffectTarget = 1,
		Param1 = 4000,
		Param2 = 7528,
		__mask = "yA"
	},
	[7530] = {
		EffectTarget = 1,
		Param2 = 6001,
		__mask = "iA"
	},
	[7531] = {
		EffectTarget = 1,
		Param2 = 6002,
		__mask = "iA"
	},
	[7532] = {
		EffectTarget = 1,
		Param2 = 6004,
		__mask = "iA"
	},
	[7533] = {
		EffectTarget = 1,
		Param2 = 6005,
		__mask = "iA"
	},
	[7534] = {
		EffectTarget = 1,
		Param2 = 6006,
		__mask = "iA"
	},
	[7535] = {
		EffectTarget = 1,
		Param2 = 6007,
		__mask = "iA"
	},
	[7536] = {
		EffectTarget = 1,
		EffectTargetType = 15,
		EffectType = 3,
		Param1 = 28,
		__mask = "eA"
	},
	[9011] = {
		EffectType = 9,
		Param1 = 401,
		__mask = "YA"
	},
	[9012] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 5111,
		__mask = "mA"
	},
	[10023] = {
		EffectType = 11,
		Param1 = 2.5,
		Param2 = 10023,
		__mask = "4A"
	},
	[11001] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		EffectType = 9,
		Param1 = 101,
		Param2 = 0,
		__mask = "+A"
	},
	[11002] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 11002,
		__mask = "mA"
	},
	[11003] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 11001,
		__mask = "mA"
	},
	[11011] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		EffectType = 9,
		Param1 = 102,
		Param2 = 0,
		__mask = "+A"
	},
	[11012] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 11011,
		__mask = "mA"
	},
	[11022] = {
		EffectTargetType = 15,
		Param2 = 11022,
		__mask = "kA"
	},
	[12001] = {
		EffectTarget = 1,
		EffectTargetType = 15,
		EffectType = 9,
		Param1 = 111,
		__mask = "eA"
	},
	[12011] = {
		EffectTarget = 1,
		EffectTargetType = 15,
		EffectType = 9,
		Param1 = 112,
		__mask = "eA"
	},
	[12021] = {
		EffectTarget = 1,
		EffectTargetType = 15,
		EffectType = 9,
		Param1 = 113,
		__mask = "eA"
	},
	[13001] = {
		EffectTargetType = 15,
		Param1 = 5000,
		Param2 = 13001,
		__mask = "0A"
	},
	[13011] = {
		EffectTargetType = 15,
		Param2 = 13011,
		__mask = "kA"
	},
	[13021] = {
		EffectTargetType = 15,
		Param2 = 13021,
		__mask = "kA"
	},
	[14001] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		EffectType = 2,
		Param1 = 1,
		Param2 = 0,
		__mask = "+A"
	},
	[14011] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 14011,
		__mask = "mA"
	},
	[14021] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		EffectType = 8,
		Param1 = 4,
		Param2 = 0.15,
		__mask = "+A"
	},
	[14022] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 14022,
		__mask = "mA"
	},
	[15002] = {
		EffectTargetType = 1,
		EffectType = 11,
		Param1 = 2.5,
		Param2 = 10023,
		__mask = "8A"
	},
	[15011] = {
		EffectTarget = 3,
		EffectTargetType = 4,
		Param2 = 15011,
		__mask = "mA"
	},
	[20021] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 20021,
		__mask = "mA"
	},
	[21001] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 21001,
		__mask = "mA"
	},
	[21011] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 21011,
		__mask = "mA"
	},
	[21021] = {
		EffectType = 11,
		Param1 = 1.8,
		Param2 = 21021,
		__mask = "4A"
	},
	[22022] = {
		Param2 = 22022,
		__mask = "gA"
	},
	[23021] = {
		Param1 = 4000,
		Param2 = 23021,
		__mask = "wA"
	},
	[25011] = {
		EffectTarget = 3,
		EffectTargetType = 4,
		Param2 = 25011,
		__mask = "mA"
	},
	[25012] = __rt_3,
	[30022] = __rt_5,
	[31001] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 31001,
		__mask = "mA"
	},
	[31002] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		EffectType = 7,
		Param1 = 103,
		__mask = "eA"
	},
	[31011] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		EffectType = 7,
		Param1 = 101,
		__mask = "eA"
	},
	[31021] = {
		EffectTargetType = 0,
		Param2 = 31021,
		__mask = "kA"
	},
	[32001] = {
		Param1 = 5000,
		Param2 = 32001,
		__mask = "wA"
	},
	[32011] = {
		Param2 = 32011,
		__mask = "gA"
	},
	[32021] = {
		Param1 = 5000,
		Param2 = 32021,
		__mask = "wA"
	},
	[33011] = {
		Param1 = 4000,
		Param2 = 33011,
		__mask = "wA"
	},
	[35001] = __rt_3,
	[35002] = __rt_5,
	[35011] = {
		EffectTarget = 3,
		EffectTargetType = 4,
		Param2 = 35011,
		__mask = "mA"
	},
	[40021] = __rt_4,
	[41001] = {
		EffectTarget = 3,
		Param2 = 41001,
		__mask = "iA"
	},
	[41011] = {
		EffectTarget = 3,
		Param2 = 41011,
		__mask = "iA"
	},
	[41021] = {
		Param1 = 2500,
		Param2 = 41021,
		__mask = "wA"
	},
	[43001] = {
		EffectTarget = 5,
		Param2 = 43001,
		TargetNum = 6,
		TargetRange = 10,
		__mask = "iD"
	},
	[43011] = {
		EffectTarget = 5,
		Param2 = 43011,
		TargetNum = 6,
		TargetRange = 10,
		__mask = "iD"
	},
	[43022] = {
		EffectTarget = 3,
		EffectTargetType = 0,
		Param2 = 43022,
		__mask = "mA"
	},
	[45002] = {
		EffectDelay = 350,
		EffectTarget = 1,
		EffectTargetType = 15,
		EffectType = 7,
		Param1 = 102,
		__mask = "fA"
	},
	[45011] = {
		EffectTarget = 3,
		EffectTargetType = 4,
		Param2 = 45011,
		__mask = "mA"
	},
	[45012] = {
		EffectDelay = 350,
		EffectTarget = 1,
		EffectTargetType = 15,
		EffectType = 7,
		Param1 = 102,
		Param2 = 2,
		__mask = "/A"
	},
	[51130] = {
		Param1 = 2500,
		Param2 = 51130,
		__mask = "wA"
	},
	[51140] = {
		Param2 = 51140,
		__mask = "gA"
	},
	[51230] = {
		Param2 = 51230,
		__mask = "gA"
	},
	[51340] = {
		Param2 = 51340,
		__mask = "gA"
	},
	[51410] = {
		EffectType = 10,
		Param1 = 3,
		Param2 = 51410,
		__mask = "4A"
	},
	[51420] = {
		Param2 = 51420,
		__mask = "gA"
	},
	[51430] = {
		Param2 = 51430,
		__mask = "gA"
	},
	[51440] = {
		Param2 = 51440,
		__mask = "gA"
	},
	[51510] = {
		Param2 = 51510,
		__mask = "gA"
	},
	[51520] = __rt_6,
	[51540] = {
		EffectTarget = 3,
		Param2 = 51540,
		__mask = "iA"
	},
	[51610] = {
		EffectType = 11,
		Param1 = 3,
		Param2 = 51610,
		__mask = "4A"
	},
	[51630] = {
		Param2 = 51630,
		__mask = "gA"
	},
	[51810] = {
		Param2 = 51810,
		__mask = "gA"
	},
	[51820] = {
		Param2 = 51820,
		__mask = "gA"
	},
	[52010] = {
		Param2 = 52010,
		__mask = "gA"
	},
	[52020] = {
		Param2 = 52020,
		__mask = "gA"
	},
	[52030] = {
		Param2 = 52030,
		__mask = "gA"
	},
	[52040] = {
		Param2 = 52040,
		__mask = "gA"
	},
	[52050] = {
		Param2 = 52050,
		__mask = "gA"
	},
	[52060] = {
		Param2 = 52060,
		__mask = "gA"
	},
	[52070] = {
		Param2 = 52070,
		__mask = "gA"
	},
	[52080] = {
		Param2 = 52080,
		__mask = "gA"
	},
	[52210] = {
		Param2 = 52210,
		__mask = "gA"
	},
	[52220] = {
		Param2 = 52220,
		__mask = "gA"
	},
	[52510] = {
		Param2 = 52510,
		__mask = "gA"
	},
	[52530] = __rt_6,
	[52710] = {
		Param2 = 52710,
		__mask = "gA"
	},
	[52720] = {
		Param2 = 52720,
		__mask = "gA"
	},
	[53020] = {
		Param2 = 53020,
		__mask = "gA"
	},
	[53510] = {
		Param1 = 1500,
		Param2 = 53510,
		__mask = "wA"
	},
	[53520] = {
		Param1 = 1500,
		Param2 = 53520,
		__mask = "wA"
	},
	[53530] = {
		Param1 = 1500,
		Param2 = 53530,
		__mask = "wA"
	},
	[53540] = {
		Param1 = 1500,
		Param2 = 53540,
		__mask = "wA"
	},
	[53710] = {
		Param1 = 2500,
		Param2 = 53710,
		__mask = "wA"
	},
	[53720] = {
		Param1 = 2500,
		Param2 = 53720,
		__mask = "wA"
	},
	[54510] = {
		Param1 = 2500,
		Param2 = 54510,
		__mask = "wA"
	},
	[54520] = {
		Param1 = 2500,
		Param2 = 54520,
		__mask = "wA"
	},
	[54710] = {
		Param1 = 2500,
		Param2 = 54710,
		__mask = "wA"
	},
	[55010] = {
		EffectType = 5,
		Param1 = 0,
		Param2 = 0,
		__mask = "4A"
	},
	[57510] = {
		Param2 = 57510,
		__mask = "gA"
	},
	[57610] = {
		Param2 = 57610,
		__mask = "gA"
	},
	[57710] = {
		Param2 = 57710,
		__mask = "gA"
	},
	[58010] = {
		Param2 = 58010,
		__mask = "gA"
	},
	[58210] = {
		Param2 = 58210,
		__mask = "gA"
	},
	[58610] = {
		Param2 = 58610,
		__mask = "gA"
	},
	[61010] = {
		Param2 = 61010,
		__mask = "gA"
	},
	[61020] = {
		Param2 = 61020,
		__mask = "gA"
	},
	[61030] = {
		Param2 = 61030,
		__mask = "gA"
	},
	[61040] = {
		Param2 = 61040,
		__mask = "gA"
	},
	[61050] = {
		Param2 = 61050,
		__mask = "gA"
	},
	[62010] = {
		Param2 = 62010,
		__mask = "gA"
	},
	[62020] = {
		Param2 = 62020,
		__mask = "gA"
	},
	[62030] = {
		Param2 = 62030,
		__mask = "gA"
	},
	[62040] = {
		Param2 = 62040,
		__mask = "gA"
	},
	[62050] = {
		Param2 = 62050,
		__mask = "gA"
	},
	[62060] = {
		Param2 = 62060,
		__mask = "gA"
	},
	[62070] = {
		Param2 = 62070,
		__mask = "gA"
	},
	[62080] = {
		Param2 = 62080,
		__mask = "gA"
	},
	[62090] = {
		Param2 = 62090,
		__mask = "gA"
	},
	[62100] = {
		Param2 = 62100,
		__mask = "gA"
	},
	[100001] = {
		Param2 = 100001,
		__mask = "gA"
	},
	[100002] = {
		Param2 = 100002,
		__mask = "gA"
	},
	[100003] = {
		Param2 = 100003,
		__mask = "gA"
	},
	[100004] = {
		Param2 = 100004,
		__mask = "gA"
	},
	[100005] = {
		Param2 = 100005,
		__mask = "gA"
	},
	[110001] = {
		Param2 = 110001,
		__mask = "gA"
	},
	[110002] = {
		Param2 = 110002,
		__mask = "gA"
	},
	[110003] = {
		Param2 = 110003,
		__mask = "gA"
	},
	[110004] = {
		Param2 = 110004,
		__mask = "gA"
	},
	[110005] = {
		Param2 = 110005,
		__mask = "gA"
	},
	[110006] = {
		Param2 = 110006,
		__mask = "gA"
	},
	[110007] = {
		Param2 = 110007,
		__mask = "gA"
	},
	[110008] = {
		Param2 = 110008,
		__mask = "gA"
	},
	[200001] = {
		Param2 = 200001,
		__mask = "gA"
	},
	[200002] = {
		Param2 = 200002,
		__mask = "gA"
	},
	[200003] = {
		Param2 = 200003,
		__mask = "gA"
	},
	[200004] = {
		Param2 = 200004,
		__mask = "gA"
	},
	[200005] = {
		Param2 = 200005,
		__mask = "gA"
	},
	[200006] = {
		Param2 = 200006,
		__mask = "gA"
	},
	[200007] = {
		Param2 = 200007,
		__mask = "gA"
	},
	[200008] = {
		Param2 = 200008,
		__mask = "gA"
	},
	[200009] = {
		Param2 = 200009,
		__mask = "gA"
	},
	[200010] = {
		Param2 = 200010,
		__mask = "gA"
	},
	[300001] = {
		Param2 = 300001,
		__mask = "gA"
	},
	[300002] = {
		Param2 = 300002,
		__mask = "gA"
	},
	[300003] = {
		Param2 = 300003,
		__mask = "gA"
	},
	[300004] = {
		Param2 = 300004,
		__mask = "gA"
	},
	[300101] = {
		Param2 = 300101,
		__mask = "gA"
	},
	[300102] = {
		Param2 = 300102,
		__mask = "gA"
	},
	[300103] = {
		Param2 = 300103,
		__mask = "gA"
	},
	[300104] = {
		Param2 = 300104,
		__mask = "gA"
	},
	[400001] = {
		Param2 = 400001,
		__mask = "gA"
	},
	[410000] = {
		Param2 = 410000,
		__mask = "gA"
	},
	[410001] = {
		Param2 = 410001,
		__mask = "gA"
	},
	[410002] = {
		Param2 = 410002,
		__mask = "gA"
	},
	[410003] = {
		Param2 = 410003,
		__mask = "gA"
	},
	[410004] = {
		Param2 = 410004,
		__mask = "gA"
	},
	[410005] = {
		Param2 = 410005,
		__mask = "gA"
	},
	[410006] = {
		Param2 = 410006,
		__mask = "gA"
	},
	[410007] = {
		Param2 = 410007,
		__mask = "gA"
	},
	[410008] = {
		Param2 = 410008,
		__mask = "gA"
	},
	[410009] = {
		Param2 = 410009,
		__mask = "gA"
	},
	[410010] = {
		Param2 = 410010,
		__mask = "gA"
	},
	[410011] = {
		Param2 = 410011,
		__mask = "gA"
	},
	[410012] = {
		Param2 = 410012,
		__mask = "gA"
	},
	[410013] = {
		Param2 = 410013,
		__mask = "gA"
	},
	[410014] = {
		Param2 = 410014,
		__mask = "gA"
	},
	[410015] = {
		Param2 = 410015,
		__mask = "gA"
	},
	[410100] = {
		Param2 = 410100,
		__mask = "gA"
	},
	[410101] = {
		Param2 = 410101,
		__mask = "gA"
	},
	[410102] = {
		Param2 = 410102,
		__mask = "gA"
	},
	[410103] = {
		Param2 = 410103,
		__mask = "gA"
	},
	[410104] = {
		Param2 = 410104,
		__mask = "gA"
	},
	[410105] = {
		Param2 = 410105,
		__mask = "gA"
	},
	[410106] = {
		Param2 = 410106,
		__mask = "gA"
	},
	[410107] = {
		Param2 = 410107,
		__mask = "gA"
	},
	[410108] = {
		Param2 = 410108,
		__mask = "gA"
	},
	[410109] = {
		Param2 = 410109,
		__mask = "gA"
	},
	[410110] = {
		Param2 = 410110,
		__mask = "gA"
	},
	[410111] = {
		Param2 = 410111,
		__mask = "gA"
	},
	[410112] = {
		Param2 = 410112,
		__mask = "gA"
	},
	[410113] = {
		Param2 = 410113,
		__mask = "gA"
	},
	[410114] = {
		Param2 = 410114,
		__mask = "gA"
	},
	[410115] = {
		Param2 = 410115,
		__mask = "gA"
	},
	[410200] = {
		Param2 = 410200,
		__mask = "gA"
	},
	[410201] = {
		Param2 = 410201,
		__mask = "gA"
	},
	[410202] = {
		Param2 = 410202,
		__mask = "gA"
	},
	[410203] = {
		Param2 = 410203,
		__mask = "gA"
	},
	[410204] = {
		Param2 = 410204,
		__mask = "gA"
	},
	[410205] = {
		Param2 = 410205,
		__mask = "gA"
	},
	[410206] = {
		Param2 = 410206,
		__mask = "gA"
	},
	[410207] = {
		Param2 = 410207,
		__mask = "gA"
	},
	[410208] = {
		Param2 = 410208,
		__mask = "gA"
	},
	[410209] = {
		Param2 = 410209,
		__mask = "gA"
	},
	[410210] = {
		Param2 = 410210,
		__mask = "gA"
	},
	[410211] = {
		Param2 = 410211,
		__mask = "gA"
	},
	[410212] = {
		Param2 = 410212,
		__mask = "gA"
	},
	[410213] = {
		Param2 = 410213,
		__mask = "gA"
	},
	[410214] = {
		Param2 = 410214,
		__mask = "gA"
	},
	[410215] = {
		Param2 = 410215,
		__mask = "gA"
	},
	[420000] = {
		Param2 = 420000,
		__mask = "gA"
	},
	[420001] = {
		Param2 = 420001,
		__mask = "gA"
	},
	[420002] = {
		Param2 = 420002,
		__mask = "gA"
	},
	[420003] = {
		Param2 = 420003,
		__mask = "gA"
	},
	[420004] = {
		Param2 = 420004,
		__mask = "gA"
	},
	[420005] = {
		Param2 = 420005,
		__mask = "gA"
	},
	[420006] = {
		Param2 = 420006,
		__mask = "gA"
	},
	[420007] = {
		Param2 = 420007,
		__mask = "gA"
	},
	[420008] = {
		Param2 = 420008,
		__mask = "gA"
	},
	[420009] = {
		Param2 = 420009,
		__mask = "gA"
	},
	[420010] = {
		Param2 = 420010,
		__mask = "gA"
	},
	[420011] = {
		Param2 = 420011,
		__mask = "gA"
	},
	[420012] = {
		Param2 = 420012,
		__mask = "gA"
	},
	[420013] = {
		Param2 = 420013,
		__mask = "gA"
	},
	[420014] = {
		Param2 = 420014,
		__mask = "gA"
	},
	[420015] = {
		Param2 = 420015,
		__mask = "gA"
	},
	[420100] = {
		Param2 = 420100,
		__mask = "gA"
	},
	[420101] = {
		Param2 = 420101,
		__mask = "gA"
	},
	[420102] = {
		Param2 = 420102,
		__mask = "gA"
	},
	[420103] = {
		Param2 = 420103,
		__mask = "gA"
	},
	[420104] = {
		Param2 = 420104,
		__mask = "gA"
	},
	[420105] = {
		Param2 = 420105,
		__mask = "gA"
	},
	[420106] = {
		Param2 = 420106,
		__mask = "gA"
	},
	[420107] = {
		Param2 = 420107,
		__mask = "gA"
	},
	[420108] = {
		Param2 = 420108,
		__mask = "gA"
	},
	[420109] = {
		Param2 = 420109,
		__mask = "gA"
	},
	[420110] = {
		Param2 = 420110,
		__mask = "gA"
	},
	[420111] = {
		Param2 = 420111,
		__mask = "gA"
	},
	[420112] = {
		Param2 = 420112,
		__mask = "gA"
	},
	[420113] = {
		Param2 = 420113,
		__mask = "gA"
	},
	[420114] = {
		Param2 = 420114,
		__mask = "gA"
	},
	[420115] = {
		Param2 = 420115,
		__mask = "gA"
	},
	[420200] = {
		Param2 = 420200,
		__mask = "gA"
	},
	[420201] = {
		Param2 = 420201,
		__mask = "gA"
	},
	[420202] = {
		Param2 = 420202,
		__mask = "gA"
	},
	[420203] = {
		Param2 = 420203,
		__mask = "gA"
	},
	[420204] = {
		Param2 = 420204,
		__mask = "gA"
	},
	[420205] = {
		Param2 = 420205,
		__mask = "gA"
	},
	[420206] = {
		Param2 = 420206,
		__mask = "gA"
	},
	[420207] = {
		Param2 = 420207,
		__mask = "gA"
	},
	[420208] = {
		Param2 = 420208,
		__mask = "gA"
	},
	[420209] = {
		Param2 = 420209,
		__mask = "gA"
	},
	[420210] = {
		Param2 = 420210,
		__mask = "gA"
	},
	[420211] = {
		Param2 = 420211,
		__mask = "gA"
	},
	[420212] = {
		Param2 = 420212,
		__mask = "gA"
	},
	[420213] = {
		Param2 = 420213,
		__mask = "gA"
	},
	[420214] = {
		Param2 = 420214,
		__mask = "gA"
	},
	[420215] = {
		Param2 = 420215,
		__mask = "gA"
	},
	[430000] = {
		Param2 = 430000,
		__mask = "gA"
	},
	[430001] = {
		Param2 = 430001,
		__mask = "gA"
	},
	[430002] = {
		Param2 = 430002,
		__mask = "gA"
	},
	[430003] = {
		Param2 = 430003,
		__mask = "gA"
	},
	[430004] = {
		Param2 = 430004,
		__mask = "gA"
	},
	[430005] = {
		Param2 = 430005,
		__mask = "gA"
	},
	[430006] = {
		Param2 = 430006,
		__mask = "gA"
	},
	[430007] = {
		Param2 = 430007,
		__mask = "gA"
	},
	[430008] = {
		Param2 = 430008,
		__mask = "gA"
	},
	[430009] = {
		Param2 = 430009,
		__mask = "gA"
	},
	[430010] = {
		Param2 = 430010,
		__mask = "gA"
	},
	[430011] = {
		Param2 = 430011,
		__mask = "gA"
	},
	[430012] = {
		Param2 = 430012,
		__mask = "gA"
	},
	[430013] = {
		Param2 = 430013,
		__mask = "gA"
	},
	[430014] = {
		Param2 = 430014,
		__mask = "gA"
	},
	[430015] = {
		Param2 = 430015,
		__mask = "gA"
	},
	[430100] = {
		Param2 = 430100,
		__mask = "gA"
	},
	[430101] = {
		Param2 = 430101,
		__mask = "gA"
	},
	[430102] = {
		Param2 = 430102,
		__mask = "gA"
	},
	[430103] = {
		Param2 = 430103,
		__mask = "gA"
	},
	[430104] = {
		Param2 = 430104,
		__mask = "gA"
	},
	[430105] = {
		Param2 = 430105,
		__mask = "gA"
	},
	[430106] = {
		Param2 = 430106,
		__mask = "gA"
	},
	[430107] = {
		Param2 = 430107,
		__mask = "gA"
	},
	[430108] = {
		Param2 = 430108,
		__mask = "gA"
	},
	[430109] = {
		Param2 = 430109,
		__mask = "gA"
	},
	[430110] = {
		Param2 = 430110,
		__mask = "gA"
	},
	[430111] = {
		Param2 = 430111,
		__mask = "gA"
	},
	[430112] = {
		Param2 = 430112,
		__mask = "gA"
	},
	[430113] = {
		Param2 = 430113,
		__mask = "gA"
	},
	[430114] = {
		Param2 = 430114,
		__mask = "gA"
	},
	[430115] = {
		Param2 = 430115,
		__mask = "gA"
	},
	[430200] = {
		Param2 = 430200,
		__mask = "gA"
	},
	[430201] = {
		Param2 = 430201,
		__mask = "gA"
	},
	[430202] = {
		Param2 = 430202,
		__mask = "gA"
	},
	[430203] = {
		Param2 = 430203,
		__mask = "gA"
	},
	[430204] = {
		Param2 = 430204,
		__mask = "gA"
	},
	[430205] = {
		Param2 = 430205,
		__mask = "gA"
	},
	[430206] = {
		Param2 = 430206,
		__mask = "gA"
	},
	[430207] = {
		Param2 = 430207,
		__mask = "gA"
	},
	[430208] = {
		Param2 = 430208,
		__mask = "gA"
	},
	[430209] = {
		Param2 = 430209,
		__mask = "gA"
	},
	[430210] = {
		Param2 = 430210,
		__mask = "gA"
	},
	[430211] = {
		Param2 = 430211,
		__mask = "gA"
	},
	[430212] = {
		Param2 = 430212,
		__mask = "gA"
	},
	[430213] = {
		Param2 = 430213,
		__mask = "gA"
	},
	[430214] = {
		Param2 = 430214,
		__mask = "gA"
	},
	[430215] = {
		Param2 = 430215,
		__mask = "gA"
	},
	[500001] = {
		Param1 = 2000,
		Param2 = 500001,
		__mask = "wA"
	},
	[500002] = {
		Param2 = 500002,
		__mask = "gA"
	},
	[500101] = {
		Param1 = 2000,
		Param2 = 500101,
		__mask = "wA"
	},
	[500102] = {
		Param2 = 500102,
		__mask = "gA"
	},
	[500201] = {
		Param1 = 4000,
		Param2 = 500201,
		__mask = "wA"
	},
	[500202] = {
		Param2 = 500202,
		__mask = "gA"
	},
	[500301] = {
		Param1 = 4000,
		Param2 = 500301,
		__mask = "wA"
	},
	[500302] = {
		Param2 = 500302,
		__mask = "gA"
	},
	[500401] = {
		Param1 = 5000,
		Param2 = 500401,
		__mask = "wA"
	},
	[500402] = {
		Param2 = 500402,
		__mask = "gA"
	},
	[500501] = {
		Param1 = 5000,
		Param2 = 500501,
		__mask = "wA"
	},
	[500502] = {
		Param2 = 500502,
		__mask = "gA"
	},
	[500601] = {
		Param1 = 7500,
		Param2 = 500601,
		__mask = "wA"
	},
	[500602] = {
		Param2 = 500602,
		__mask = "gA"
	},
	[500701] = {
		Param1 = 7500,
		Param2 = 500701,
		__mask = "wA"
	},
	[500702] = {
		Param2 = 500702,
		__mask = "gA"
	},
	[500801] = {
		Param1 = 7500,
		Param2 = 500801,
		__mask = "wA"
	},
	[500802] = {
		Param2 = 500802,
		__mask = "gA"
	},
	[500901] = {
		Param2 = 500901,
		__mask = "gA"
	},
	[500902] = {
		Param2 = 500902,
		__mask = "gA"
	},
	[501001] = {
		Param2 = 501001,
		__mask = "gA"
	},
	[501002] = {
		Param2 = 501002,
		__mask = "gA"
	},
	[501101] = {
		Param2 = 501101,
		__mask = "gA"
	},
	[501102] = {
		Param2 = 501102,
		__mask = "gA"
	},
	[501201] = __rt_2,
	[501202] = {
		Param2 = 501202,
		__mask = "gA"
	},
	[501301] = {
		Param1 = 2000,
		Param2 = 501301,
		__mask = "wA"
	},
	[501302] = {
		Param2 = 501302,
		__mask = "gA"
	},
	[501401] = {
		Param1 = 2000,
		Param2 = 501401,
		__mask = "wA"
	},
	[501402] = {
		Param2 = 501402,
		__mask = "gA"
	},
	[501501] = {
		Param1 = 4000,
		Param2 = 501501,
		__mask = "wA"
	},
	[501502] = {
		Param2 = 501502,
		__mask = "gA"
	},
	[501601] = {
		Param1 = 4000,
		Param2 = 501601,
		__mask = "wA"
	},
	[501602] = {
		Param2 = 501602,
		__mask = "gA"
	},
	[501701] = {
		Param1 = 5000,
		Param2 = 501701,
		__mask = "wA"
	},
	[501702] = {
		Param2 = 501702,
		__mask = "gA"
	},
	[501801] = {
		Param1 = 5000,
		Param2 = 501801,
		__mask = "wA"
	},
	[501802] = {
		Param2 = 501802,
		__mask = "gA"
	},
	[501901] = {
		Param2 = 501901,
		__mask = "gA"
	},
	[501902] = {
		Param2 = 501902,
		__mask = "gA"
	},
	[502001] = {
		Param2 = 502001,
		__mask = "gA"
	},
	[502002] = {
		Param2 = 502002,
		__mask = "gA"
	},
	[502101] = {
		Param2 = 502101,
		__mask = "gA"
	},
	[502102] = {
		Param2 = 502102,
		__mask = "gA"
	},
	[502201] = {
		Param2 = 502201,
		__mask = "gA"
	},
	[502202] = {
		Param2 = 502202,
		__mask = "gA"
	},
	[502301] = {
		Param2 = 502301,
		__mask = "gA"
	},
	[502302] = {
		Param2 = 502302,
		__mask = "gA"
	},
	[502401] = {
		Param2 = 502401,
		__mask = "gA"
	},
	[502402] = {
		Param2 = 502402,
		__mask = "gA"
	},
	[502501] = {
		Param2 = 502501,
		__mask = "gA"
	},
	[502502] = {
		Param2 = 502502,
		__mask = "gA"
	},
	[502601] = {
		Param1 = 2500,
		Param2 = 502601,
		__mask = "wA"
	},
	[502602] = {
		Param2 = 502602,
		__mask = "gA"
	},
	[502701] = {
		Param1 = 2500,
		Param2 = 502701,
		__mask = "wA"
	},
	[502702] = {
		Param2 = 502702,
		__mask = "gA"
	},
	[502801] = {
		Param1 = 2500,
		Param2 = 502801,
		__mask = "wA"
	},
	[502802] = {
		Param2 = 502802,
		__mask = "gA"
	},
	[502901] = {
		Param1 = 2500,
		Param2 = 502901,
		__mask = "wA"
	},
	[502902] = {
		Param2 = 502902,
		__mask = "gA"
	},
	[503001] = {
		Param1 = 5000,
		Param2 = 503001,
		__mask = "wA"
	},
	[503002] = {
		Param2 = 503002,
		__mask = "gA"
	},
	[503101] = {
		Param1 = 5000,
		Param2 = 503101,
		__mask = "wA"
	},
	[503102] = {
		Param2 = 503102,
		__mask = "gA"
	},
	[503201] = {
		Param1 = 5000,
		Param2 = 503201,
		__mask = "wA"
	},
	[503202] = {
		Param2 = 503202,
		__mask = "gA"
	},
	[503301] = {
		Param1 = 7500,
		Param2 = 503301,
		__mask = "wA"
	},
	[503302] = {
		Param2 = 503302,
		__mask = "gA"
	},
	[503401] = {
		Param1 = 7500,
		Param2 = 503401,
		__mask = "wA"
	},
	[503402] = {
		Param2 = 503402,
		__mask = "gA"
	},
	[503501] = {
		Param1 = 7500,
		Param2 = 503501,
		__mask = "wA"
	},
	[503502] = {
		Param2 = 503502,
		__mask = "gA"
	},
	[503601] = {
		Param2 = 503601,
		__mask = "gA"
	},
	[503602] = {
		Param2 = 503602,
		__mask = "gA"
	},
	[503701] = {
		Param2 = 503701,
		__mask = "gA"
	},
	[503702] = {
		Param2 = 503702,
		__mask = "gA"
	},
	[503801] = {
		Param2 = 503801,
		__mask = "gA"
	},
	[503802] = {
		Param2 = 503802,
		__mask = "gA"
	},
	[503901] = {
		Param2 = 503901,
		__mask = "gA"
	},
	[503902] = {
		Param2 = 503902,
		__mask = "gA"
	},
	[504001] = {
		Param1 = 4500,
		Param2 = 504001,
		__mask = "wA"
	}
}
local __default_values = {
	EffectDelay = 0,
	EffectTarget = 0,
	EffectTargetType = 7,
	EffectType = 1,
	Param1 = 10000,
	Param2 = 1,
	TargetNum = 0,
	TargetRange = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( skilleffect ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( skilleffect, { __default = __default_values, __hash = 0x5321a234, __masked = true } )
end

return skilleffect
