local Root = "L:/Client"

if io and io.popen and not LuaTinker then
	local cd = io.popen( "cd" ):read( '*l' )
	print( "cd: "..cd )
	local s, e = string.find( cd, "Client" )
	if e then
		Root = string.sub( cd, 1, e )
	end
end

if arg and arg[1] then
	Root = arg[1]
elseif arg and arg[0] then
	local s, e = string.find( arg[0], "Client" )
	if e then
		Root = string.sub( arg[0], 1, e )
	end
end


local area = "China"
if arg and arg[2]  then
	area = arg[2]
	print( "current area: "..area )
end

Root = string.gsub( Root, '\\', '/' )
local DatabaseRoot = Root.."/Assets/StreamingAssets/Database"
if area then
	DatabaseRoot = DatabaseRoot..'/'..area
end
local LuaRoot = Root.."/Assets/StreamingAssets/LuaRoot"
package.path = package.path..';'..DatabaseRoot..'/?.lua'..';'.. LuaRoot..'/?.lua'

local DatabaseTool = require "DatabaseTool"
local LocalizeDatabase = require "LocalizeDatabase"
DatabaseTool.SetDatabaseRoot( DatabaseRoot )
LocalizeDatabase.SetArea( area )

print( "DatabaseRoot: "..DatabaseRoot )

local function GetByteArrayString( s )
	local buf = {}
	string.gsub(
		s, ".",
		function ( c )
			buf[ #buf + 1 ] = string.format( "0x%02x", string.byte( c ) )
		end
	)
	buf[ #buf + 1 ] = "0x00"
	return table.concat( buf, ", " )
end

local function GenCSharpClasses()
	local DatasetCSNames = DatabaseTool.DatasetCSNames
	local DatasetFieldNameBank = DatabaseTool.DatasetFieldNameBank
	outFile = DatabaseTool.CreateFileWriter( string.format( "%s/DBCache.cs", DatabaseTool.DatabaseCodeRoot ), "w" )
	outFile.write( "using System;\n" )
	outFile.write( "namespace Database {\n" )
	outFile.write( "\tpublic partial class DBCache {\n" )

	outFile.write( "\t\t#region Keys\n" )
	local kv = {}
	for k, v in pairs( DatasetFieldNameBank ) do
		kv[#kv + 1] = k
	end
	table.sort( kv )
	outFile.write( "\t\t#if USE_NATIVE_LUA\n" )
	for _, k in ipairs( kv ) do
		local name = DatasetFieldNameBank[ k ]
		outFile.write( string.format( "\t\tpublic static readonly byte[] FID_%s = /*%s*/{ %s };\n", k, name, GetByteArrayString( name ) ) )
	end
	outFile.write( "\t\t#else\n" )
	for _, k in ipairs( kv ) do
		local name = DatasetFieldNameBank[ k ]
		outFile.write( string.format( "\t\tpublic const string FID_%s = \"%s\";\n", k, name ) )
	end
	outFile.write( "\t\t#endif\n" )
	outFile.write( "\t\t#endregion\n" )

	outFile.write( "\t\t#region Cache Action List\n" )
	outFile.write( string.format( "\t\tpublic static Action[] cacheActions = new Action[ %d ] { \n", #DatasetCSNames ) )
	for _, value in ipairs( DatasetCSNames ) do
		outFile.write( string.format("\t\t\t() => { %s.CacheAll(); %s.Unload(); },\n" , value, value ) )
	end
	outFile.write( "\t\t};\n" )

	outFile.write( string.format( "\t\tpublic static String[] cacheNames = new String[ %d ] { \n", #DatasetCSNames ) )
	for _, value in ipairs( DatasetCSNames ) do
		outFile.write( string.format("\t\t\t\"%s\",\n", value ) )
	end
	outFile.write( "\t\t};\n" )

	outFile.write( "\t\t#endregion\n" )
	outFile.write( "\t}\n" )
	outFile.write( "}\n" )
end

-- dataset
-- dataset rename
-- containId
-- true or false to enable cache
-- a name for inverse cache
-- save to file if true
-- use gc cache, not support two caches

local useGcCache = false
local tofile = true
if tofile then
	print( "DatabaseTool.DatabaseRoot: "..DatabaseTool.DatabaseRoot )
	DatabaseTool.Load( "task_item" )
	DatabaseTool.GenCSharpDefine( Database.task_item, "TaskItem", true, true, nil, tofile )

	DatabaseTool.Load( "subtitle" )
	DatabaseTool.GenCSharpDefine( Database.subtitle, "Subtitle", true, true, nil, tofile )

	DatabaseTool.Load( "offstringlogin" )
	DatabaseTool.GenCSharpDefine( Database.offstringlogin, "Offstringlogin", true, true, nil, tofile )

	DatabaseTool.Load( "rndname" )
	DatabaseTool.GenCSharpDefine( Database.rndname, "RndName", false, false, nil, tofile )

	DatabaseTool.Load( "openbag" )
	DatabaseTool.GenCSharpDefine( Database.openbag, "OpenBag", true, true, nil, tofile )

	DatabaseTool.Load( "show1" )
	DatabaseTool.GenCSharpDefine( Database.show1, "ShowOne", true, true, nil, tofile )

	DatabaseTool.Load( "show2" )
	DatabaseTool.GenCSharpDefine( Database.show2, "ShowTwo", true, true, nil, tofile )

	DatabaseTool.Load( "show3" )
	DatabaseTool.GenCSharpDefine( Database.show3, "ShowThree", true, true, nil, tofile )

	DatabaseTool.Load( "show4" )
	DatabaseTool.GenCSharpDefine( Database.show4, "ShowFour", true, true, nil, tofile )

	DatabaseTool.Load( "bloom" )
	DatabaseTool.GenCSharpDefine( Database.bloom, "BloomSetting", true, true, nil, tofile )

	DatabaseTool.Load( "offstringingame" )
	DatabaseTool.GenCSharpDefine( Database.offstringingame, "Offstringingame", false, true, nil, tofile )

	DatabaseTool.Load( "player_desc" )
	DatabaseTool.GenCSharpDefine( Database.player_desc, "PlayerDesc", true, true, nil, tofile, useGcCache )

	DatabaseTool.Load( "bloom" )
	DatabaseTool.GenCSharpDefine( Database.bloom, "BloomSetting", true, true, nil, true )

	DatabaseTool.Load( "monster" )
	DatabaseTool.GenCSharpDefine( Database.monster, "Monster", true, true, nil, tofile )

	DatabaseTool.Load( "npc" )
	DatabaseTool.GenCSharpDefine( Database.npc, "Npc", true, true, nil, tofile )

	DatabaseTool.Load( "mapsetting" )
	DatabaseTool.GenCSharpDefine( Database.mapsetting, "Mapsetting", true, true, nil, tofile )

	DatabaseTool.Load( "item" )
	DatabaseTool.GenCSharpDefine( Database.item, "Item", true, true, nil, tofile )

	DatabaseTool.Load( "mount" )
	DatabaseTool.GenCSharpDefine( Database.mount, "Mount", true, true, nil, tofile, useGcCache )

	DatabaseTool.Load( "skill" )
	DatabaseTool.GenCSharpDefine( Database.skill, "Skill", true, true, nil, tofile )

	DatabaseTool.Load( "camera_shake" )
	DatabaseTool.GenCSharpDefine( Database.camera_shake, "CameraShake", true, true, nil, tofile )

	DatabaseTool.Load( "skilleffect" )
	DatabaseTool.GenCSharpDefine( Database.skilleffect, "SkillEffect", true, true, nil, tofile )

	DatabaseTool.Load( "skillsimbo" )
	DatabaseTool.GenCSharpDefine( Database.skillsimbo, "SkillSimbo", true, true, nil, tofile )

	DatabaseTool.Load( "mainMenu" )
	DatabaseTool.GenCSharpDefine( Database.mainMenu, "MainMenu", true, true, nil, tofile )

	DatabaseTool.Load( "skillbuff" )
	DatabaseTool.GenCSharpDefine( Database.skillbuff, "Buff", true, true, nil, tofile )

	DatabaseTool.Load( "task" )
	DatabaseTool.GenCSharpDefine( Database.task, "Task", true, true, nil, tofile, useGcCache )

	DatabaseTool.Load( "equipment" )
	DatabaseTool.GenCSharpDefine( Database.equipment, "Equipment", true, true, nil, tofile )

	DatabaseTool.Load( "talktoplayer" )
	DatabaseTool.GenCSharpDefine( Database.talktoplayer, "TalkToPlayer", true, true, nil, tofile, useGcCache )

	DatabaseTool.Load( "wildboss_setting" )
	DatabaseTool.GenCSharpDefine( Database.wildboss_setting, "WildbossSetting", true, true, nil, tofile )

	DatabaseTool.Load( "strings" )
	DatabaseTool.GenCSharpDefine( Database.strings, "strings", true, true, nil, tofile )

	DatabaseTool.Load( "battleprop" )
	DatabaseTool.GenCSharpDefine( Database.battleprop, "Battleprop", true, true, nil, tofile )

	DatabaseTool.Load( "global" )
	DatabaseTool.GenCSharpDefine( Database.global, "Global", true, true, nil, tofile )

	DatabaseTool.Load( "team_direction" )
	DatabaseTool.GenCSharpDefine( Database.team_direction, "TeamDirection", true, true, nil, tofile )

	DatabaseTool.Load( "shop_list" )
	DatabaseTool.GenCSharpDefine( Database.shop_list, "ShopList", true, true, nil, tofile )

	DatabaseTool.Load( "shop_carry" )
	DatabaseTool.GenCSharpDefine( Database.shop_carry, "ShopCarry", true, true, nil, tofile )

	DatabaseTool.Load( "shop_guild" )
	DatabaseTool.GenCSharpDefine( Database.shop_guild, "ShopGuild", true, true, nil, tofile )

	DatabaseTool.Load( "shop_arena" )
	DatabaseTool.GenCSharpDefine( Database.shop_arena, "ShopArena", true, true, nil, tofile )

	DatabaseTool.Load( "item_mix" )
	DatabaseTool.GenCSharpDefine( Database.item_mix, "ItemMix", true, true, nil, tofile )

	DatabaseTool.Load( "item_mixgroup" )
	DatabaseTool.GenCSharpDefine( Database.item_mixgroup, "ItemMixGroup", true, true, nil, tofile )

	DatabaseTool.Load( "trade" )
	DatabaseTool.GenCSharpDefine( Database.trade, "Trade", true, true, nil, tofile )

	DatabaseTool.Load( "level_reward" )
	DatabaseTool.GenCSharpDefine( Database.level_reward, "LevelReward", true, true, nil, tofile )

	DatabaseTool.Load( "daily" )
	DatabaseTool.GenCSharpDefine( Database.daily, "Daily", true, true, nil, tofile )

	DatabaseTool.Load( "daily_reward" )
	DatabaseTool.GenCSharpDefine( Database.daily_reward, "DailyReward", true, true, nil, tofile )

	DatabaseTool.Load( "sign_reward" )
	DatabaseTool.GenCSharpDefine( Database.sign_reward, "SignReward", true, true, nil, tofile )

	DatabaseTool.Load( "money" )
	DatabaseTool.GenCSharpDefine( Database.money, "Money", true, true, nil, tofile )

	DatabaseTool.Load( "guild" )
	DatabaseTool.GenCSharpDefine( Database.guild, "GuildXM", true, true, nil, tofile )

	DatabaseTool.Load( "guild_donate" )
	DatabaseTool.GenCSharpDefine( Database.guild_donate, "Guild_Donate", true, true, nil, tofile )

	DatabaseTool.Load( "guild_protect_dart" )
	DatabaseTool.GenCSharpDefine( Database.guild_protect_dart, "GuildProtectDart", true, true, nil, tofile )

	DatabaseTool.Load( "guild_rank_privilege" )
	DatabaseTool.GenCSharpDefine( Database.guild_rank_privilege, "Guild_Rank_Privilege", true, true, nil, tofile )

	DatabaseTool.Load( "equip_inten_main" )
	DatabaseTool.GenCSharpDefine( Database.equip_inten_main, "EquipIntenMain", true, true, nil, tofile )

	DatabaseTool.Load( "equip_star_collect" )
	DatabaseTool.GenCSharpDefine( Database.equip_star_collect, "Equip_Star_Collect", true, true, nil, tofile )

	DatabaseTool.Load( "equip_star_eqlv" )
	DatabaseTool.GenCSharpDefine( Database.equip_star_eqlv, "EquipStarEqlv", true, true, nil, tofile )

	DatabaseTool.Load( "equip_star_starlv" )
	DatabaseTool.GenCSharpDefine( Database.equip_star_starlv, "EquipStarStarlv", true, true, nil, tofile )

    DatabaseTool.Load( "player_lvfunction" )
	DatabaseTool.GenCSharpDefine( Database.player_lvfunction, "PlayerLvFunction", true, true, nil, tofile )

    DatabaseTool.Load( "equip_inten_carrier" )
	DatabaseTool.GenCSharpDefine( Database.equip_inten_carrier, "Equip_Inten_Carrier", true, true, nil, tofile )

	DatabaseTool.Load( "equip_inten_part" )
	DatabaseTool.GenCSharpDefine( Database.equip_inten_part, "Equip_Inten_Part", true, true, nil, tofile )

	DatabaseTool.Load( "equip_quality" )
	DatabaseTool.GenCSharpDefine( Database.equip_quality, "Equip_Quality", true, true, nil, tofile )

	DatabaseTool.Load( "soul_challenge" )
	DatabaseTool.GenCSharpDefine( Database.soul_challenge, "SoulChallenge", true, true, nil, tofile )

	DatabaseTool.Load( "player_wardrobe" )
	DatabaseTool.GenCSharpDefine( Database.player_wardrobe, "PlayerWardrobe", true, true, nil, tofile )

	DatabaseTool.Load( "zhenyaota" )
	DatabaseTool.GenCSharpDefine( Database.zhenyaota, "ZhenYaoTa", true, true, nil, tofile )

	DatabaseTool.Load( "arena" )
	DatabaseTool.GenCSharpDefine( Database.arena, "Arena", true, true, nil, tofile )

	DatabaseTool.Load( "arena_point" )
	DatabaseTool.GenCSharpDefine( Database.arena_point, "ArenaPoint", true, true, nil, tofile )

	DatabaseTool.Load( "worldboss_setting" )
	DatabaseTool.GenCSharpDefine( Database.worldboss_setting, "WorldbossSetting", true, true, nil, tofile )

	DatabaseTool.Load( "equip_inten_collect" )
	DatabaseTool.GenCSharpDefine( Database.equip_inten_collect, "Equip_Inten_Collect", true, true, nil, tofile )

	DatabaseTool.Load( "gem_board" )
	DatabaseTool.GenCSharpDefine( Database.gem_board, "Gem_Board", true, true, nil, tofile )

	DatabaseTool.Load( "gem_bonus" )
	DatabaseTool.GenCSharpDefine( Database.gem_bonus, "Gem_Bonus", true, true, nil, tofile )

	DatabaseTool.Load( "girlitem" )
	DatabaseTool.GenCSharpDefine( Database.girlitem, "GirlItem", true, true, nil, tofile )

	DatabaseTool.Load( "girlitem_type" )
	DatabaseTool.GenCSharpDefine( Database.girlitem_type, "GirlItemType", true, true, nil, tofile )

	DatabaseTool.Load( "practice" )
	DatabaseTool.GenCSharpDefine( Database.practice, "Practice", true, true, nil, tofile )

	DatabaseTool.Load( "protect_effect" )
	DatabaseTool.GenCSharpDefine( Database.protect_effect, "ProtectEffect", true, true, nil, tofile )

	DatabaseTool.Load( "battlefield_single" )
	DatabaseTool.GenCSharpDefine( Database.battlefield_single, "Battlefield_Single", true, true, nil, tofile )

	DatabaseTool.Load( "guild_skill" )
	DatabaseTool.GenCSharpDefine( Database.guild_skill, "Guild_Skill", true, true, nil, tofile )

	DatabaseTool.Load( "guild_information" )
	DatabaseTool.GenCSharpDefine( Database.guild_information, "Guild_Information", true, true, nil, tofile )

    DatabaseTool.Load( "world_lv" )
	DatabaseTool.GenCSharpDefine( Database.world_lv, "WorldLevel", true, true, nil, tofile )

	DatabaseTool.Load( "fb_process" )
	DatabaseTool.GenCSharpDefine( Database.fb_process, "FbProcess", true, true, nil, tofile )

	DatabaseTool.Load( "money_tree" )
	DatabaseTool.GenCSharpDefine( Database.money_tree, "MoneyTree", true, true, nil, tofile )

	DatabaseTool.Load( "ImprovePower" )
	DatabaseTool.GenCSharpDefine( Database.ImprovePower, "ImprovePower", true, true, nil, tofile )

	DatabaseTool.Load( "Accessresources" )
	DatabaseTool.GenCSharpDefine( Database.Accessresources, "Accessresources", true, true, nil, tofile )

	DatabaseTool.Load( "camp_infromation" )
	DatabaseTool.GenCSharpDefine( Database.camp_infromation, "Camp_Infromation", true, true, nil, tofile )

	DatabaseTool.Load( "player_callothers" )
	DatabaseTool.GenCSharpDefine( Database.player_callothers, "Payer_Callothers", true, true, nil, tofile )

	DatabaseTool.Load( "redpackets" )
	DatabaseTool.GenCSharpDefine( Database.redpackets, "Redpackets", true, true, nil, tofile )

	DatabaseTool.Load( "battlefield_eternalDay" )
	DatabaseTool.GenCSharpDefine( Database.battlefield_eternalDay, "Battlefield_eternalDay", true, true, nil, tofile )

	DatabaseTool.Load( "task_camp" )
	DatabaseTool.GenCSharpDefine( Database.task_camp, "Task_Camp", true, true, nil, tofile )

	DatabaseTool.Load( "rank" )
	DatabaseTool.GenCSharpDefine( Database.rank, "Rank", true, true, nil, tofile )

	DatabaseTool.Load( "achievement" )
	DatabaseTool.GenCSharpDefine( Database.achievement, "Achievement", true, true, nil, tofile )

	DatabaseTool.Load( "sweeping" )
	DatabaseTool.GenCSharpDefine( Database.sweeping, "Sweeping", true, true, nil, tofile )

	DatabaseTool.Load( "command" )
	DatabaseTool.GenCSharpDefine( Database.command, "Command", true, true, nil, tofile )

	DatabaseTool.Load( "vip" )
	DatabaseTool.GenCSharpDefine( Database.vip, "Vip", true, true, nil, tofile )

	DatabaseTool.Load( "vip_power" )
	DatabaseTool.GenCSharpDefine( Database.vip_power, "VipPower", true, true, nil, tofile )

	DatabaseTool.Load( "vip_power_price" )
	DatabaseTool.GenCSharpDefine( Database.vip_power_price, "VipPowerPrice", true, true, nil, tofile )

	DatabaseTool.Load( "guidesetting" )
	DatabaseTool.GenCSharpDefine( Database.guidesetting, "GuideSetting", true, true, nil, tofile )

	DatabaseTool.Load( "nextMenu" )
	DatabaseTool.GenCSharpDefine( Database.nextMenu, "NextMenu", true, true, nil, tofile )

	DatabaseTool.Load( "recover" )
	DatabaseTool.GenCSharpDefine( Database.recover, "Recover", true, true, nil, tofile )

	DatabaseTool.Load( "title" )
	DatabaseTool.GenCSharpDefine( Database.title, "Title", true, true, nil, tofile )

	DatabaseTool.Load( "head" )
	DatabaseTool.GenCSharpDefine( Database.head, "Head", true, true, nil, tofile )

	DatabaseTool.Load( "campaign" )
	DatabaseTool.GenCSharpDefine( Database.campaign, "Campaign", true, true, nil, tofile )

	DatabaseTool.Load( "copyProcess" )
	DatabaseTool.GenCSharpDefine( Database.copyProcess, "CopyProcess", true, true, nil, tofile )

	DatabaseTool.Load( "land_reward" )
	DatabaseTool.GenCSharpDefine( Database.land_reward, "Land_Reward", true, true, nil, tofile )

	DatabaseTool.Load( "recharge_reward" )
	DatabaseTool.GenCSharpDefine( Database.recharge_reward, "RechargeReward", true, true, nil, tofile )

	DatabaseTool.Load( "SoundCfg" )
	DatabaseTool.GenCSharpDefine( Database.SoundCfg, "SoundCfg", true, true, nil, tofile )

	DatabaseTool.Load( "shop_camp" )
	DatabaseTool.GenCSharpDefine( Database.shop_camp, "ShopCamp", true, true, nil, tofile )

	DatabaseTool.Load( "guild_boss" )
	DatabaseTool.GenCSharpDefine( Database.guild_boss, "GuildBoss", true, true, nil, tofile )

	DatabaseTool.Load( "color" )
	DatabaseTool.GenCSharpDefine( Database.color, "ColorDB", true, true, nil, tofile )

	DatabaseTool.Load( "killmonster" )
	DatabaseTool.GenCSharpDefine( Database.killmonster, "KillMonster", true, true, nil, tofile )

	DatabaseTool.Load( "Chaosbattle_Dayreward" )
	DatabaseTool.GenCSharpDefine( Database.Chaosbattle_Dayreward, "ChaosFightDayReward", true, true, nil, tofile )

	DatabaseTool.Load( "Chaosbattle_Weekreward" )
	DatabaseTool.GenCSharpDefine( Database.Chaosbattle_Weekreward, "ChaosFightWeekReward", true, true, nil, tofile )

	DatabaseTool.Load( "soul" )
	DatabaseTool.GenCSharpDefine( Database.soul, "Soul", true, true, nil, tofile )

	DatabaseTool.Load( "soul_group" )
	DatabaseTool.GenCSharpDefine( Database.soul_group, "Soul_Group", true, true, nil, tofile )

	DatabaseTool.Load( "soul_type" )
	DatabaseTool.GenCSharpDefine( Database.soul_type, "Soul_Type", true, true, nil, tofile )

	DatabaseTool.Load( "photo_action" )
	DatabaseTool.GenCSharpDefine( Database.photo_action, "PhotoAction", true, true, nil, tofile )

	DatabaseTool.Load( "camera_posteffect" )
	DatabaseTool.GenCSharpDefine( Database.camera_posteffect, "CameraPostEffect", true, true, nil, tofile )

	DatabaseTool.Load( "pet" )
	DatabaseTool.GenCSharpDefine( Database.pet, "Pet", true, true, nil, tofile )

	DatabaseTool.Load( "pet_equip" )
	DatabaseTool.GenCSharpDefine( Database.pet_equip, "Pet_Equip", true, true, nil, tofile )

	DatabaseTool.Load( "pet_fightadd" )
	DatabaseTool.GenCSharpDefine( Database.pet_fightadd, "Pet_Fightadd", true, true, nil, tofile )

	DatabaseTool.Load( "pet_group" )
	DatabaseTool.GenCSharpDefine( Database.pet_group, "Pet_Group", true, true, nil, tofile )

	DatabaseTool.Load( "pet_level" )
	DatabaseTool.GenCSharpDefine( Database.pet_level, "Pet_Level", true, true, nil, tofile )

	DatabaseTool.Load( "pet_practice" )
	DatabaseTool.GenCSharpDefine( Database.pet_practice, "Pet_Practice", true, true, nil, tofile )

	DatabaseTool.Load( "pet_practicecost" )
	DatabaseTool.GenCSharpDefine( Database.pet_practicecost, "Pet_Practicecost", true, true, nil, tofile )

	DatabaseTool.Load( "pet_soulskill" )
	DatabaseTool.GenCSharpDefine( Database.pet_soulskill, "Pet_Soulskill", true, true, nil, tofile )

	DatabaseTool.Load( "pet_star" )
	DatabaseTool.GenCSharpDefine( Database.pet_star, "Pet_Star", true, true, nil, tofile )

	DatabaseTool.Load( "camp_fighttarget" )
	DatabaseTool.GenCSharpDefine( Database.camp_fighttarget, "CampFightTarget", true, true, nil, tofile )

	DatabaseTool.Load( "deviceEvaluate" )
	DatabaseTool.GenCSharpDefine( Database.deviceEvaluate, "DeviceEvaluate", true, true, nil, tofile )

	DatabaseTool.Load( "guild_task_rew" )
	DatabaseTool.GenCSharpDefine( Database.guild_task_rew, "GuildTaskRew", true, true, nil, tofile )

	DatabaseTool.Load( "achievementDaily" )
	DatabaseTool.GenCSharpDefine( Database.achievementDaily, "AchievementDaily", true, true, nil, tofile )

	DatabaseTool.Load( "pet_practicerank" )
	DatabaseTool.GenCSharpDefine( Database.pet_practicerank, "Pet_Practicerank", true, true, nil, tofile )

	DatabaseTool.Load( "player_deadguide" )
	DatabaseTool.GenCSharpDefine( Database.player_deadguide, "Player_Deadguide", true, true, nil, tofile )

	DatabaseTool.Load( "photo_image" )
	DatabaseTool.GenCSharpDefine( Database.photo_image, "PhotoInfo", true, true, nil, tofile )

	DatabaseTool.Load( "equip_addprop" )
	DatabaseTool.GenCSharpDefine( Database.equip_addprop, "Equip_Addprop", true, true, nil, tofile )

	DatabaseTool.Load( "month_card" )
	DatabaseTool.GenCSharpDefine( Database.month_card, "MonthCard", true, true, nil, tofile )

	DatabaseTool.Load( "month_card_project" )
	DatabaseTool.GenCSharpDefine( Database.month_card_project, "MonthCardProject", true, true, nil, tofile )

	DatabaseTool.Load( "roleface" )
	DatabaseTool.GenCSharpDefine( Database.roleface, "MoveToRoleFace", true, true, nil, tofile )

	DatabaseTool.Load( "Menu_hide" )
	DatabaseTool.GenCSharpDefine( Database.Menu_hide, "Menu_Hide", true, true, nil, tofile )

	DatabaseTool.Load( "equip_collect" )
	DatabaseTool.GenCSharpDefine( Database.equip_collect, "EquipCollect", true, true, nil, tofile )

	DatabaseTool.Load( "equip_group" )
	DatabaseTool.GenCSharpDefine( Database.equip_group, "EquipGroup", true, true, nil, tofile )

	DatabaseTool.Load( "setting" )
	DatabaseTool.GenCSharpDefine( Database.setting, "Setting", true, true, nil, tofile )

	DatabaseTool.Load( "camera_zoom" )
	DatabaseTool.GenCSharpDefine( Database.camera_zoom, "CameraZoom", true, true, nil, tofile )

	DatabaseTool.Load( "guild_protect_dartrew" )
	DatabaseTool.GenCSharpDefine( Database.guild_protect_dartrew, "GuildProtectDartrew", true, true, nil, tofile )

	DatabaseTool.Load( "camp_rew" )
	DatabaseTool.GenCSharpDefine( Database.camp_rew, "Camp_Rew", true, true, nil, tofile )

	DatabaseTool.Load( "talkinfo" )
	DatabaseTool.GenCSharpDefine( Database.talkinfo, "TalkInfo", true, true, nil, tofile )

	DatabaseTool.Load( "time_reward" )
	DatabaseTool.GenCSharpDefine( Database.time_reward, "TmeReward", true, true, nil, tofile )

	DatabaseTool.Load( "titleshow" )
	DatabaseTool.GenCSharpDefine( Database.titleshow, "Titleshow", true, true, nil, tofile )

	DatabaseTool.Load( "single_tower" )
	DatabaseTool.GenCSharpDefine( Database.single_tower, "SngleTower", true, true, nil, tofile )

	DatabaseTool.Load( "map_Inspire" )
	DatabaseTool.GenCSharpDefine( Database.map_Inspire, "Map_Inspire", true, true, nil, tofile )

	DatabaseTool.Load( "wingLevel" )
	DatabaseTool.GenCSharpDefine( Database.wingLevel, "WingLevel", true, true, nil, tofile )

	DatabaseTool.Load( "wingQuality" )
	DatabaseTool.GenCSharpDefine( Database.wingQuality, "WingQuality", true, true, nil, tofile )

	DatabaseTool.Load( "single_tower_rew" )
	DatabaseTool.GenCSharpDefine( Database.single_tower_rew, "SingleTowerRew", true, true, nil, tofile )

	DatabaseTool.Load( "taskdescribe" )
	DatabaseTool.GenCSharpDefine( Database.taskdescribe, "TaskDescribe", true, true, nil, tofile )

	DatabaseTool.Load( "mount_star" )
	DatabaseTool.GenCSharpDefine( Database.mount_star, "Mount_star", true, true, nil, tofile )

	DatabaseTool.Load( "warnTips" )
	DatabaseTool.GenCSharpDefine( Database.warnTips, "WarnTips", true, true, nil, tofile )

	DatabaseTool.Load( "mount_stage" )
	DatabaseTool.GenCSharpDefine( Database.mount_stage, "Mount_stage", true, true, nil, tofile )

	DatabaseTool.Load( "preachEXP_up" )
	DatabaseTool.GenCSharpDefine( Database.preachEXP_up, "PreachExpUp", true, true, nil, tofile )

	DatabaseTool.Load( "preachEXP" )
	DatabaseTool.GenCSharpDefine( Database.preachEXP, "PreachExp", true, true, nil, tofile )

	DatabaseTool.Load( "task_masterreward" )
	DatabaseTool.GenCSharpDefine( Database.task_masterreward, "TaskMasterReward", true, true, nil, tofile )

	DatabaseTool.Load( "exp_increase" )
	DatabaseTool.GenCSharpDefine( Database.exp_increase, "ExpIncrease", true, true, nil, tofile )

	DatabaseTool.Load( "growup" )
	DatabaseTool.GenCSharpDefine( Database.growup, "Growup", true, true, nil, tofile )

	DatabaseTool.Load( "growupreward" )
	DatabaseTool.GenCSharpDefine( Database.growupreward, "GrowupReward", true, true, nil, tofile )

	DatabaseTool.Load( "howtogrowup" )
	DatabaseTool.GenCSharpDefine( Database.howtogrowup, "HowToGrowup", true, true, nil, tofile )

	DatabaseTool.Load( "daily_reward" )
	DatabaseTool.GenCSharpDefine( Database.daily_reward, "Daily_reward", true, true, nil, tofile )

	DatabaseTool.Load( "task_masterexpend" )
	DatabaseTool.GenCSharpDefine( Database.task_masterexpend, "TaskMasterExpend", true, true, nil, tofile )

	DatabaseTool.Load( "task_master" )
	DatabaseTool.GenCSharpDefine( Database.task_master, "TaskMaster", true, true, nil, tofile )

	DatabaseTool.Load( "girl_talk" )
	DatabaseTool.GenCSharpDefine( Database.girl_talk, "Girl_Talk", true, true, nil, tofile )

	DatabaseTool.Load( "camp_protect_dart" )
	DatabaseTool.GenCSharpDefine( Database.camp_protect_dart, "CampProtectDart", true, true, nil, tofile )

	DatabaseTool.Load( "girl_ui_show" )
	DatabaseTool.GenCSharpDefine( Database.girl_ui_show, "Girl_UI_Show", true, true, nil, tofile )

	DatabaseTool.Load( "shop_friendship" )
	DatabaseTool.GenCSharpDefine( Database.shop_friendship, "ShopFriendship", true, true, nil, tofile )

	DatabaseTool.Load( "daily_Group" )
	DatabaseTool.GenCSharpDefine( Database.daily_Group, "DailyGroup", true, true, nil, tofile )

	DatabaseTool.Load( "Underground" )
	DatabaseTool.GenCSharpDefine( Database.Underground, "Underground", true, true, nil, tofile )

	DatabaseTool.Load( "Underground_task" )
	DatabaseTool.GenCSharpDefine( Database.Underground_task, "UndergroundTask", true, true, nil, tofile )

	DatabaseTool.Load( "acupoint" )
	DatabaseTool.GenCSharpDefine( Database.acupoint, "AcuPoint", true, true, nil, tofile )

	DatabaseTool.Load( "acupointUp" )
	DatabaseTool.GenCSharpDefine( Database.acupointUp, "AcuPointUp", true, true, nil, tofile )

	DatabaseTool.Load( "item_discount" )
	DatabaseTool.GenCSharpDefine( Database.item_discount, "ItemDiscount", true, true, nil, tofile )

	DatabaseTool.Load( "turnplate" )
	DatabaseTool.GenCSharpDefine( Database.turnplate, "TurnPlate", true, true, nil, tofile )

	DatabaseTool.Load( "achievementStar" )
	DatabaseTool.GenCSharpDefine( Database.achievementStar, "AchievementStar", true, true, nil, tofile )

	DatabaseTool.Load( "fund" )
	DatabaseTool.GenCSharpDefine( Database.fund, "Fund", true, true, nil, tofile )

	DatabaseTool.Load( "fund_welfare" )
	DatabaseTool.GenCSharpDefine( Database.fund_welfare, "FundWelfare", true, true, nil, tofile )

	DatabaseTool.Load( "girlBless" )
	DatabaseTool.GenCSharpDefine( Database.girlBless, "GirlBless", true, true, nil, tofile )

	DatabaseTool.Load( "daybuy" )
	DatabaseTool.GenCSharpDefine( Database.daybuy, "DayBuy", true, true, nil, tofile )


	DatabaseTool.Load( "Underground_buff" )
	DatabaseTool.GenCSharpDefine( Database.Underground_buff, "UndergroundBuff", true, true, nil, tofile )

	DatabaseTool.Load( "guild_protect_tree" )
	DatabaseTool.GenCSharpDefine( Database.guild_protect_tree, "GuildProtectTree", true, true, nil, tofile )

	DatabaseTool.Load( "arena_refresh" )
	DatabaseTool.GenCSharpDefine( Database.arena_refresh, "Arena_refresh", true, true, nil, tofile )

	DatabaseTool.Load( "protect_chiyan" )
	DatabaseTool.GenCSharpDefine( Database.protect_chiyan, "Protect_chiyan", true, true, nil, tofile )

	DatabaseTool.Load( "first_recharge" )
	DatabaseTool.GenCSharpDefine( Database.first_recharge, "FirstRecharge", true, true, nil, tofile )

	DatabaseTool.Load( "guild_salary" )
	DatabaseTool.GenCSharpDefine( Database.guild_salary, "Guild_salary", true, true, nil, tofile )

	DatabaseTool.Load( "exp_offline" )
	DatabaseTool.GenCSharpDefine( Database.exp_offline, "Exp_offline", true, true, nil, tofile )

	DatabaseTool.Load( "wild_coordinates" )
	DatabaseTool.GenCSharpDefine( Database.wild_coordinates, "Wild_Coordinates", true, true, nil, tofile )

	DatabaseTool.Load( "signal_tips" )
	DatabaseTool.GenCSharpDefine( Database.signal_tips, "SignalTips", true, true, nil, tofile )
	
	DatabaseTool.Load( "guildBattle" )
	DatabaseTool.GenCSharpDefine( Database.guildBattle, "GuildBattle", true, true, nil, tofile )

	DatabaseTool.Load( "honor" )
	DatabaseTool.GenCSharpDefine( Database.honor, "Honor", true, true, nil, tofile )

	GenCSharpClasses()

	print( ">>>>>\n" )
	local exported = {}
	for k, v in pairs( Database ) do
		local t = type( v )
		if t == "table" then
			for id, vv in pairs( v ) do
				if id == 0 then
					print( "table key must not be 0!! name = "..k )
					--os.execute( "pause" )
				end
			end
		end
		exported[#exported + 1] = k
	end
	table.sort( exported,
		function( v1, v2 )
			return string.upper( v1 ) < string.upper( v2 )
		end
	)
	local d = '-'
	for _, k in ipairs( exported ) do
		local lead = string.upper( string.sub( k, 0, 1 ) )
		if d ~= lead then
			d = lead
			--print( lead.."\t" )
		end
		--print( "\t"..k )
	end
	print( ">>>>>\n" )
	LocalizeDatabase.ExportDatabaseLocalText( tofile, false )
end

--EOF

