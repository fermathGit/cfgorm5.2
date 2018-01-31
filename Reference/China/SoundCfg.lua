local SoundCfg = 
{
	{
		sound = "ui_close"
	},
	{
		sound = "ui_message"
	},
	{
		sound = "ui_open"
	},
	{
		sound = "ui_openbag"
	},
	{
		sound = "ui_add"
	},
	{
		sound = "ui_dimix"
	},
	{
		sound = "ui_buy"
	},
	{
		sound = "ui_sold"
	},
	{
		sound = "ui_diput"
	},
	{
		sound = "ui_itemselect"
	},
	{
		sound = "ui_normal_click1"
	},
	{
		sound = "ui_normal_click2"
	},
	{
		sound = "ui_normal_click3"
	},
	{
		sound = "ui_normal_click4"
	},
	{
		sound = "ui_help"
	},
	{
		sound = "ui_no"
	},
	{
		sound = "ui_yes"
	},
	{
		sound = "ui_changeclass"
	},
	{
		sound = "ui_error"
	},
	{
		sound = "ui_mission_finish"
	},
	{
		sound = "ui_newmountget"
	},
	{
		sound = "ui_newmountstar"
	},
	{
		sound = "ui_phase_finish"
	},
	{
		sound = "card_click"
	},
	{
		sound = "ui_FXDrink"
	},
	{
		sound = "ui_FXGoldTree"
	},
	{
		sound = "ui_FXHammer"
	},
	{
		res = "@98312",
		sound = "ui_FXMenuClose"
	},
	{
		sound = "ui_FXMenuOpen"
	},
	{
		sound = "ui_FXMount"
	},
	{
		res = "button_green,button_red",
		sound = "ui_FXNormalClick"
	},
	{
		sound = "ui_FXNumRoll"
	},
	{
		sound = "ui_FXPageDonw"
	},
	{
		sound = "ui_FXTimeSound"
	},
	{
		sound = "pvp_success"
	},
	{
		sound = "pvp_lose"
	},
	{
		sound = "other_qianghua"
	},
	{
		sound = "other_levelup"
	},
	{
		sound = "other_creat"
	},
	{
		sound = "other_catchitem"
	},
	{
		sound = "other_bianshenback"
	},
	{
		sound = "other_bianshen"
	},
	{
		sound = "mission_ok"
	},
	{
		sound = "card_page"
	},
	{
		sound = "card_cancel"
	},
	{
	},
	{
		sound = "Ui_result_cross"
	},
	{
		sound = "Ui_reward"
	},
	{
		sound = "ui_collection_success"
	},
	{
		sound = "ui_equipup"
	},
	{
		sound = "ui_success"
	}
}
local __default_values = {
	res = "",
	sound = "Ui_drill_lotus"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( SoundCfg ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( SoundCfg, { __default = __default_values, __hash = 0x2c49a586, __masked = false } )
end

return SoundCfg
