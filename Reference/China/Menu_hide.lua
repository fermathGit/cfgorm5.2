local Menu_hide = 
{
	{
		Active_open = 0,
		CallOthers = 0,
		Growup = 1,
		__mask = "JRCCA",
		desc = "@431751",
		infobutton = 0,
		nextmenu = 0
	},
	{
		Camera = 1,
		Friend = 1,
		Fullbagbutton = 1,
		Growup = 1,
		Main_menu = 2,
		Mallbutton = 1,
		Messagebutton = 1,
		__mask = "094NA",
		bag = 1,
		chat_board = 1,
		desc = "@283729",
		head_menu = 1,
		minimap = 1,
		redbags = 1,
		task = 2
	},
	{
		Camera = 1,
		Fixbutton = 1,
		Friend = 1,
		Fullbagbutton = 1,
		Growup = 1,
		HideHead = 1,
		Main_menu = 2,
		Mallbutton = 1,
		Messagebutton = 1,
		__mask = "0/5NA",
		bag = 1,
		chat_board = 1,
		desc = "@90658",
		head_menu = 1,
		minimap = 2,
		redbags = 1,
		task = 1
	},
	{
		Camera = 1,
		Fixbutton = 1,
		Friend = 1,
		Fullbagbutton = 1,
		Growup = 1,
		HideHead = 1,
		Main_menu = 2,
		Mallbutton = 1,
		Messagebutton = 1,
		__mask = "0/58A",
		bag = 1,
		chat_board = 1,
		desc = "@292165",
		head_menu = 1,
		redbags = 1,
		task = 2,
		tips = 1,
		worldlevel = 1
	},
	{
		Active_open = 0,
		__mask = "BBCKA",
		desc = "@423555",
		infobutton = 0,
		nextmenu = 0,
		task = 1
	},
	{
		__mask = "ABAAA",
		desc = "@143298"
	},
	{
		Camera = 1,
		Friend = 1,
		Growup = 1,
		__mask = "QVAAA",
		desc = "@478765"
	},
	{
		CallOthers = 0,
		Growup = 1,
		__mask = "IRAIA",
		desc = "@62680",
		task = 1
	},
	{
		Camera = 1,
		Fixbutton = 1,
		Friend = 1,
		Fullbagbutton = 1,
		Growup = 1,
		HideHead = 1,
		Main_menu = 2,
		Mallbutton = 1,
		Messagebutton = 1,
		__mask = "0/58A",
		bag = 1,
		chat_board = 1,
		desc = "@35039",
		head_menu = 1,
		redbags = 1,
		task = 1,
		tips = 1,
		worldlevel = 1
	},
	{
		Camera = 1,
		__mask = "QBAIA",
		desc = "@488242",
		task = 1
	},
	[12] = {
		CallOthers = 0,
		__mask = "IBAJA",
		desc = "@17013",
		minimap = 1,
		task = 1
	},
	[13] = {
		CallOthers = 0,
		__mask = "IBAIA",
		desc = "@478353",
		task = 1
	},
	[14] = {
		Camera = 1,
		Main_menu = 1,
		__mask = "QBIAA",
		desc = "@222993"
	},
	[15] = {
		Camera = 1,
		__mask = "QBAAA",
		desc = "@203897"
	},
	[16] = {
		Active_open = 0,
		CallOthers = 0,
		Growup = 1,
		__mask = "JRAAA",
		desc = "@18837"
	},
	[17] = {
		Active_open = 0,
		Growup = 1,
		__mask = "BRCCA",
		desc = "@70215",
		infobutton = 0,
		nextmenu = 0
	},
	[98] = {
		Active_open = 0,
		Left_menu = 0,
		__mask = "BAGCB",
		infobutton = 0,
		nextmenu = 0,
		zoom_menu = 0
	},
	[99] = {
		Active_open = 0,
		CallOthers = 0,
		Left_menu = 0,
		__mask = "JAGCB",
		infobutton = 0,
		nextmenu = 0,
		zoom_menu = 0
	}
}
local __default_values = {
	Active_open = 1,
	Auto = 0,
	CallOthers = 1,
	Camera = 0,
	Fixbutton = 0,
	Friend = 0,
	Fullbagbutton = 0,
	Growup = 0,
	HideHead = 0,
	Left_menu = 1,
	Main_menu = 0,
	Mallbutton = 0,
	Messagebutton = 0,
	bag = 0,
	chat_board = 0,
	desc = "@496674",
	head_menu = 0,
	infobutton = 1,
	minimap = 0,
	nextmenu = 1,
	redbags = 0,
	task = 0,
	tips = 0,
	worldlevel = 0,
	zoom_menu = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( Menu_hide ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( Menu_hide, { __default = __default_values, __hash = 0x73686311, __masked = true } )
end

return Menu_hide
