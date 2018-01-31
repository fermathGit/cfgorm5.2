local __rt_1 = {
	200,
	50
}
local growup = 
{
	{
		__mask = "6ux4B",
		iconname1 = "@278047",
		iconname3 = "@213410",
		iconname4 = "@370322",
		iconshow1 = 58,
		iconshow3 = 58,
		iconshow4 = 58,
		ifdaily1 = 31,
		ifdaily3 = 24,
		ifdaily4 = 25,
		ifpanle4 = 0,
		parm = 2,
		showname = "@402895",
		string1 = "@500910",
		string2 = "@483635",
		string3 = "@10006"
	},
	{
		__mask = "rqg6B",
		baseValue = 20000,
		iconname1 = "@522302",
		iconname3 = "@384241",
		iconshow1 = 57,
		iconshow3 = 72,
		ifdaily1 = 4,
		ifdaily3 = 8,
		parm = 6,
		serverEndTime = 3,
		showname = "@464022",
		string1 = "@385114",
		string2 = "@192370",
		string3 = "@257175"
	},
	{
		__mask = "rqgyB",
		baseValue = 15000,
		iconname1 = "@208201",
		iconname3 = "@96509",
		iconshow1 = 12,
		iconshow3 = 66,
		ifdaily1 = 12,
		ifdaily3 = 13,
		parm = 7,
		serverEndTime = 4,
		string1 = "@460056",
		string2 = "@267312",
		string3 = "@332117"
	},
	{
		__mask = "FRo6B",
		baseValue = 80000,
		iconname2 = "@356434",
		iconshow2 = 56,
		ifdaily2 = 6,
		ifpanle3 = 1403,
		parm = 10,
		serverEndTime = 5,
		showname = "@174030",
		string1 = "@95122",
		string2 = "@426666",
		string3 = "@491471"
	},
	{
		__mask = "NzgqB",
		baseValue = 6000,
		iconname2 = "@18837",
		iconname3 = "@478765",
		iconshow2 = 150,
		iconshow3 = 61,
		ifdaily2 = 19,
		ifdaily3 = 10,
		parm = 11,
		serverEndTime = 6,
		showname = "@371939",
		string2 = "@449949",
		string3 = "@412148"
	},
	{
		__mask = "3dZfC",
		baseValue = 2000000,
		iconname1 = "@516588",
		iconname2 = "@489684",
		iconname4 = "@181113",
		iconshow1 = 75,
		iconshow2 = 37,
		iconshow4 = 61,
		ifdaily1 = 29,
		ifdaily2 = 2,
		ifdaily4 = 10,
		ifpanle3 = 1403,
		ifpanle4 = 0,
		rewardTop = 16,
		serverEndTime = 7,
		show_fake_ranke = {
			0,
			0
		},
		showname = "@321515",
		string1 = "@327595",
		type = 1
	},
	{
		__mask = "3d56A",
		baseValue = 400000,
		iconname1 = "@516588",
		iconname2 = "@489684",
		iconname4 = "@181113",
		iconshow1 = 75,
		iconshow2 = 37,
		iconshow4 = 61,
		ifdaily1 = 29,
		ifdaily2 = 2,
		ifdaily4 = 10,
		ifpanle3 = 1403,
		ifpanle4 = 0,
		parm = 1,
		serverEndTime = 8,
		showname = "@302818",
		string1 = "@223910",
		string2 = "@354823"
	}
}
local __default_values = {
	baseValue = 50,
	iconname1 = "@128763",
	iconname2 = "@60604",
	iconname3 = "@309723",
	iconname4 = "@410232",
	iconshow1 = 7,
	iconshow2 = 32,
	iconshow3 = 17,
	iconshow4 = 88,
	ifdaily1 = 1,
	ifdaily2 = 30,
	ifdaily3 = 0,
	ifdaily4 = 0,
	ifpanle1 = 0,
	ifpanle2 = 0,
	ifpanle3 = 0,
	ifpanle4 = 1901,
	parm = 0,
	rewardTop = 1000,
	serverEndTime = 2,
	show_fake_ranke = __rt_1,
	showname = "@14676",
	string1 = "@118405",
	string2 = "@134851",
	string3 = "@517653",
	type = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( growup ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( growup, { __default = __default_values, __hash = 0x48a8380b, __masked = true } )
end

return growup
