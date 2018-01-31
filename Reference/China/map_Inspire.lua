local map_Inspire = 
{
	[54001] = {
		__mask = "yB",
		costMoney = 1,
		harmAddPer = 2,
		inspireSucess = "@448613",
		inspireTips = "@85596"
	},
	[54002] = {
		__mask = "zB",
		conunt = 2,
		costMoney = 2,
		harmAddPer = 4,
		inspireSucess = "@216294",
		inspireTips = "@85596"
	},
	[54003] = {
		__mask = "zB",
		conunt = 3,
		costMoney = 5,
		harmAddPer = 6,
		inspireSucess = "@508263",
		inspireTips = "@85596"
	},
	[54004] = {
		__mask = "zB",
		conunt = 4,
		costMoney = 10,
		harmAddPer = 8,
		inspireSucess = "@275944",
		inspireTips = "@85596"
	},
	[54005] = {
		__mask = "zB",
		conunt = 5,
		costMoney = 15,
		harmAddPer = 10,
		inspireSucess = "@482004",
		inspireTips = "@85596"
	},
	[54006] = {
		__mask = "zB",
		conunt = 6,
		costMoney = 20,
		harmAddPer = 12,
		inspireSucess = "@472147",
		inspireTips = "@85596"
	},
	[54007] = {
		__mask = "zB",
		conunt = 7,
		costMoney = 20,
		harmAddPer = 14,
		inspireSucess = "@462290",
		inspireTips = "@85596"
	},
	[54008] = {
		__mask = "zB",
		conunt = 8,
		costMoney = 20,
		harmAddPer = 16,
		inspireSucess = "@452433",
		inspireTips = "@85596"
	},
	[54009] = {
		__mask = "zB",
		conunt = 9,
		costMoney = 20,
		harmAddPer = 18,
		inspireSucess = "@442576",
		inspireTips = "@85596"
	},
	[54010] = {
		__mask = "zB",
		conunt = 10,
		costMoney = 20,
		harmAddPer = 20,
		inspireSucess = "@497869",
		inspireTips = "@85596"
	},
	[700001] = {
		__mask = "gC",
		inspireSucess = "@242335",
		mapId = 700
	},
	[700002] = {
		__mask = "hC",
		conunt = 2,
		inspireSucess = "@442322",
		mapId = 700
	},
	[700003] = {
		__mask = "hC",
		conunt = 3,
		inspireSucess = "@118021",
		mapId = 700
	},
	[700004] = {
		__mask = "hC",
		conunt = 4,
		inspireSucess = "@318008",
		mapId = 700
	},
	[700005] = {
		__mask = "hC",
		conunt = 5,
		inspireSucess = "@244828",
		mapId = 700
	},
	[700006] = {
		__mask = "hC",
		conunt = 6,
		inspireSucess = "@342313",
		mapId = 700
	},
	[700007] = {
		__mask = "hC",
		conunt = 7,
		inspireSucess = "@439798",
		mapId = 700
	},
	[700008] = {
		__mask = "hC",
		conunt = 8,
		inspireSucess = "@12995",
		mapId = 700
	},
	[700009] = {
		__mask = "BC",
		conunt = 9,
		mapId = 700
	},
	[700010] = {
		__mask = "hC",
		conunt = 10,
		inspireSucess = "@422007",
		mapId = 700
	},
	[900001] = {
		__mask = "gD",
		inspireSucess = "@225161",
		inspireTips = "@458086",
		mapId = 900
	},
	[900002] = {
		__mask = "hD",
		conunt = 2,
		inspireSucess = "@221613",
		inspireTips = "@458086",
		mapId = 900
	},
	[900003] = {
		__mask = "hD",
		conunt = 3,
		inspireSucess = "@218065",
		inspireTips = "@458086",
		mapId = 900
	},
	[900004] = {
		__mask = "hD",
		conunt = 4,
		inspireSucess = "@214517",
		inspireTips = "@458086",
		mapId = 900
	},
	[900005] = {
		__mask = "hD",
		conunt = 5,
		inspireSucess = "@210969",
		inspireTips = "@458086",
		mapId = 900
	},
	[900006] = {
		__mask = "hD",
		conunt = 6,
		inspireSucess = "@207421",
		inspireTips = "@458086",
		mapId = 900
	},
	[900007] = {
		__mask = "hD",
		conunt = 7,
		inspireSucess = "@203873",
		inspireTips = "@458086",
		mapId = 900
	},
	[900008] = {
		__mask = "hD",
		conunt = 8,
		inspireSucess = "@200325",
		inspireTips = "@458086",
		mapId = 900
	},
	[900009] = {
		__mask = "hD",
		conunt = 9,
		inspireSucess = "@196777",
		inspireTips = "@458086",
		mapId = 900
	},
	[900010] = {
		__mask = "hD",
		conunt = 10,
		inspireSucess = "@298517",
		inspireTips = "@458086",
		mapId = 900
	}
}
local __default_values = {
	conunt = 1,
	costMoney = 0,
	costMoneyType = 3,
	expAddPer = 0,
	harmAddPer = 0,
	inspireSucess = "@110480",
	inspireTips = "@252224",
	mapId = 54,
	moneyAddPer = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( map_Inspire ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( map_Inspire, { __default = __default_values, __hash = 0x76734344, __masked = true } )
end

return map_Inspire
