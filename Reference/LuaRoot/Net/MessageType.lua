--BEGIN refrence file declear
local MSG_achievement = require "Net.MSG_achievement"
local MSG_acupoint = require "Net.MSG_acupoint"
local MSG_arena = require "Net.MSG_arena"
local MSG_backendactivity = require "Net.MSG_backendactivity"
local MSG_bagItem = require "Net.MSG_bagItem"
local MSG_battle = require "Net.MSG_battle"
local MSG_buff = require "Net.MSG_buff"
local MSG_calltogether = require "Net.MSG_calltogether"
local MSG_camp = require "Net.MSG_camp"
local MSG_chaosFight = require "Net.MSG_chaosFight"
local MSG_compose = require "Net.MSG_compose"
local MSG_copy = require "Net.MSG_copy"
local MSG_crossserver = require "Net.MSG_crossserver"
local MSG_dailyActive = require "Net.MSG_dailyActive"
local MSG_dress = require "Net.MSG_dress"
local MSG_energy = require "Net.MSG_energy"
local MSG_equip = require "Net.MSG_equip"
local MSG_foreverFight = require "Net.MSG_foreverFight"
local MSG_friend = require "Net.MSG_friend"
local MSG_gem = require "Net.MSG_gem"
local MSG_growup = require "Net.MSG_growup"
local MSG_guild = require "Net.MSG_guild"
local MSG_guildCapital = require "Net.MSG_guildCapital"
local MSG_guildFight = require "Net.MSG_guildFight"
local MSG_guildactive = require "Net.MSG_guildactive"
local MSG_head = require "Net.MSG_head"
local MSG_landreward = require "Net.MSG_landreward"
local MSG_levelreward = require "Net.MSG_levelreward"
local MSG_lookother = require "Net.MSG_lookother"
local MSG_mail = require "Net.MSG_mail"
local MSG_mall = require "Net.MSG_mall"
local MSG_master = require "Net.MSG_master"
local MSG_minorlv = require "Net.MSG_minorlv"
local MSG_moneytree = require "Net.MSG_moneytree"
local MSG_multiplefight = require "Net.MSG_multiplefight"
local MSG_newmount = require "Net.MSG_newmount"
local MSG_newtask = require "Net.MSG_newtask"
local MSG_pet = require "Net.MSG_pet"
local MSG_player = require "Net.MSG_player"
local MSG_practive = require "Net.MSG_practive"
local MSG_preach = require "Net.MSG_preach"
local MSG_rank = require "Net.MSG_rank"
local MSG_recharge = require "Net.MSG_recharge"
local MSG_reconnect = require "Net.MSG_reconnect"
local MSG_recover = require "Net.MSG_recover"
local MSG_redpackets = require "Net.MSG_redpackets"
local MSG_setting = require "Net.MSG_setting"
local MSG_shop = require "Net.MSG_shop"
local MSG_signin = require "Net.MSG_signin"
local MSG_singleTower = require "Net.MSG_singleTower"
local MSG_skill = require "Net.MSG_skill"
local MSG_soul = require "Net.MSG_soul"
local MSG_team = require "Net.MSG_team"
local MSG_townDemonTower = require "Net.MSG_townDemonTower"
local MSG_trade = require "Net.MSG_trade"
local MSG_vip = require "Net.MSG_vip"
local MSG_wing = require "Net.MSG_wing"
local MSG_world = require "Net.MSG_world"
--END refrence file declear


--BEGIN type define

--n = EFDT_unknown
--t = EFDT_bool
--b = EFDT_int8
--B = EFDT_uint8
--s = EFDT_int16
--S = EFDT_uint16
--i = EFDT_int32
--I = EFDT_uint32
--l = EFDT_int64
--L = EFDT_uint64
--f = EFDT_float
--d = EFDT_double
--z = EFDT_string
--u = EFDT_custom

--END type define

--BEGIN table for msgs description
return
{
	__VERSION__ = 0,
--BEGIN message id define


--Begin achievement...
	MSG_GS2U_AchievementFinish = 11034,
	MSG_GS2U_AchievementInfo = 24225,
	MSG_GS2U_GetAchievementReward = 48892,
	MSG_GS2U_GetGrowupAchStarRewardSuccess = 39744,
	MSG_GS2U_GrowupAchInfo = 47018,
	MSG_U2GS_AchievementInfo = 4487,
	MSG_U2GS_GetAchievementReward = 15854,
	MSG_U2GS_GetGrowupAchStarReward = 10449,
	MSG_U2GS_GrowupAchInfo = 60960,
--Endachievement

--Begin acupoint...
	MSG_GS2U_AcupointInfoList = 529,
	MSG_GS2U_UpAcupointInfoSuccess = 46761,
	MSG_U2GS_AcupointInfo = 50121,
	MSG_U2GS_UpAcupointInfo = 40604,
--Endacupoint

--Begin arena...
	MSG_GS2U_BattleTargetList = 18275,
	MSG_GS2U_ChallengeBegin = 16778,
	MSG_GS2U_ChallengeFinish = 47634,
	MSG_GS2U_DefenseSkillList = 16303,
	MSG_GS2U_GetDuanRewardSuccess = 51292,
	MSG_GS2U_GetTopRewardSuccess = 43577,
	MSG_GS2U_JJC4v4BattleHp = 61991,
	MSG_GS2U_JJC4v4MatchSuccess = 65165,
	MSG_GS2U_JJC4v4OverIsWin = 46827,
	MSG_GS2U_JJC4v4PlayeAdd = 62247,
	MSG_GS2U_JJC4v4PlayeRemove = 37758,
	MSG_GS2U_RecordList = 43163,
	MSG_GS2U_RequestChallengeResult = 16385,
	MSG_GS2U_RewardValue = 4258,
	MSG_GS2U_TopThree = 361,
	MSG_U2GS_ChallengeBegin = 61452,
	MSG_U2GS_ChallengeTarget = 55838,
	MSG_U2GS_GetDuanReward = 45209,
	MSG_U2GS_GetTopReward = 44156,
	MSG_U2GS_JJC4v4LockBattle = 2452,
	MSG_U2GS_JJC4v4Matching = 25214,
	MSG_U2GS_RefreshTarget = 15974,
	MSG_U2GS_RequestBattleTargetList = 56128,
	MSG_U2GS_RequestDefenseSkill = 14946,
	MSG_U2GS_RequestRecord = 43766,
	MSG_U2GS_RequestRewardValue = 42849,
	MSG_U2GS_RequestTopThree = 23462,
	MSG_U2GS_SetDefenseSkillList = 2539,
--Endarena

--Begin backendactivity...
	MSG_GS2U_BackendActivityList = 44229,
	MSG_GS2U_CommonExpense = 34025,
	MSG_GS2U_CommonRecharge = 17138,
	MSG_GS2U_ContinuousRecharge = 24138,
	MSG_GS2U_DayBuyActivity = 14769,
	MSG_GS2U_ExchangeActivityInfo = 28560,
	MSG_GS2U_GetBackendActivitySuccess = 2686,
	MSG_GS2U_GroupBuy = 39991,
	MSG_GS2U_LoginActivityInfo = 2350,
	MSG_GS2U_MultiActivity = 3216,
	MSG_GS2U_NewBackendActivity = 60871,
	MSG_U2GS_GetBackendActivity = 43211,
	MSG_U2GS_RequestBackendActivityInfo = 2388,
	MSG_U2GS_RequestBackendActivityList = 49508,
	MSG_U2GS_RequestMultiActivity = 51751,
--Endbackendactivity

--Begin bagItem...
	MSG_GS2U_ExpMedRateChange = 4407,
	MSG_GS2U_ExpMedRateDelete = 51706,
	MSG_GS2U_ExpMedRateList = 22709,
	MSG_GS2U_GirlBlessValueChange = 43474,
	MSG_GS2U_GirlBlessValueDelete = 25237,
	MSG_GS2U_GirlBlessValueList = 59096,
	MSG_GS2U_ISMoveItemNeedKey = 61935,
	MSG_GS2U_InitBagItem = 2251,
	MSG_GS2U_InitCellInfoList = 3266,
	MSG_GS2U_ItemGroupReaminCount = 22975,
	MSG_GS2U_RemoveItem = 13063,
	MSG_GS2U_UIGetItemInfo = 28587,
	MSG_GS2U_UpdateItem = 61520,
	MSG_MsgMoveItem = 51505,
	MSG_MsgOpenCell = 65377,
	MSG_U2GS_IsMoveItemNeedKey = 20133,
	MSG_U2GS_SellItem = 54631,
	MSG_U2GS_SetStoreKey = 21314,
	MSG_U2GS_SortBag = 41032,
	MSG_U2GS_UseBagItem = 42322,
	MSG_U2GS_UseBagItemToObject = 2964,
--EndbagItem

--Begin battle...
	MSG_C2S_PlayerUseShiftSkill = 36467,
	MSG_C2S_PlayerUseSkill = 38338,
	MSG_GS2U_AttackOffsetEffect = 10740,
	MSG_GS2U_AttackResult = 17141,
	MSG_GS2U_AttackResultEx = 5224,
	MSG_GS2U_BattleHpRecoverResult = 29613,
	MSG_GS2U_BreakSkill = 51286,
	MSG_GS2U_ChangeBattleFieldId = 64141,
	MSG_GS2U_ChangeFightState = 33613,
	MSG_GS2U_ChangeOwnerId = 63438,
	MSG_GS2U_Dead = 24104,
	MSG_GS2U_FixPlayerHp = 7586,
	MSG_GS2U_ForceDeadNow = 52551,
	MSG_GS2U_MonsterSpeed = 37689,
	MSG_GS2U_PkValue = 25938,
	MSG_GS2U_PlayerDead = 33757,
	MSG_GS2U_SprintFailed = 27775,
	MSG_GS2U_UseSkillFailed = 4607,
	MSG_GS2U_UseSkillToObject = 48800,
	MSG_GS2U_UseSkillToPos = 29375,
	MSG_GS2U_UseSpeSkillSuccess = 17467,
	MSG_U2GS_BattleHpRecover = 55094,
	MSG_U2GS_ChangeFightState = 17439,
	MSG_U2GS_GetPkValue = 36242,
--Endbattle

--Begin buff...
	MSG_GS2U_BuffHurt = 62410,
	MSG_GS2U_BuffHurtEx = 22917,
	MSG_GS2U_BuffInfo = 43249,
	MSG_GS2U_RemoveBuff = 54287,
--Endbuff

--Begin calltogether...
	MSG_GS2U_ReturnCallTogether = 6236,
	MSG_U2GS_AgreeCallTogether = 37582,
	MSG_U2GS_RequestCallTogether = 8577,
--Endcalltogether

--Begin camp...
	MSG_GS2U_BordCampBossDeadBord = 43568,
	MSG_GS2U_BordCampBossHp = 14341,
	MSG_GS2U_CampDartBossBlood = 46925,
	MSG_GS2U_CampDartKill = 32010,
	MSG_GS2U_CampIsCanBanTalk = 5194,
	MSG_GS2U_CampTaskNumber = 12903,
	MSG_GS2U_CampWarBossBlood = 34102,
	MSG_GS2U_CampWarKill = 33101,
	MSG_GS2U_CampWarMonsDeadStateList = 20885,
	MSG_GS2U_CampWarProcessResponse = 59973,
	MSG_GS2U_CampWarRankResponse = 31432,
	MSG_GS2U_CampWarResult = 49680,
	MSG_GS2U_ExploitValue = 16222,
	MSG_GS2U_RespCampDartBossPosition = 15830,
	MSG_GS2U_ReturnCampLeader = 43002,
	MSG_GS2U_ReturnCampTypeId = 63122,
	MSG_GS2U_TadayCampSalaryCount = 13065,
	MSG_GS2U_campDartBossBosPos = 13395,
	MSG_U2GS_CampBanTalk = 29224,
	MSG_U2GS_CampGetSalary = 1869,
	MSG_U2GS_CampWarBossBloodQuery = 8108,
	MSG_U2GS_CampWarEnterReqest = 38415,
	MSG_U2GS_CampWarProcessReqest = 64494,
	MSG_U2GS_CampWarRankRequest = 62654,
	MSG_U2GS_GetCampTask = 10442,
	MSG_U2GS_GoToCampMap = 39558,
	MSG_U2GS_ReqCampDartBossPosition = 26426,
	MSG_U2GS_RequestCampLeader = 42391,
	MSG_U2GS_RequestCampTaskNumber = 21500,
	MSG_U2GS_RequestSalaryCount = 56136,
--Endcamp

--Begin chaosFight...
	MSG_GS2U_ChaosFightEnd = 17991,
	MSG_GS2U_ChaosFightGatherRefresh = 39884,
	MSG_GS2U_ChaosFightInfo = 11346,
	MSG_GS2U_ChaosFightKillOrGather = 60308,
	MSG_GS2U_ChaosFightRankInfoList = 3408,
	MSG_GS2U_ChaosFightScoreInfoList = 31738,
	MSG_GS2U_ChaosMap2BossActive = 7773,
	MSG_GS2U_GetLChaosFightDayRewardSuccess = 64434,
	MSG_U2GS_ChaosFightInfo = 56020,
	MSG_U2GS_ChaosFightJoin = 40528,
	MSG_U2GS_GetChaosFightDayReward = 27431,
	MSG_U2GS_RequestChaosFightRankInfo = 33611,
--EndchaosFight

--Begin compose...
	MSG_GS2U_ComposeProp = 27821,
	MSG_GS2U_GetCompose = 600,
	MSG_U2GS_ComposeProp = 19507,
	MSG_U2GS_GetCompose = 33210,
--Endcompose

--Begin copy...
	MSG_GS2U_CopyMapRemainCount = 31536,
	MSG_GS2U_CopyProcessApointMonster = 14437,
	MSG_GS2U_CopyProcessEscort = 51710,
	MSG_GS2U_CopyProcessEscortPer = 31031,
	MSG_GS2U_CopyProcessHpPer = 11699,
	MSG_GS2U_CopyProcessKillAll = 55305,
	MSG_GS2U_CopyProcessKillApoint = 42343,
	MSG_GS2U_CopyProcessKillNum = 64022,
	MSG_GS2U_CopyProcessLoop = 19090,
	MSG_GS2U_CopyProcessProtected = 22892,
	MSG_GS2U_ExtraRewardRemainTime = 39416,
	MSG_GS2U_FinishCopy = 33184,
	MSG_GS2U_MapInspire = 15138,
	MSG_GS2U_MiniMapInfo = 14887,
	MSG_GS2U_NextPos = 43381,
	MSG_GS2U_RequestEnterCopyMap = 45346,
	MSG_GS2U_StoryCopyFinishId = 21501,
	MSG_GS2U_UpdateCopyMapRemainCount = 5209,
	MSG_GS2U_WipeCopyResult = 53353,
	MSG_U2GS_AddMapInspire = 39157,
	MSG_U2GS_AgreeEnterCopyMap = 3765,
	MSG_U2GS_EnterCopyMap = 24973,
	MSG_U2GS_EnterStoryCopyMap = 62468,
	MSG_U2GS_GetMiniMapInfo = 1639,
	MSG_U2GS_GetStoryCopyFinishId = 20028,
	MSG_U2GS_LeaveCopyMap = 15694,
	MSG_U2GS_RefrehMonster = 3590,
	MSG_U2GS_RequestNextPos = 30660,
	MSG_U2GS_TriggerNextProgress = 53270,
	MSG_U2GS_WipeCopyMap = 60386,
--Endcopy

--Begin crossserver...
	MSG_GS2U_ApplyCrossActivityResult = 49906,
	MSG_GS2U_CanEnterCross = 31724,
	MSG_GS2U_EnterCrossToken = 32613,
	MSG_U2GS_CrossServerLogin = 42128,
	MSG_U2GS_EnterCross = 11826,
	MSG_U2GS_ReturnGameServer = 53115,
--Endcrossserver

--Begin dailyActive...
	MSG_GS2U_DailyActiveInfo = 54629,
	MSG_GS2U_DailyActivePoint = 63397,
	MSG_GS2U_FreshWildBoss = 44045,
	MSG_GS2U_GetDailyRewardSuccess = 30797,
	MSG_GS2U_KillMonsterInfo = 60038,
	MSG_GS2U_MoneyCopyMapKillNum = 52389,
	MSG_GS2U_MoneyCopyMapProcess = 61232,
	MSG_GS2U_MulitipleReamin = 39171,
	MSG_GS2U_MulitipleSuccess = 42920,
	MSG_GS2U_NowRefreshWorldBoss = 36866,
	MSG_GS2U_PersonalBattleEnterMap = 44436,
	MSG_GS2U_PersonalBattleFinish = 21931,
	MSG_GS2U_PersonalBattleHpPer = 25269,
	MSG_GS2U_PersonalBattleKill = 13090,
	MSG_GS2U_ProtectNPCProcess = 47633,
	MSG_GS2U_ProtectNpcGetEffect = 47317,
	MSG_GS2U_ProtectNpcHpPer = 60195,
	MSG_GS2U_ProtectOwnEffectId = 2103,
	MSG_GS2U_ProtectUseEffectId = 15524,
	MSG_GS2U_WildBossDead = 65499,
	MSG_GS2U_WildBossOwner = 15552,
	MSG_GS2U_WorldBossHarm = 32047,
	MSG_GS2U_WorldBossHarmTopThree = 19040,
	MSG_U2GS_GetDailyReward = 49864,
	MSG_U2GS_JoinDailyActive = 37299,
	MSG_U2GS_ProtectUseEffectId = 7238,
	MSG_U2GS_RequestDailyActiveInfo = 45972,
	MSG_U2GS_WorldBossHarm = 45989,
--EnddailyActive

--Begin dress...
	MSG_GS2U_BuyDressSuccess = 30066,
	MSG_GS2U_DressResult = 45412,
	MSG_GS2U_HadBuyDressInfo = 64418,
	MSG_U2GS_BuyDress = 40151,
	MSG_U2GS_OperateDress = 29781,
	MSG_U2GS_RequestDressInfo = 41168,
--Enddress

--Begin energy...
	MSG_GS2U_remainEnergy = 35880,
--Endenergy

--Begin equip...
	MSG_GS2U_ActiveEquipSucce = 40201,
	MSG_GS2U_EquipDurChange = 64637,
	MSG_GS2U_EquipStrengLvChange = 9507,
	MSG_GS2U_GetAllEquip = 56873,
	MSG_GS2U_StarGoEquip = 65234,
	MSG_GS2U_StrengthEquip = 123,
	MSG_GS2U_StrengthEquipOneKey = 54924,
	MSG_GS2U_UpEquip = 53577,
	MSG_U2GS_ActiveEquip = 3900,
	MSG_U2GS_DurEquip = 29589,
	MSG_U2GS_StarGoEquip = 56920,
	MSG_U2GS_StrengthEquip = 14065,
	MSG_U2GS_UpEquip = 58223,
--Endequip

--Begin foreverFight...
	MSG_GS2U_FightCrytalInfo = 18467,
	MSG_GS2U_FightEndAccountInfo = 32764,
	MSG_GS2U_ForeverFightDelWall = 8572,
	MSG_GS2U_ForeverFightStart = 44349,
	MSG_GS2U_ResFightRankInfo = 62326,
	MSG_GS2U_ResForeverApplyInfo = 61441,
	MSG_GS2U_ResForeverFightMyInfo = 54951,
	MSG_U2GS_ReqApplyFight = 48350,
	MSG_U2GS_ReqCancelApplyFight = 25440,
	MSG_U2GS_ReqEntryFight = 57530,
	MSG_U2GS_ReqExitFight = 64302,
	MSG_U2GS_ReqFightRankInfo = 29114,
	MSG_U2GS_ReqForeverApplyInfo = 34669,
	MSG_U2GS_ReqForeverFightMainPanelInfo = 55560,
	MSG_U2GS_ReqGetDayRewardInfo = 54655,
--EndforeverFight

--Begin friend...
	MSG_GS2U_AddBlackFriendResult = 57285,
	MSG_GS2U_AddFriendResult = 26532,
	MSG_GS2U_AskTargetAddFriend = 24645,
	MSG_GS2U_LoadBlackFriendInfoList = 50243,
	MSG_GS2U_LoadFriendInfoList = 29536,
	MSG_GS2U_LoadTempFriendInfoList = 24368,
	MSG_GS2U_RecommendFriendResult = 60295,
	MSG_GS2U_RemoveBlackResult = 11836,
	MSG_GS2U_RemoveFriendResult = 7367,
	MSG_GS2U_SearchResult = 33889,
	MSG_U2GS_AddBlackFriendRequest = 51829,
	MSG_U2GS_AddFriendRequest = 5118,
	MSG_U2GS_BlackFriendInfoListRequest = 52688,
	MSG_U2GS_FriendInfoListRequest = 37455,
	MSG_U2GS_RecommendFriendRequest = 8872,
	MSG_U2GS_RemoveBlackRequest = 46870,
	MSG_U2GS_RemoveFriendRequest = 3051,
	MSG_U2GS_SearchRequest = 40137,
	MSG_U2GS_TempFriendInfoListRequest = 29631,
--Endfriend

--Begin gem...
	MSG_GS2U_DownGem = 33761,
	MSG_GS2U_GetAllGem = 50184,
	MSG_GS2U_OneDownGem = 7227,
	MSG_GS2U_UpGem = 8744,
	MSG_U2GS_DownGem = 38407,
	MSG_U2GS_GetAllGem = 30238,
	MSG_U2GS_OneDownGem = 39837,
	MSG_U2GS_UpGem = 58846,
--Endgem

--Begin growup...
	MSG_GS2U_GetGrowUpRewardSuccess = 46236,
	MSG_GS2U_GetHowToGrowUpRewardSuccess = 1905,
	MSG_GS2U_GrowUpInfoList = 39886,
	MSG_GS2U_GrowUpInfoRefresh = 45387,
	MSG_GS2U_HowToGrowUpRewardHaveGet = 22606,
	MSG_U2GS_GetGrowUpInfo = 64068,
	MSG_U2GS_GetGrowUpReward = 34249,
	MSG_U2GS_GetHowToGrowUpReward = 55268,
--Endgrowup

--Begin guild...
	MSG_GS2U_ApplyJoinGuildSuccess = 44329,
	MSG_GS2U_CanChangeGuildName = 25446,
	MSG_GS2U_ChangeGuildName = 61842,
	MSG_GS2U_ChangeNotice = 46512,
	MSG_GS2U_DeleteGuildId = 23483,
	MSG_GS2U_Donate = 35867,
	MSG_GS2U_DonateGuildNotice = 14208,
	MSG_GS2U_ExitGuild = 15445,
	MSG_GS2U_GetContributeGiftSuccess = 9428,
	MSG_GS2U_GuildActive = 39709,
	MSG_GS2U_GuildApplyList = 24457,
	MSG_GS2U_GuildApplyTipsInfo = 7897,
	MSG_GS2U_GuildBuildValue = 61286,
	MSG_GS2U_GuildCredit = 25068,
	MSG_GS2U_GuildLvInfo = 18855,
	MSG_GS2U_GuildMainInfoList = 26724,
	MSG_GS2U_GuildMemberJoin = 64119,
	MSG_GS2U_GuildMemberRankChange = 62785,
	MSG_GS2U_GuildMoneys = 10619,
	MSG_GS2U_GuildNowExp = 61386,
	MSG_GS2U_GuildRecordList = 28014,
	MSG_GS2U_GuildRecruit = 25775,
	MSG_GS2U_GuildTopInfo = 58616,
	MSG_GS2U_MemberList = 10808,
	MSG_GS2U_PlayerGuildInfo = 55548,
	MSG_GS2U_ReceivedInviteMsg = 52151,
	MSG_GS2U_SearchGuildFailed = 27408,
	MSG_GS2U_SearchGuildSuccess = 58936,
	MSG_GS2U_TadayDonateCount = 3801,
	MSG_GS2U_TadayGetSalaryCount = 56514,
	MSG_GS2U_UpOwnGuildLv = 53422,
	MSG_GS2U_ViewGuild = 52898,
	MSG_SetGuildAutoAgreeApply = 5750,
	MSG_U2GS_AgreeGuildRecruit = 26249,
	MSG_U2GS_ApplyJoinGuild = 35529,
	MSG_U2GS_ChangeGuildName = 42104,
	MSG_U2GS_ChangeNotice = 2658,
	MSG_U2GS_CreateGuild = 8957,
	MSG_U2GS_DealApplyJoinGuild = 34721,
	MSG_U2GS_DealInviteJoinGuild = 7918,
	MSG_U2GS_Donate = 48733,
	MSG_U2GS_ExitGuild = 61035,
	MSG_U2GS_GetContributeGift = 44513,
	MSG_U2GS_GetGuildTop = 7902,
	MSG_U2GS_GetSalary = 59014,
	MSG_U2GS_GuildRecruit = 47457,
	MSG_U2GS_InvitePlayerJoinGuild = 27549,
	MSG_U2GS_RequestGuildInfo = 49060,
	MSG_U2GS_SearchGuild = 11261,
	MSG_U2GS_SetGuildMemberRank = 10409,
	MSG_U2GS_UpOwnGuildLv = 9568,
	MSG_U2GS_ViewGuild = 32952,
	MSG_U2GS_WelcomeGuildMember = 24037,
--Endguild

--Begin guildCapital...
	MSG_GS2U_GCBattleAtkPlayer = 25157,
	MSG_GS2U_GCBattleClearingPanel = 61127,
	MSG_GS2U_GCBattleFlagAndFortBarbette = 64305,
	MSG_GS2U_GCGuildBattleCannonCD = 9949,
	MSG_GS2U_GCGuildBattleFlagOccupiedScore = 49373,
	MSG_GS2U_GCGuildBattleStartNotice = 39935,
	MSG_GS2U_GCGuildCapitalBattleFireResult = 6656,
	MSG_GS2U_GCSendBattleClearingDetailPanel = 20622,
	MSG_GS2U_GCSendGuildCapitalPanel = 48367,
	MSG_GS2U_GCSendGuildCapitalPersonalStatistics = 18848,
	MSG_GS2U_GCSendGuildRemainTime = 39768,
	MSG_GS2U_SendGuildCapitalGroup = 330,
	MSG_U2GS_GCGuildCapitalBattleFire = 57421,
	MSG_U2GS_GCGuildMapinfo = 4765,
	MSG_U2GS_GCSendBattleClearingDetailPanel = 3316,
	MSG_U2GS_GCSendGuildCapitalPanel = 43157,
	MSG_U2GS_GCSendGuildCapitalPersonalStatistics = 29970,
	MSG_U2GS_RequestGuildCapitalGroup = 8605,
--EndguildCapital

--Begin guildFight...
	MSG_GS2U_RspCampKill = 18438,
	MSG_GS2U_RspGetRew = 51253,
	MSG_GS2U_RspGuildKill = 39282,
	MSG_GS2U_RspPersonBoxDrop = 24286,
	MSG_GS2U_RspPersonKill = 46766,
	MSG_GS2U_RsplastFightInfo = 47417,
	MSG_GS2U_SendActiveInfo = 9072,
	MSG_GS2U_SendBossTime = 60414,
	MSG_GS2U_SynBossRemain = 30133,
	MSG_GS2U_SynBuff = 26363,
	MSG_GS2U_SynDieNum = 10666,
	MSG_GS2U_SynGuildMenberInfo = 1526,
	MSG_GS2U_SynKillBossNum = 58995,
	MSG_GS2U_SynKillMonster = 35720,
	MSG_GS2U_SynKillNum = 58108,
	MSG_GS2U_SynOpenBoxNum = 41073,
	MSG_GS2U_SynRemainBoxNum = 1811,
	MSG_U2GS_ReqActiveInfo = 5396,
	MSG_U2GS_ReqCampDayKill = 39129,
	MSG_U2GS_ReqCampForeverKill = 26960,
	MSG_U2GS_ReqEnter = 64492,
	MSG_U2GS_ReqGetRew = 9310,
	MSG_U2GS_ReqGuildDayKill = 51011,
	MSG_U2GS_ReqGuildForeverKill = 23386,
	MSG_U2GS_ReqLastFightInfo = 18604,
	MSG_U2GS_ReqPersonBoxDrop = 45553,
	MSG_U2GS_ReqPersonDayKill = 14921,
	MSG_U2GS_ReqPersonForeverKill = 39360,
--EndguildFight

--Begin guildactive...
	MSG_GS2U_DartHpPer = 19334,
	MSG_GS2U_DartInfo = 46901,
	MSG_GS2U_DartProgress = 45452,
	MSG_GS2U_GuildBossEndBroadCast = 16958,
	MSG_GS2U_GuildBossLinkBroadCast = 56935,
	MSG_GS2U_GuildFastOverTaskSuccess = 127,
	MSG_GS2U_GuildRefBoss = 43921,
	MSG_GS2U_GuildRingReward = 29218,
	MSG_GS2U_GuildSingleRaidReadtTime = 430,
	MSG_GS2U_GuildTaskInfo = 23746,
	MSG_GS2U_GuildTreeData = 10391,
	MSG_GS2U_GuildTreeEnd = 49086,
	MSG_GS2U_GuildTreeGrowUpEnd = 58892,
	MSG_GS2U_GuildTreeKillMonsterNum = 52947,
	MSG_GS2U_GuildTreeStart = 43105,
	MSG_GS2U_OpenDartTips = 46853,
	MSG_GS2U_OverDart = 54103,
	MSG_GS2U_SendGuildBossCopyMapPanel = 37877,
	MSG_GS2U_SendGuildBossPanel = 33704,
	MSG_GS2U_ShowOneInDart = 43497,
	MSG_U2GS_EnterGuildSingleRaid = 32227,
	MSG_U2GS_EnterGuildStation = 3083,
	MSG_U2GS_EnterTheDart = 61526,
	MSG_U2GS_GuildFastOverTask = 47954,
	MSG_U2GS_OpenGuildBoss = 58988,
	MSG_U2GS_OpenTheDart = 21260,
	MSG_U2GS_ReqSubmitGuildTreeItem = 58444,
	MSG_U2GS_RequestGuildRingReward = 20561,
	MSG_U2GS_RequestGuildTaskInfo = 6745,
	MSG_U2GS_RequestStartGuildRingTask = 37907,
	MSG_U2GS_SendGuildBossPanel = 25418,
	MSG_U2GS_SendGuildIdForSecond = 57029,
--Endguildactive

--Begin head...
	MSG_GS2U_ActiveHeadSuccess = 17837,
	MSG_GS2U_ActiveHonorSuccess = 44971,
	MSG_GS2U_ActiveTitleSuccess = 35857,
	MSG_GS2U_HeadChange = 45848,
	MSG_GS2U_HeadList = 27822,
	MSG_GS2U_TitleList = 16438,
	MSG_U2GS_ActiveHead = 51656,
	MSG_U2GS_ActiveHonor = 35142,
	MSG_U2GS_ActiveTitle = 39000,
	MSG_U2GS_HeadList = 34624,
	MSG_U2GS_SetHead = 59232,
	MSG_U2GS_SetTitle = 61856,
	MSG_U2GS_TitleList = 62028,
--Endhead

--Begin landreward...
	MSG_GS2U_DayRechargeRewardInfo = 15864,
	MSG_GS2U_GetDayRechargeRewardSuccess = 61135,
	MSG_GS2U_GetTotalRechargeRewardSuccess = 39587,
	MSG_GS2U_LandItemsInfo = 39147,
	MSG_GS2U_LastGetTime_reward = 64249,
	MSG_GS2U_RespOffLineEXP = 22994,
	MSG_GS2U_SendOffLineTime = 3928,
	MSG_GS2U_TotalRechargeRewardInfo = 43076,
	MSG_U2GS_GetDayRechargeReward = 32094,
	MSG_U2GS_GetOffLineEXP = 33366,
	MSG_U2GS_GetTime_reward = 4073,
	MSG_U2GS_GetTotalRechargeReward = 4842,
--Endlandreward

--Begin levelreward...
	MSG_GS2U_BuyOrGetGrowUpFundSucc = 35614,
	MSG_GS2U_GetLevelRewardSuccess = 31086,
	MSG_GS2U_GetServerAllFundRewardSucc = 43186,
	MSG_GS2U_GrowUpFundVectorInfo = 42932,
	MSG_GS2U_LevelItemsInfo = 1722,
	MSG_U2GS_BuyGrowUpFund = 8155,
	MSG_U2GS_GetGrowUpFundReward = 4714,
	MSG_U2GS_GetLevelReward = 32635,
	MSG_U2GS_GetServerAllFundReward = 23538,
	MSG_U2GS_ReqGrowUpFundInfo = 40125,
--Endlevelreward

--Begin lookother...
	MSG_GS2U_LookOtherMountInfo = 39782,
	MSG_GS2U_LookOtherPetInfo = 33180,
	MSG_GS2U_LookOtherPlayerInfo = 24584,
	MSG_GS2U_LookOtherSoulInfo = 7698,
	MSG_GS2U_LookOtherWingInfo = 7854,
	MSG_U2GS_LookOther = 39655,
--Endlookother

--Begin mail...
	MSG_GS2U_AddMailInfo = 5690,
	MSG_GS2U_DeleteMail = 14274,
	MSG_GS2U_DeleteMailAttachment = 54573,
	MSG_GS2U_MailDetail = 1596,
	MSG_GS2U_MailInfo = 3365,
	MSG_U2GS_DeleteMail = 46884,
	MSG_U2GS_GetMailAttachment = 13358,
	MSG_U2GS_ReadMail = 24463,
--Endmail

--Begin mall...
	MSG_GS2U_ItemSellPrice = 39760,
	MSG_GS2U_MallBuySuccess = 18673,
	MSG_GS2U_MallInfoList = 48388,
	MSG_GS2U_MallPriceList = 23547,
	MSG_GS2U_ServerBuyNum = 1063,
	MSG_U2GS_GetItemSellPrice = 4496,
	MSG_U2GS_ItemBuyRequest = 57190,
	MSG_U2GS_MallInfo = 33516,
--Endmall

--Begin master...
	MSG_GS2U_ResponseMasterTask = 34484,
	MSG_GS2U_ResponseMasterTaskList = 22014,
	MSG_GS2U_ResponseMasterTaskReward = 41475,
	MSG_U2GS_AcceptMasterTask = 43405,
	MSG_U2GS_ImmediatelyCompleteMasterTask = 54264,
	MSG_U2GS_RefreshMasterTaskList = 49274,
	MSG_U2GS_RequestMasterTaskList = 51938,
	MSG_U2GS_RequestMasterTaskReward = 5767,
--Endmaster

--Begin minorlv...
	MSG_GS2U_GetMinorlvInfo = 36339,
	MSG_GS2U_MinorlvDownSucc = 27755,
	MSG_GS2U_MinorlvEquipSucc = 12763,
	MSG_GS2U_MinorlvItemsActive = 44151,
	MSG_GS2U_MinorlvRoteScaleSuc = 27028,
	MSG_GS2U_MinorlvZoneDeleteMessageSuc = 62396,
	MSG_GS2U_MinorlvZoneInfo = 13513,
	MSG_GS2U_MinorlvZoneLeaveMessageSuc = 63394,
	MSG_GS2U_MinorlvZoneVoteAndAddGiftSuc = 25730,
	MSG_U2GS_GetMinorlvInfo = 15477,
	MSG_U2GS_MinorlvDownDecoration = 14863,
	MSG_U2GS_MinorlvEquipDecoration = 49547,
	MSG_U2GS_MinorlvZoneAddGiftNum = 63490,
	MSG_U2GS_MinorlvZoneDeleteMessage = 37979,
	MSG_U2GS_MinorlvZoneLeaveMessage = 6305,
	MSG_U2GS_MinorlvZoneReq = 193,
	MSG_U2GS_MinorlvZoneVote = 22887,
	MSG_U2GS_SetMinorlvRoteScale = 33037,
--Endminorlv

--Begin moneytree...
	MSG_GS2U_MoneyShakeShowType = 65365,
	MSG_GS2U_TodayMoneyShakeNum = 50311,
	MSG_U2GS_MoneyShake = 53172,
	MSG_U2GS_TodayMoneyShakeNum = 42025,
--Endmoneytree

--Begin multiplefight...
	MSG_GS2U_MultipleCopyHarmList = 42771,
	MSG_U2GS_MultipleCopyHarmList = 9733,
--Endmultiplefight

--Begin newmount...
	MSG_GS2U_GetAllMount = 13818,
	MSG_GS2U_MountUpDegreeChange = 6004,
	MSG_GS2U_MountUpDown = 48090,
	MSG_GS2U_MountUpQualitySucc = 47117,
	MSG_GS2U_MountUpStar = 41022,
	MSG_GS2U_MountUpStarOnKey = 41918,
	MSG_GS2U_NoticeAddMount = 58884,
	MSG_GS2U_ReturnMountUpDegree = 59224,
	MSG_U2GS_ActiveNewMount = 60193,
	MSG_U2GS_GetAllMount = 5504,
	MSG_U2GS_MountUpDegree = 6166,
	MSG_U2GS_MountUpDown = 39776,
	MSG_U2GS_MountUpQuality = 29405,
	MSG_U2GS_MountUpStar = 32708,
--Endnewmount

--Begin newtask...
	MSG_CollectSuccess = 3177,
	MSG_GS2U_BreakCollect = 63871,
	MSG_GS2U_GetAllTask = 33056,
	MSG_GS2U_NoticeAccpetOrCompleteTask = 50244,
	MSG_GS2U_SubmitTask = 39077,
	MSG_U2GS_BeginCollect = 56307,
	MSG_U2GS_ChoosePetTask = 54223,
	MSG_U2GS_GetAllTask = 130,
	MSG_U2GS_SetCompleteDialogue = 20053,
	MSG_U2GS_SubmitTask = 6151,
--Endnewtask

--Begin pet...
	MSG_GS2U_ActivePetEquipSuccess = 13720,
	MSG_GS2U_AllPetesBaseInfo = 53571,
	MSG_GS2U_ChangeMainViceSuccess = 77,
	MSG_GS2U_NoticeAddPet = 42010,
	MSG_GS2U_NoticePlayerPetExp = 9031,
	MSG_GS2U_NoticeRemovePet = 29555,
	MSG_GS2U_PetAllInfo = 12772,
	MSG_GS2U_PetChangedFight = 6163,
	MSG_GS2U_PetFight = 34769,
	MSG_GS2U_PetHoleOpenPractice = 72,
	MSG_GS2U_PetHoleUpDegreeResult = 22771,
	MSG_GS2U_PetModifyName = 11536,
	MSG_GS2U_PetNormalInheritSuccess = 47118,
	MSG_GS2U_PetPerfectInheritSuccess = 44942,
	MSG_GS2U_PetPracticeResult = 49299,
	MSG_GS2U_PetSetMainFight = 62124,
	MSG_GS2U_PetUpDegreeSuccess = 64197,
	MSG_GS2U_PetUpResult = 13064,
	MSG_GS2U_PetUpStarResult = 50969,
	MSG_GS2U_ReplacePetPracticeSuccess = 36633,
	MSG_U2GS_ActivePetEquip = 22297,
	MSG_U2GS_ChangeMainVice = 56008,
	MSG_U2GS_GetPetAllInfo = 5284,
	MSG_U2GS_PetFeed = 26127,
	MSG_U2GS_PetFight = 41571,
	MSG_U2GS_PetFlyToMaster = 6283,
	MSG_U2GS_PetHoleUpDegree = 52908,
	MSG_U2GS_PetModifyName = 25478,
	MSG_U2GS_PetNormalInherit = 16299,
	MSG_U2GS_PetPerfectInherit = 60975,
	MSG_U2GS_PetPractice = 8172,
	MSG_U2GS_PetSetMainFight = 42386,
	MSG_U2GS_PetUp = 14896,
	MSG_U2GS_PetUpDegree = 51380,
	MSG_U2GS_PetUpStar = 5426,
	MSG_U2GS_RemovePet = 46813,
	MSG_U2GS_ReplacePetPractice = 35852,
--Endpet

--Begin player...
	MSG_Any_ChangeMap = 51801,
	MSG_Any_PlayerLogout = 1702,
	MSG_C2S_ChangeMap = 45297,
	MSG_GS2U_AllBattleProp = 46744,
	MSG_GS2U_AngerValue = 5154,
	MSG_GS2U_BattlePropList = 28245,
	MSG_GS2U_BlockStatusChange = 4623,
	MSG_GS2U_BroadCastJump = 51339,
	MSG_GS2U_BroadcastDisapear = 45334,
	MSG_GS2U_BroadcastMonsterHpPC = 65080,
	MSG_GS2U_BroadcastPlayerHpPC = 54157,
	MSG_GS2U_BroadcastPlayerRevive = 17135,
	MSG_GS2U_BroadcastVisibleEquipOff = 46672,
	MSG_GS2U_BroadcastVisibleEquipOn = 42110,
	MSG_GS2U_ChangeCamp = 20809,
	MSG_GS2U_ChangeNameResult = 47012,
	MSG_GS2U_ChatVoiceKey = 14493,
	MSG_GS2U_Chatinfo = 39394,
	MSG_GS2U_CreatePlayerResult = 45054,
	MSG_GS2U_CrossServerBuffList = 9420,
	MSG_GS2U_DeletePlayerResult = 39385,
	MSG_GS2U_FightPoint = 41304,
	MSG_GS2U_GatherNextCanCollectTime = 30545,
	MSG_GS2U_HeartBeatAck = 30981,
	MSG_GS2U_KickOutTip = 38711,
	MSG_GS2U_KillingValueChange = 12529,
	MSG_GS2U_LoginLineUpNum = 11622,
	MSG_GS2U_LoginResult = 22162,
	MSG_GS2U_LookInfoPlayer = 18166,
	MSG_GS2U_MapLine = 30932,
	MSG_GS2U_MissionObjectGatherIdes = 18671,
	MSG_GS2U_MissionObjectList = 59133,
	MSG_GS2U_MonsterChangeState = 42163,
	MSG_GS2U_MonsterList = 32656,
	MSG_GS2U_MoveInfo = 58171,
	MSG_GS2U_NpcList = 639,
	MSG_GS2U_OffLineMsgList = 27200,
	MSG_GS2U_OpenSystem = 35833,
	MSG_GS2U_PetList = 18025,
	MSG_GS2U_PlayerAddExp = 47341,
	MSG_GS2U_PlayerBaseInfo = 25296,
	MSG_GS2U_PlayerChangedWealth = 15512,
	MSG_GS2U_PlayerHp = 38317,
	MSG_GS2U_PlayerLevelUp = 65190,
	MSG_GS2U_PlayerRevive = 42726,
	MSG_GS2U_RespChatVoice = 2670,
	MSG_GS2U_RespChatVoiceError = 2854,
	MSG_GS2U_RespDayBuyInfo = 22864,
	MSG_GS2U_RespDayBuyReward = 37557,
	MSG_GS2U_RespTurnPlateInfo = 58071,
	MSG_GS2U_RespTurnPlateReward = 43604,
	MSG_GS2U_ResponseNextMenu = 27399,
	MSG_GS2U_SelPlayerResult = 42464,
	MSG_GS2U_ServerTimeZone = 27152,
	MSG_GS2U_StopMove = 35067,
	MSG_GS2U_TakeBackPet = 36481,
	MSG_GS2U_TipsString = 5369,
	MSG_GS2U_TransferNewPos = 22727,
	MSG_GS2U_UserPlayerList = 18582,
	MSG_U2GS_CancelEnterMap = 52752,
	MSG_U2GS_ChangeMapLine = 10342,
	MSG_U2GS_ChangeName = 43873,
	MSG_U2GS_ChatInfo = 21140,
	MSG_U2GS_ChatVoice = 15792,
	MSG_U2GS_ChatVoiceKey = 36175,
	MSG_U2GS_CheckEntity = 62701,
	MSG_U2GS_DigTransferMap = 61093,
	MSG_U2GS_EnteredMap = 30475,
	MSG_U2GS_Feedback = 62331,
	MSG_U2GS_HeartBeat = 39242,
	MSG_U2GS_HeartBeatReal = 33460,
	MSG_U2GS_Jump = 5620,
	MSG_U2GS_LeaveBlock = 12636,
	MSG_U2GS_MoveTo = 1578,
	MSG_U2GS_Photo = 56720,
	MSG_U2GS_ReqChatVoice = 41242,
	MSG_U2GS_ReqDayBuyReward = 63385,
	MSG_U2GS_ReqTurnPlateInfo = 59971,
	MSG_U2GS_ReqTurnPlateReward = 20128,
	MSG_U2GS_RequestChangeCamp = 36878,
	MSG_U2GS_RequestCreatePlayer = 4022,
	MSG_U2GS_RequestDeletePlayer = 23657,
	MSG_U2GS_RequestLogin = 56084,
	MSG_U2GS_RequestMapLine = 18211,
	MSG_U2GS_RequestNextMenu = 63243,
	MSG_U2GS_RequestPlayerBaseInfo = 33893,
	MSG_U2GS_RequestRevive = 60126,
	MSG_U2GS_RequestReviveCost = 52607,
	MSG_U2GS_SelPlayerEnterGame = 56497,
	MSG_U2GS_StopMove = 41869,
	MSG_U2GS_UseActiveCode = 37548,
--Endplayer

--Begin practive...
	MSG_GS2U_RequestRank = 37075,
	MSG_U2GS_RequestPracticeTime = 48065,
	MSG_U2GS_SendMapId = 51405,
--Endpractive

--Begin preach...
	MSG_GS2U_PreachBegin = 15034,
	MSG_GS2U_PreachEXP = 29206,
	MSG_GS2U_PreachSynTime = 23742,
	MSG_GS2U_RespInspireCount = 48785,
	MSG_U2GS_PlayerEntered = 53552,
	MSG_U2GS_ReqInspireCount = 9077,
--Endpreach

--Begin rank...
	MSG_GS2U_OwnTop = 28763,
	MSG_GS2U_RankInfoList = 30096,
	MSG_U2GS_RequestRankInfo = 2147,
--Endrank

--Begin recharge...
	MSG_GS2U_AppRechargeInfo = 19398,
	MSG_GS2U_FirstRechargeInfo = 22441,
	MSG_U2GS_FirstRechargeInfo = 2175,
--Endrecharge

--Begin reconnect...
	MSG_GS2U_ReconnectResult = 65348,
	MSG_GS2U_ReconnectToken = 31346,
	MSG_U2GS_Reconnect = 58037,
	MSG_U2GS_SetReconnectTokenSuccess = 1317,
--Endreconnect

--Begin recover...
	MSG_GS2U_RecoverInfoSuccess = 21921,
	MSG_GS2U_RecoverLastNoActiveInfo = 23219,
	MSG_U2GS_LastNoActiveInfo = 37013,
	MSG_U2GS_RecoverInfo = 25096,
--Endrecover

--Begin redpackets...
	MSG_GS2U_GetRedpacketsSuccess = 20255,
	MSG_GS2U_GiveRedpacketsSuccess = 59717,
	MSG_GS2U_NewRedpackets = 12454,
	MSG_GS2U_RedpacketsAllGet = 23363,
	MSG_GS2U_RedpacketsList = 34876,
	MSG_GS2U_ViewRedpackets = 28575,
	MSG_U2GS_GetRedpackets = 7890,
	MSG_U2GS_GiveRedpackets = 60381,
	MSG_U2GS_RedpacketsList = 14014,
	MSG_U2GS_ViewRedpackets = 7713,
--Endredpackets

--Begin setting...
	MSG_GS2U_ServerSwitch = 54439,
	MSG_GS2U_WorldLv = 4520,
--Endsetting

--Begin shop...
	MSG_GS2U_FlushShop = 1646,
	MSG_GS2U_ForeverFriendValue = 44000,
	MSG_GS2U_GetShop = 36064,
	MSG_GS2U_GetShopStatus = 6454,
	MSG_GS2U_ShopBuyNormal = 23387,
	MSG_GS2U_ShopBuySpacial = 34501,
	MSG_U2GS_FlushShop = 47236,
	MSG_U2GS_ForeverFriendValue = 35714,
	MSG_U2GS_GetShop = 40710,
	MSG_U2GS_GetShopStatus = 20396,
	MSG_U2GS_ShopBuy = 18490,
--Endshop

--Begin signin...
	MSG_GS2U_OnlineSignInfo = 29318,
	MSG_GS2U_SignDaysSuccess = 22123,
	MSG_GS2U_SignInfo = 52851,
	MSG_U2GS_RequestSignInfo = 10416,
	MSG_U2GS_SignDays = 5266,
--Endsignin

--Begin singleTower...
	MSG_GS2U_FightEnd = 28899,
	MSG_GS2U_GiveDayReward = 38074,
	MSG_GS2U_RespAllTowerInfo = 14690,
	MSG_GS2U_SingleTowerAtkNum = 58387,
	MSG_GS2U_SingleTowerSynchrTime = 9747,
	MSG_U2GS_GetDayReward = 33255,
	MSG_U2GS_JointTower = 42321,
	MSG_U2GS_ReqAllTowerInfo = 40518,
--EndsingleTower

--Begin skill...
	MSG_GS2U_ActivatedSkillSuccess = 491,
	MSG_GS2U_RemoveTempSkill = 4393,
	MSG_GS2U_SetSkillSuccess = 5852,
	MSG_GS2U_SkillInfoList = 15045,
	MSG_GS2U_TempSkillAddList = 38634,
	MSG_GS2U_UpSkillSuccess = 63049,
	MSG_U2GS_ActivatedSkill = 49922,
	MSG_U2GS_SetSkill = 34869,
	MSG_U2GS_upSkill = 25536,
--Endskill

--Begin soul...
	MSG_GS2U_AddSoulId = 43703,
	MSG_GS2U_ChallengeCircleCoolTime = 60757,
	MSG_GS2U_ChallengeCircleTowerFailed = 7071,
	MSG_GS2U_SoulEquip = 37397,
	MSG_GS2U_SoulInfo = 313,
	MSG_U2GS_ChallengeCircleTower = 17520,
	MSG_U2GS_SoulEquip = 17451,
	MSG_U2GS_SoulInfo = 7115,
--Endsoul

--Begin team...
	MSG_GS2U_AddTeamMemberInfo = 40018,
	MSG_GS2U_ApplyList = 20776,
	MSG_GS2U_AutoAgreeApply = 23545,
	MSG_GS2U_CancelMatching = 1783,
	MSG_GS2U_ChangeTarget = 65357,
	MSG_GS2U_ChangedLeader = 52189,
	MSG_GS2U_DelTeammateInfo = 24383,
	MSG_GS2U_InviteFollow = 28554,
	MSG_GS2U_LearderInviteEnterMap = 29880,
	MSG_GS2U_Matching = 63045,
	MSG_GS2U_MemberDealInviteEnterMap = 8579,
	MSG_GS2U_MemberHpChange = 2762,
	MSG_GS2U_MiniMapMemberInfo = 53845,
	MSG_GS2U_NotFolowLeader = 25845,
	MSG_GS2U_ReceiveApplyInfo = 45149,
	MSG_GS2U_ReceiveInviteInfo = 15498,
	MSG_GS2U_RemoveWorldPropaganda = 4537,
	MSG_GS2U_ReturnCopyNum = 7793,
	MSG_GS2U_ReturnTeamCopyNum = 62312,
	MSG_GS2U_SetFollow = 43567,
	MSG_GS2U_TeamInfo = 55031,
	MSG_GS2U_TeamList = 36615,
	MSG_GS2U_TeamMemberFight = 39669,
	MSG_GS2U_TeamMemberOffline = 63632,
	MSG_GS2U_TeamMemberOnline = 17622,
	MSG_GS2U_ViewTeam = 27554,
	MSG_GS2U_WorldPropaganda = 21089,
	MSG_U2GS_AckInviteTeam = 42781,
	MSG_U2GS_CancelMatching = 46457,
	MSG_U2GS_ChangeTarget = 21503,
	MSG_U2GS_FollowLeader = 14040,
	MSG_U2GS_GetMiniMapMemberInfo = 52373,
	MSG_U2GS_LeaveAwayTeam = 63768,
	MSG_U2GS_Matching = 4311,
	MSG_U2GS_MemberDealInviteEnterMap = 53397,
	MSG_U2GS_OperateTeam = 8639,
	MSG_U2GS_RequestInviteList = 47904,
	MSG_U2GS_RequestPlayerCopyNum = 34935,
	MSG_U2GS_RequestTeamCopyNum = 25391,
	MSG_U2GS_RequestTeamList = 59716,
	MSG_U2GS_SetAutoAgreeApply = 51157,
	MSG_U2GS_SetAutoAgreeInvite = 60758,
	MSG_U2GS_SetFollow = 23621,
	MSG_U2GS_TeamMemberFight = 19931,
	MSG_U2GS_ViewTeam = 34356,
	MSG_U2GS_WorldPropaganda = 1351,
--Endteam

--Begin townDemonTower...
	MSG_GS2U_GetTowerHurtRank = 51666,
	MSG_GS2U_NextFloorCountDown = 57548,
	MSG_GS2U_NoticeCurrentFloor = 33911,
	MSG_GS2U_NoticeTowerBossHP = 58022,
	MSG_GS2U_NoticeTowerResidueTime = 46587,
	MSG_GS2U_NoticeTowerResult = 19886,
	MSG_U2GS_GetTowerHurtRank = 35492,
--EndtownDemonTower

--Begin trade...
	MSG_GS2U_BuyTradeItemFail = 4707,
	MSG_GS2U_BuyTradeItemSuccess = 38542,
	MSG_GS2U_DownTradeItemSuccess = 61290,
	MSG_GS2U_OwnUpTradeItem = 5602,
	MSG_GS2U_SelectTradeItemList = 27905,
	MSG_GS2U_TradeItemListReturn = 7597,
	MSG_GS2U_UpTradeItemSuccess = 32127,
	MSG_U2GS_BuyTradeItem = 30476,
	MSG_U2GS_DownTradeItem = 19491,
	MSG_U2GS_RequestOwnUpTrade = 54032,
	MSG_U2GS_RequestTradeItemList = 54468,
	MSG_U2GS_SelectTradeItemList = 22855,
	MSG_U2GS_UpTradeItem = 28930,
--Endtrade

--Begin vip...
	MSG_GS2U_BuyVipSpecialItemSuccess = 41258,
	MSG_GS2U_GetVipLevelGiftSuccess = 30150,
	MSG_GS2U_MonthCardDayRewardSuccess = 19936,
	MSG_GS2U_MonthCardInfo = 63914,
	MSG_GS2U_VipBuyCount = 59554,
	MSG_GS2U_VipBuyCountList = 34252,
	MSG_GS2U_VipInfo = 2079,
	MSG_GS2U_VipInfoExp = 4982,
	MSG_U2GS_BuyVipSpecialItem = 42947,
	MSG_U2GS_GetVipLevelGift = 64615,
	MSG_U2GS_MonthCardDayReward = 8081,
	MSG_U2GS_RequestVipInfo = 54894,
	MSG_U2GS_VipBuyCount = 51240,
--Endvip

--Begin wing...
	MSG_GS2U_BroadCastWinglv = 34246,
	MSG_GS2U_ReturnWingUpDegree = 51667,
	MSG_GS2U_ReturnWingUpQuality = 40273,
	MSG_GS2U_WingInfo = 469,
	MSG_GS2U_WingUpFailed = 38135,
	MSG_GS2U_WingUpSuccess = 62397,
	MSG_U2GS_RequestWingInfo = 23570,
	MSG_U2GS_RequestWingUpDegree = 54007,
	MSG_U2GS_RequestWingUpQuality = 21808,
	MSG_U2GS_WingHole = 38805,
	MSG_U2GS_WingUp = 56280,
--Endwing

--Begin world...
--Endworld--END message id define



	--Begin achievement...
	[11034] = MSG_achievement.GS2U_AchievementFinish,
	[24225] = MSG_achievement.GS2U_AchievementInfo,
	[48892] = MSG_achievement.GS2U_GetAchievementReward,
	[39744] = MSG_achievement.GS2U_GetGrowupAchStarRewardSuccess,
	[47018] = MSG_achievement.GS2U_GrowupAchInfo,
	[4487] = MSG_achievement.U2GS_AchievementInfo,
	[15854] = MSG_achievement.U2GS_GetAchievementReward,
	[10449] = MSG_achievement.U2GS_GetGrowupAchStarReward,
	[60960] = MSG_achievement.U2GS_GrowupAchInfo,
	--Endachievement

	--Begin acupoint...
	[529] = MSG_acupoint.GS2U_AcupointInfoList,
	[46761] = MSG_acupoint.GS2U_UpAcupointInfoSuccess,
	[50121] = MSG_acupoint.U2GS_AcupointInfo,
	[40604] = MSG_acupoint.U2GS_UpAcupointInfo,
	--Endacupoint

	--Begin arena...
	[18275] = MSG_arena.GS2U_BattleTargetList,
	[16778] = MSG_arena.GS2U_ChallengeBegin,
	[47634] = MSG_arena.GS2U_ChallengeFinish,
	[16303] = MSG_arena.GS2U_DefenseSkillList,
	[51292] = MSG_arena.GS2U_GetDuanRewardSuccess,
	[43577] = MSG_arena.GS2U_GetTopRewardSuccess,
	[61991] = MSG_arena.GS2U_JJC4v4BattleHp,
	[65165] = MSG_arena.GS2U_JJC4v4MatchSuccess,
	[46827] = MSG_arena.GS2U_JJC4v4OverIsWin,
	[62247] = MSG_arena.GS2U_JJC4v4PlayeAdd,
	[37758] = MSG_arena.GS2U_JJC4v4PlayeRemove,
	[43163] = MSG_arena.GS2U_RecordList,
	[16385] = MSG_arena.GS2U_RequestChallengeResult,
	[4258] = MSG_arena.GS2U_RewardValue,
	[361] = MSG_arena.GS2U_TopThree,
	[61452] = MSG_arena.U2GS_ChallengeBegin,
	[55838] = MSG_arena.U2GS_ChallengeTarget,
	[45209] = MSG_arena.U2GS_GetDuanReward,
	[44156] = MSG_arena.U2GS_GetTopReward,
	[2452] = MSG_arena.U2GS_JJC4v4LockBattle,
	[25214] = MSG_arena.U2GS_JJC4v4Matching,
	[15974] = MSG_arena.U2GS_RefreshTarget,
	[56128] = MSG_arena.U2GS_RequestBattleTargetList,
	[14946] = MSG_arena.U2GS_RequestDefenseSkill,
	[43766] = MSG_arena.U2GS_RequestRecord,
	[42849] = MSG_arena.U2GS_RequestRewardValue,
	[23462] = MSG_arena.U2GS_RequestTopThree,
	[2539] = MSG_arena.U2GS_SetDefenseSkillList,
	--Endarena

	--Begin backendactivity...
	[44229] = MSG_backendactivity.GS2U_BackendActivityList,
	[34025] = MSG_backendactivity.GS2U_CommonExpense,
	[17138] = MSG_backendactivity.GS2U_CommonRecharge,
	[24138] = MSG_backendactivity.GS2U_ContinuousRecharge,
	[14769] = MSG_backendactivity.GS2U_DayBuyActivity,
	[28560] = MSG_backendactivity.GS2U_ExchangeActivityInfo,
	[2686] = MSG_backendactivity.GS2U_GetBackendActivitySuccess,
	[39991] = MSG_backendactivity.GS2U_GroupBuy,
	[2350] = MSG_backendactivity.GS2U_LoginActivityInfo,
	[3216] = MSG_backendactivity.GS2U_MultiActivity,
	[60871] = MSG_backendactivity.GS2U_NewBackendActivity,
	[43211] = MSG_backendactivity.U2GS_GetBackendActivity,
	[2388] = MSG_backendactivity.U2GS_RequestBackendActivityInfo,
	[49508] = MSG_backendactivity.U2GS_RequestBackendActivityList,
	[51751] = MSG_backendactivity.U2GS_RequestMultiActivity,
	--Endbackendactivity

	--Begin bagItem...
	[4407] = MSG_bagItem.GS2U_ExpMedRateChange,
	[51706] = MSG_bagItem.GS2U_ExpMedRateDelete,
	[22709] = MSG_bagItem.GS2U_ExpMedRateList,
	[43474] = MSG_bagItem.GS2U_GirlBlessValueChange,
	[25237] = MSG_bagItem.GS2U_GirlBlessValueDelete,
	[59096] = MSG_bagItem.GS2U_GirlBlessValueList,
	[61935] = MSG_bagItem.GS2U_ISMoveItemNeedKey,
	[2251] = MSG_bagItem.GS2U_InitBagItem,
	[3266] = MSG_bagItem.GS2U_InitCellInfoList,
	[22975] = MSG_bagItem.GS2U_ItemGroupReaminCount,
	[13063] = MSG_bagItem.GS2U_RemoveItem,
	[28587] = MSG_bagItem.GS2U_UIGetItemInfo,
	[61520] = MSG_bagItem.GS2U_UpdateItem,
	[51505] = MSG_bagItem.MsgMoveItem,
	[65377] = MSG_bagItem.MsgOpenCell,
	[20133] = MSG_bagItem.U2GS_IsMoveItemNeedKey,
	[54631] = MSG_bagItem.U2GS_SellItem,
	[21314] = MSG_bagItem.U2GS_SetStoreKey,
	[41032] = MSG_bagItem.U2GS_SortBag,
	[42322] = MSG_bagItem.U2GS_UseBagItem,
	[2964] = MSG_bagItem.U2GS_UseBagItemToObject,
	--EndbagItem

	--Begin battle...
	[36467] = MSG_battle.C2S_PlayerUseShiftSkill,
	[38338] = MSG_battle.C2S_PlayerUseSkill,
	[10740] = MSG_battle.GS2U_AttackOffsetEffect,
	[17141] = MSG_battle.GS2U_AttackResult,
	[5224] = MSG_battle.GS2U_AttackResultEx,
	[29613] = MSG_battle.GS2U_BattleHpRecoverResult,
	[51286] = MSG_battle.GS2U_BreakSkill,
	[64141] = MSG_battle.GS2U_ChangeBattleFieldId,
	[33613] = MSG_battle.GS2U_ChangeFightState,
	[63438] = MSG_battle.GS2U_ChangeOwnerId,
	[24104] = MSG_battle.GS2U_Dead,
	[7586] = MSG_battle.GS2U_FixPlayerHp,
	[52551] = MSG_battle.GS2U_ForceDeadNow,
	[37689] = MSG_battle.GS2U_MonsterSpeed,
	[25938] = MSG_battle.GS2U_PkValue,
	[33757] = MSG_battle.GS2U_PlayerDead,
	[27775] = MSG_battle.GS2U_SprintFailed,
	[4607] = MSG_battle.GS2U_UseSkillFailed,
	[48800] = MSG_battle.GS2U_UseSkillToObject,
	[29375] = MSG_battle.GS2U_UseSkillToPos,
	[17467] = MSG_battle.GS2U_UseSpeSkillSuccess,
	[55094] = MSG_battle.U2GS_BattleHpRecover,
	[17439] = MSG_battle.U2GS_ChangeFightState,
	[36242] = MSG_battle.U2GS_GetPkValue,
	--Endbattle

	--Begin buff...
	[62410] = MSG_buff.GS2U_BuffHurt,
	[22917] = MSG_buff.GS2U_BuffHurtEx,
	[43249] = MSG_buff.GS2U_BuffInfo,
	[54287] = MSG_buff.GS2U_RemoveBuff,
	--Endbuff

	--Begin calltogether...
	[6236] = MSG_calltogether.GS2U_ReturnCallTogether,
	[37582] = MSG_calltogether.U2GS_AgreeCallTogether,
	[8577] = MSG_calltogether.U2GS_RequestCallTogether,
	--Endcalltogether

	--Begin camp...
	[43568] = MSG_camp.GS2U_BordCampBossDeadBord,
	[14341] = MSG_camp.GS2U_BordCampBossHp,
	[46925] = MSG_camp.GS2U_CampDartBossBlood,
	[32010] = MSG_camp.GS2U_CampDartKill,
	[5194] = MSG_camp.GS2U_CampIsCanBanTalk,
	[12903] = MSG_camp.GS2U_CampTaskNumber,
	[34102] = MSG_camp.GS2U_CampWarBossBlood,
	[33101] = MSG_camp.GS2U_CampWarKill,
	[20885] = MSG_camp.GS2U_CampWarMonsDeadStateList,
	[59973] = MSG_camp.GS2U_CampWarProcessResponse,
	[31432] = MSG_camp.GS2U_CampWarRankResponse,
	[49680] = MSG_camp.GS2U_CampWarResult,
	[16222] = MSG_camp.GS2U_ExploitValue,
	[15830] = MSG_camp.GS2U_RespCampDartBossPosition,
	[43002] = MSG_camp.GS2U_ReturnCampLeader,
	[63122] = MSG_camp.GS2U_ReturnCampTypeId,
	[13065] = MSG_camp.GS2U_TadayCampSalaryCount,
	[13395] = MSG_camp.GS2U_campDartBossBosPos,
	[29224] = MSG_camp.U2GS_CampBanTalk,
	[1869] = MSG_camp.U2GS_CampGetSalary,
	[8108] = MSG_camp.U2GS_CampWarBossBloodQuery,
	[38415] = MSG_camp.U2GS_CampWarEnterReqest,
	[64494] = MSG_camp.U2GS_CampWarProcessReqest,
	[62654] = MSG_camp.U2GS_CampWarRankRequest,
	[10442] = MSG_camp.U2GS_GetCampTask,
	[39558] = MSG_camp.U2GS_GoToCampMap,
	[26426] = MSG_camp.U2GS_ReqCampDartBossPosition,
	[42391] = MSG_camp.U2GS_RequestCampLeader,
	[21500] = MSG_camp.U2GS_RequestCampTaskNumber,
	[56136] = MSG_camp.U2GS_RequestSalaryCount,
	--Endcamp

	--Begin chaosFight...
	[17991] = MSG_chaosFight.GS2U_ChaosFightEnd,
	[39884] = MSG_chaosFight.GS2U_ChaosFightGatherRefresh,
	[11346] = MSG_chaosFight.GS2U_ChaosFightInfo,
	[60308] = MSG_chaosFight.GS2U_ChaosFightKillOrGather,
	[3408] = MSG_chaosFight.GS2U_ChaosFightRankInfoList,
	[31738] = MSG_chaosFight.GS2U_ChaosFightScoreInfoList,
	[7773] = MSG_chaosFight.GS2U_ChaosMap2BossActive,
	[64434] = MSG_chaosFight.GS2U_GetLChaosFightDayRewardSuccess,
	[56020] = MSG_chaosFight.U2GS_ChaosFightInfo,
	[40528] = MSG_chaosFight.U2GS_ChaosFightJoin,
	[27431] = MSG_chaosFight.U2GS_GetChaosFightDayReward,
	[33611] = MSG_chaosFight.U2GS_RequestChaosFightRankInfo,
	--EndchaosFight

	--Begin compose...
	[27821] = MSG_compose.GS2U_ComposeProp,
	[600] = MSG_compose.GS2U_GetCompose,
	[19507] = MSG_compose.U2GS_ComposeProp,
	[33210] = MSG_compose.U2GS_GetCompose,
	--Endcompose

	--Begin copy...
	[31536] = MSG_copy.GS2U_CopyMapRemainCount,
	[14437] = MSG_copy.GS2U_CopyProcessApointMonster,
	[51710] = MSG_copy.GS2U_CopyProcessEscort,
	[31031] = MSG_copy.GS2U_CopyProcessEscortPer,
	[11699] = MSG_copy.GS2U_CopyProcessHpPer,
	[55305] = MSG_copy.GS2U_CopyProcessKillAll,
	[42343] = MSG_copy.GS2U_CopyProcessKillApoint,
	[64022] = MSG_copy.GS2U_CopyProcessKillNum,
	[19090] = MSG_copy.GS2U_CopyProcessLoop,
	[22892] = MSG_copy.GS2U_CopyProcessProtected,
	[39416] = MSG_copy.GS2U_ExtraRewardRemainTime,
	[33184] = MSG_copy.GS2U_FinishCopy,
	[15138] = MSG_copy.GS2U_MapInspire,
	[14887] = MSG_copy.GS2U_MiniMapInfo,
	[43381] = MSG_copy.GS2U_NextPos,
	[45346] = MSG_copy.GS2U_RequestEnterCopyMap,
	[21501] = MSG_copy.GS2U_StoryCopyFinishId,
	[5209] = MSG_copy.GS2U_UpdateCopyMapRemainCount,
	[53353] = MSG_copy.GS2U_WipeCopyResult,
	[39157] = MSG_copy.U2GS_AddMapInspire,
	[3765] = MSG_copy.U2GS_AgreeEnterCopyMap,
	[24973] = MSG_copy.U2GS_EnterCopyMap,
	[62468] = MSG_copy.U2GS_EnterStoryCopyMap,
	[1639] = MSG_copy.U2GS_GetMiniMapInfo,
	[20028] = MSG_copy.U2GS_GetStoryCopyFinishId,
	[15694] = MSG_copy.U2GS_LeaveCopyMap,
	[3590] = MSG_copy.U2GS_RefrehMonster,
	[30660] = MSG_copy.U2GS_RequestNextPos,
	[53270] = MSG_copy.U2GS_TriggerNextProgress,
	[60386] = MSG_copy.U2GS_WipeCopyMap,
	--Endcopy

	--Begin crossserver...
	[49906] = MSG_crossserver.GS2U_ApplyCrossActivityResult,
	[31724] = MSG_crossserver.GS2U_CanEnterCross,
	[32613] = MSG_crossserver.GS2U_EnterCrossToken,
	[42128] = MSG_crossserver.U2GS_CrossServerLogin,
	[11826] = MSG_crossserver.U2GS_EnterCross,
	[53115] = MSG_crossserver.U2GS_ReturnGameServer,
	--Endcrossserver

	--Begin dailyActive...
	[54629] = MSG_dailyActive.GS2U_DailyActiveInfo,
	[63397] = MSG_dailyActive.GS2U_DailyActivePoint,
	[44045] = MSG_dailyActive.GS2U_FreshWildBoss,
	[30797] = MSG_dailyActive.GS2U_GetDailyRewardSuccess,
	[60038] = MSG_dailyActive.GS2U_KillMonsterInfo,
	[52389] = MSG_dailyActive.GS2U_MoneyCopyMapKillNum,
	[61232] = MSG_dailyActive.GS2U_MoneyCopyMapProcess,
	[39171] = MSG_dailyActive.GS2U_MulitipleReamin,
	[42920] = MSG_dailyActive.GS2U_MulitipleSuccess,
	[36866] = MSG_dailyActive.GS2U_NowRefreshWorldBoss,
	[44436] = MSG_dailyActive.GS2U_PersonalBattleEnterMap,
	[21931] = MSG_dailyActive.GS2U_PersonalBattleFinish,
	[25269] = MSG_dailyActive.GS2U_PersonalBattleHpPer,
	[13090] = MSG_dailyActive.GS2U_PersonalBattleKill,
	[47633] = MSG_dailyActive.GS2U_ProtectNPCProcess,
	[47317] = MSG_dailyActive.GS2U_ProtectNpcGetEffect,
	[60195] = MSG_dailyActive.GS2U_ProtectNpcHpPer,
	[2103] = MSG_dailyActive.GS2U_ProtectOwnEffectId,
	[15524] = MSG_dailyActive.GS2U_ProtectUseEffectId,
	[65499] = MSG_dailyActive.GS2U_WildBossDead,
	[15552] = MSG_dailyActive.GS2U_WildBossOwner,
	[32047] = MSG_dailyActive.GS2U_WorldBossHarm,
	[19040] = MSG_dailyActive.GS2U_WorldBossHarmTopThree,
	[49864] = MSG_dailyActive.U2GS_GetDailyReward,
	[37299] = MSG_dailyActive.U2GS_JoinDailyActive,
	[7238] = MSG_dailyActive.U2GS_ProtectUseEffectId,
	[45972] = MSG_dailyActive.U2GS_RequestDailyActiveInfo,
	[45989] = MSG_dailyActive.U2GS_WorldBossHarm,
	--EnddailyActive

	--Begin dress...
	[30066] = MSG_dress.GS2U_BuyDressSuccess,
	[45412] = MSG_dress.GS2U_DressResult,
	[64418] = MSG_dress.GS2U_HadBuyDressInfo,
	[40151] = MSG_dress.U2GS_BuyDress,
	[29781] = MSG_dress.U2GS_OperateDress,
	[41168] = MSG_dress.U2GS_RequestDressInfo,
	--Enddress

	--Begin energy...
	[35880] = MSG_energy.GS2U_remainEnergy,
	--Endenergy

	--Begin equip...
	[40201] = MSG_equip.GS2U_ActiveEquipSucce,
	[64637] = MSG_equip.GS2U_EquipDurChange,
	[9507] = MSG_equip.GS2U_EquipStrengLvChange,
	[56873] = MSG_equip.GS2U_GetAllEquip,
	[65234] = MSG_equip.GS2U_StarGoEquip,
	[123] = MSG_equip.GS2U_StrengthEquip,
	[54924] = MSG_equip.GS2U_StrengthEquipOneKey,
	[53577] = MSG_equip.GS2U_UpEquip,
	[3900] = MSG_equip.U2GS_ActiveEquip,
	[29589] = MSG_equip.U2GS_DurEquip,
	[56920] = MSG_equip.U2GS_StarGoEquip,
	[14065] = MSG_equip.U2GS_StrengthEquip,
	[58223] = MSG_equip.U2GS_UpEquip,
	--Endequip

	--Begin foreverFight...
	[18467] = MSG_foreverFight.GS2U_FightCrytalInfo,
	[32764] = MSG_foreverFight.GS2U_FightEndAccountInfo,
	[8572] = MSG_foreverFight.GS2U_ForeverFightDelWall,
	[44349] = MSG_foreverFight.GS2U_ForeverFightStart,
	[62326] = MSG_foreverFight.GS2U_ResFightRankInfo,
	[61441] = MSG_foreverFight.GS2U_ResForeverApplyInfo,
	[54951] = MSG_foreverFight.GS2U_ResForeverFightMyInfo,
	[48350] = MSG_foreverFight.U2GS_ReqApplyFight,
	[25440] = MSG_foreverFight.U2GS_ReqCancelApplyFight,
	[57530] = MSG_foreverFight.U2GS_ReqEntryFight,
	[64302] = MSG_foreverFight.U2GS_ReqExitFight,
	[29114] = MSG_foreverFight.U2GS_ReqFightRankInfo,
	[34669] = MSG_foreverFight.U2GS_ReqForeverApplyInfo,
	[55560] = MSG_foreverFight.U2GS_ReqForeverFightMainPanelInfo,
	[54655] = MSG_foreverFight.U2GS_ReqGetDayRewardInfo,
	--EndforeverFight

	--Begin friend...
	[57285] = MSG_friend.GS2U_AddBlackFriendResult,
	[26532] = MSG_friend.GS2U_AddFriendResult,
	[24645] = MSG_friend.GS2U_AskTargetAddFriend,
	[50243] = MSG_friend.GS2U_LoadBlackFriendInfoList,
	[29536] = MSG_friend.GS2U_LoadFriendInfoList,
	[24368] = MSG_friend.GS2U_LoadTempFriendInfoList,
	[60295] = MSG_friend.GS2U_RecommendFriendResult,
	[11836] = MSG_friend.GS2U_RemoveBlackResult,
	[7367] = MSG_friend.GS2U_RemoveFriendResult,
	[33889] = MSG_friend.GS2U_SearchResult,
	[51829] = MSG_friend.U2GS_AddBlackFriendRequest,
	[5118] = MSG_friend.U2GS_AddFriendRequest,
	[52688] = MSG_friend.U2GS_BlackFriendInfoListRequest,
	[37455] = MSG_friend.U2GS_FriendInfoListRequest,
	[8872] = MSG_friend.U2GS_RecommendFriendRequest,
	[46870] = MSG_friend.U2GS_RemoveBlackRequest,
	[3051] = MSG_friend.U2GS_RemoveFriendRequest,
	[40137] = MSG_friend.U2GS_SearchRequest,
	[29631] = MSG_friend.U2GS_TempFriendInfoListRequest,
	--Endfriend

	--Begin gem...
	[33761] = MSG_gem.GS2U_DownGem,
	[50184] = MSG_gem.GS2U_GetAllGem,
	[7227] = MSG_gem.GS2U_OneDownGem,
	[8744] = MSG_gem.GS2U_UpGem,
	[38407] = MSG_gem.U2GS_DownGem,
	[30238] = MSG_gem.U2GS_GetAllGem,
	[39837] = MSG_gem.U2GS_OneDownGem,
	[58846] = MSG_gem.U2GS_UpGem,
	--Endgem

	--Begin growup...
	[46236] = MSG_growup.GS2U_GetGrowUpRewardSuccess,
	[1905] = MSG_growup.GS2U_GetHowToGrowUpRewardSuccess,
	[39886] = MSG_growup.GS2U_GrowUpInfoList,
	[45387] = MSG_growup.GS2U_GrowUpInfoRefresh,
	[22606] = MSG_growup.GS2U_HowToGrowUpRewardHaveGet,
	[64068] = MSG_growup.U2GS_GetGrowUpInfo,
	[34249] = MSG_growup.U2GS_GetGrowUpReward,
	[55268] = MSG_growup.U2GS_GetHowToGrowUpReward,
	--Endgrowup

	--Begin guild...
	[44329] = MSG_guild.GS2U_ApplyJoinGuildSuccess,
	[25446] = MSG_guild.GS2U_CanChangeGuildName,
	[61842] = MSG_guild.GS2U_ChangeGuildName,
	[46512] = MSG_guild.GS2U_ChangeNotice,
	[23483] = MSG_guild.GS2U_DeleteGuildId,
	[35867] = MSG_guild.GS2U_Donate,
	[14208] = MSG_guild.GS2U_DonateGuildNotice,
	[15445] = MSG_guild.GS2U_ExitGuild,
	[9428] = MSG_guild.GS2U_GetContributeGiftSuccess,
	[39709] = MSG_guild.GS2U_GuildActive,
	[24457] = MSG_guild.GS2U_GuildApplyList,
	[7897] = MSG_guild.GS2U_GuildApplyTipsInfo,
	[61286] = MSG_guild.GS2U_GuildBuildValue,
	[25068] = MSG_guild.GS2U_GuildCredit,
	[18855] = MSG_guild.GS2U_GuildLvInfo,
	[26724] = MSG_guild.GS2U_GuildMainInfoList,
	[64119] = MSG_guild.GS2U_GuildMemberJoin,
	[62785] = MSG_guild.GS2U_GuildMemberRankChange,
	[10619] = MSG_guild.GS2U_GuildMoneys,
	[61386] = MSG_guild.GS2U_GuildNowExp,
	[28014] = MSG_guild.GS2U_GuildRecordList,
	[25775] = MSG_guild.GS2U_GuildRecruit,
	[58616] = MSG_guild.GS2U_GuildTopInfo,
	[10808] = MSG_guild.GS2U_MemberList,
	[55548] = MSG_guild.GS2U_PlayerGuildInfo,
	[52151] = MSG_guild.GS2U_ReceivedInviteMsg,
	[27408] = MSG_guild.GS2U_SearchGuildFailed,
	[58936] = MSG_guild.GS2U_SearchGuildSuccess,
	[3801] = MSG_guild.GS2U_TadayDonateCount,
	[56514] = MSG_guild.GS2U_TadayGetSalaryCount,
	[53422] = MSG_guild.GS2U_UpOwnGuildLv,
	[52898] = MSG_guild.GS2U_ViewGuild,
	[5750] = MSG_guild.SetGuildAutoAgreeApply,
	[26249] = MSG_guild.U2GS_AgreeGuildRecruit,
	[35529] = MSG_guild.U2GS_ApplyJoinGuild,
	[42104] = MSG_guild.U2GS_ChangeGuildName,
	[2658] = MSG_guild.U2GS_ChangeNotice,
	[8957] = MSG_guild.U2GS_CreateGuild,
	[34721] = MSG_guild.U2GS_DealApplyJoinGuild,
	[7918] = MSG_guild.U2GS_DealInviteJoinGuild,
	[48733] = MSG_guild.U2GS_Donate,
	[61035] = MSG_guild.U2GS_ExitGuild,
	[44513] = MSG_guild.U2GS_GetContributeGift,
	[7902] = MSG_guild.U2GS_GetGuildTop,
	[59014] = MSG_guild.U2GS_GetSalary,
	[47457] = MSG_guild.U2GS_GuildRecruit,
	[27549] = MSG_guild.U2GS_InvitePlayerJoinGuild,
	[49060] = MSG_guild.U2GS_RequestGuildInfo,
	[11261] = MSG_guild.U2GS_SearchGuild,
	[10409] = MSG_guild.U2GS_SetGuildMemberRank,
	[9568] = MSG_guild.U2GS_UpOwnGuildLv,
	[32952] = MSG_guild.U2GS_ViewGuild,
	[24037] = MSG_guild.U2GS_WelcomeGuildMember,
	--Endguild

	--Begin guildCapital...
	[25157] = MSG_guildCapital.GS2U_GCBattleAtkPlayer,
	[61127] = MSG_guildCapital.GS2U_GCBattleClearingPanel,
	[64305] = MSG_guildCapital.GS2U_GCBattleFlagAndFortBarbette,
	[9949] = MSG_guildCapital.GS2U_GCGuildBattleCannonCD,
	[49373] = MSG_guildCapital.GS2U_GCGuildBattleFlagOccupiedScore,
	[39935] = MSG_guildCapital.GS2U_GCGuildBattleStartNotice,
	[6656] = MSG_guildCapital.GS2U_GCGuildCapitalBattleFireResult,
	[20622] = MSG_guildCapital.GS2U_GCSendBattleClearingDetailPanel,
	[48367] = MSG_guildCapital.GS2U_GCSendGuildCapitalPanel,
	[18848] = MSG_guildCapital.GS2U_GCSendGuildCapitalPersonalStatistics,
	[39768] = MSG_guildCapital.GS2U_GCSendGuildRemainTime,
	[330] = MSG_guildCapital.GS2U_SendGuildCapitalGroup,
	[57421] = MSG_guildCapital.U2GS_GCGuildCapitalBattleFire,
	[4765] = MSG_guildCapital.U2GS_GCGuildMapinfo,
	[3316] = MSG_guildCapital.U2GS_GCSendBattleClearingDetailPanel,
	[43157] = MSG_guildCapital.U2GS_GCSendGuildCapitalPanel,
	[29970] = MSG_guildCapital.U2GS_GCSendGuildCapitalPersonalStatistics,
	[8605] = MSG_guildCapital.U2GS_RequestGuildCapitalGroup,
	--EndguildCapital

	--Begin guildFight...
	[18438] = MSG_guildFight.GS2U_RspCampKill,
	[51253] = MSG_guildFight.GS2U_RspGetRew,
	[39282] = MSG_guildFight.GS2U_RspGuildKill,
	[24286] = MSG_guildFight.GS2U_RspPersonBoxDrop,
	[46766] = MSG_guildFight.GS2U_RspPersonKill,
	[47417] = MSG_guildFight.GS2U_RsplastFightInfo,
	[9072] = MSG_guildFight.GS2U_SendActiveInfo,
	[60414] = MSG_guildFight.GS2U_SendBossTime,
	[30133] = MSG_guildFight.GS2U_SynBossRemain,
	[26363] = MSG_guildFight.GS2U_SynBuff,
	[10666] = MSG_guildFight.GS2U_SynDieNum,
	[1526] = MSG_guildFight.GS2U_SynGuildMenberInfo,
	[58995] = MSG_guildFight.GS2U_SynKillBossNum,
	[35720] = MSG_guildFight.GS2U_SynKillMonster,
	[58108] = MSG_guildFight.GS2U_SynKillNum,
	[41073] = MSG_guildFight.GS2U_SynOpenBoxNum,
	[1811] = MSG_guildFight.GS2U_SynRemainBoxNum,
	[5396] = MSG_guildFight.U2GS_ReqActiveInfo,
	[39129] = MSG_guildFight.U2GS_ReqCampDayKill,
	[26960] = MSG_guildFight.U2GS_ReqCampForeverKill,
	[64492] = MSG_guildFight.U2GS_ReqEnter,
	[9310] = MSG_guildFight.U2GS_ReqGetRew,
	[51011] = MSG_guildFight.U2GS_ReqGuildDayKill,
	[23386] = MSG_guildFight.U2GS_ReqGuildForeverKill,
	[18604] = MSG_guildFight.U2GS_ReqLastFightInfo,
	[45553] = MSG_guildFight.U2GS_ReqPersonBoxDrop,
	[14921] = MSG_guildFight.U2GS_ReqPersonDayKill,
	[39360] = MSG_guildFight.U2GS_ReqPersonForeverKill,
	--EndguildFight

	--Begin guildactive...
	[19334] = MSG_guildactive.GS2U_DartHpPer,
	[46901] = MSG_guildactive.GS2U_DartInfo,
	[45452] = MSG_guildactive.GS2U_DartProgress,
	[16958] = MSG_guildactive.GS2U_GuildBossEndBroadCast,
	[56935] = MSG_guildactive.GS2U_GuildBossLinkBroadCast,
	[127] = MSG_guildactive.GS2U_GuildFastOverTaskSuccess,
	[43921] = MSG_guildactive.GS2U_GuildRefBoss,
	[29218] = MSG_guildactive.GS2U_GuildRingReward,
	[430] = MSG_guildactive.GS2U_GuildSingleRaidReadtTime,
	[23746] = MSG_guildactive.GS2U_GuildTaskInfo,
	[10391] = MSG_guildactive.GS2U_GuildTreeData,
	[49086] = MSG_guildactive.GS2U_GuildTreeEnd,
	[58892] = MSG_guildactive.GS2U_GuildTreeGrowUpEnd,
	[52947] = MSG_guildactive.GS2U_GuildTreeKillMonsterNum,
	[43105] = MSG_guildactive.GS2U_GuildTreeStart,
	[46853] = MSG_guildactive.GS2U_OpenDartTips,
	[54103] = MSG_guildactive.GS2U_OverDart,
	[37877] = MSG_guildactive.GS2U_SendGuildBossCopyMapPanel,
	[33704] = MSG_guildactive.GS2U_SendGuildBossPanel,
	[43497] = MSG_guildactive.GS2U_ShowOneInDart,
	[32227] = MSG_guildactive.U2GS_EnterGuildSingleRaid,
	[3083] = MSG_guildactive.U2GS_EnterGuildStation,
	[61526] = MSG_guildactive.U2GS_EnterTheDart,
	[47954] = MSG_guildactive.U2GS_GuildFastOverTask,
	[58988] = MSG_guildactive.U2GS_OpenGuildBoss,
	[21260] = MSG_guildactive.U2GS_OpenTheDart,
	[58444] = MSG_guildactive.U2GS_ReqSubmitGuildTreeItem,
	[20561] = MSG_guildactive.U2GS_RequestGuildRingReward,
	[6745] = MSG_guildactive.U2GS_RequestGuildTaskInfo,
	[37907] = MSG_guildactive.U2GS_RequestStartGuildRingTask,
	[25418] = MSG_guildactive.U2GS_SendGuildBossPanel,
	[57029] = MSG_guildactive.U2GS_SendGuildIdForSecond,
	--Endguildactive

	--Begin head...
	[17837] = MSG_head.GS2U_ActiveHeadSuccess,
	[44971] = MSG_head.GS2U_ActiveHonorSuccess,
	[35857] = MSG_head.GS2U_ActiveTitleSuccess,
	[45848] = MSG_head.GS2U_HeadChange,
	[27822] = MSG_head.GS2U_HeadList,
	[16438] = MSG_head.GS2U_TitleList,
	[51656] = MSG_head.U2GS_ActiveHead,
	[35142] = MSG_head.U2GS_ActiveHonor,
	[39000] = MSG_head.U2GS_ActiveTitle,
	[34624] = MSG_head.U2GS_HeadList,
	[59232] = MSG_head.U2GS_SetHead,
	[61856] = MSG_head.U2GS_SetTitle,
	[62028] = MSG_head.U2GS_TitleList,
	--Endhead

	--Begin landreward...
	[15864] = MSG_landreward.GS2U_DayRechargeRewardInfo,
	[61135] = MSG_landreward.GS2U_GetDayRechargeRewardSuccess,
	[39587] = MSG_landreward.GS2U_GetTotalRechargeRewardSuccess,
	[39147] = MSG_landreward.GS2U_LandItemsInfo,
	[64249] = MSG_landreward.GS2U_LastGetTime_reward,
	[22994] = MSG_landreward.GS2U_RespOffLineEXP,
	[3928] = MSG_landreward.GS2U_SendOffLineTime,
	[43076] = MSG_landreward.GS2U_TotalRechargeRewardInfo,
	[32094] = MSG_landreward.U2GS_GetDayRechargeReward,
	[33366] = MSG_landreward.U2GS_GetOffLineEXP,
	[4073] = MSG_landreward.U2GS_GetTime_reward,
	[4842] = MSG_landreward.U2GS_GetTotalRechargeReward,
	--Endlandreward

	--Begin levelreward...
	[35614] = MSG_levelreward.GS2U_BuyOrGetGrowUpFundSucc,
	[31086] = MSG_levelreward.GS2U_GetLevelRewardSuccess,
	[43186] = MSG_levelreward.GS2U_GetServerAllFundRewardSucc,
	[42932] = MSG_levelreward.GS2U_GrowUpFundVectorInfo,
	[1722] = MSG_levelreward.GS2U_LevelItemsInfo,
	[8155] = MSG_levelreward.U2GS_BuyGrowUpFund,
	[4714] = MSG_levelreward.U2GS_GetGrowUpFundReward,
	[32635] = MSG_levelreward.U2GS_GetLevelReward,
	[23538] = MSG_levelreward.U2GS_GetServerAllFundReward,
	[40125] = MSG_levelreward.U2GS_ReqGrowUpFundInfo,
	--Endlevelreward

	--Begin lookother...
	[39782] = MSG_lookother.GS2U_LookOtherMountInfo,
	[33180] = MSG_lookother.GS2U_LookOtherPetInfo,
	[24584] = MSG_lookother.GS2U_LookOtherPlayerInfo,
	[7698] = MSG_lookother.GS2U_LookOtherSoulInfo,
	[7854] = MSG_lookother.GS2U_LookOtherWingInfo,
	[39655] = MSG_lookother.U2GS_LookOther,
	--Endlookother

	--Begin mail...
	[5690] = MSG_mail.GS2U_AddMailInfo,
	[14274] = MSG_mail.GS2U_DeleteMail,
	[54573] = MSG_mail.GS2U_DeleteMailAttachment,
	[1596] = MSG_mail.GS2U_MailDetail,
	[3365] = MSG_mail.GS2U_MailInfo,
	[46884] = MSG_mail.U2GS_DeleteMail,
	[13358] = MSG_mail.U2GS_GetMailAttachment,
	[24463] = MSG_mail.U2GS_ReadMail,
	--Endmail

	--Begin mall...
	[39760] = MSG_mall.GS2U_ItemSellPrice,
	[18673] = MSG_mall.GS2U_MallBuySuccess,
	[48388] = MSG_mall.GS2U_MallInfoList,
	[23547] = MSG_mall.GS2U_MallPriceList,
	[1063] = MSG_mall.GS2U_ServerBuyNum,
	[4496] = MSG_mall.U2GS_GetItemSellPrice,
	[57190] = MSG_mall.U2GS_ItemBuyRequest,
	[33516] = MSG_mall.U2GS_MallInfo,
	--Endmall

	--Begin master...
	[34484] = MSG_master.GS2U_ResponseMasterTask,
	[22014] = MSG_master.GS2U_ResponseMasterTaskList,
	[41475] = MSG_master.GS2U_ResponseMasterTaskReward,
	[43405] = MSG_master.U2GS_AcceptMasterTask,
	[54264] = MSG_master.U2GS_ImmediatelyCompleteMasterTask,
	[49274] = MSG_master.U2GS_RefreshMasterTaskList,
	[51938] = MSG_master.U2GS_RequestMasterTaskList,
	[5767] = MSG_master.U2GS_RequestMasterTaskReward,
	--Endmaster

	--Begin minorlv...
	[36339] = MSG_minorlv.GS2U_GetMinorlvInfo,
	[27755] = MSG_minorlv.GS2U_MinorlvDownSucc,
	[12763] = MSG_minorlv.GS2U_MinorlvEquipSucc,
	[44151] = MSG_minorlv.GS2U_MinorlvItemsActive,
	[27028] = MSG_minorlv.GS2U_MinorlvRoteScaleSuc,
	[62396] = MSG_minorlv.GS2U_MinorlvZoneDeleteMessageSuc,
	[13513] = MSG_minorlv.GS2U_MinorlvZoneInfo,
	[63394] = MSG_minorlv.GS2U_MinorlvZoneLeaveMessageSuc,
	[25730] = MSG_minorlv.GS2U_MinorlvZoneVoteAndAddGiftSuc,
	[15477] = MSG_minorlv.U2GS_GetMinorlvInfo,
	[14863] = MSG_minorlv.U2GS_MinorlvDownDecoration,
	[49547] = MSG_minorlv.U2GS_MinorlvEquipDecoration,
	[63490] = MSG_minorlv.U2GS_MinorlvZoneAddGiftNum,
	[37979] = MSG_minorlv.U2GS_MinorlvZoneDeleteMessage,
	[6305] = MSG_minorlv.U2GS_MinorlvZoneLeaveMessage,
	[193] = MSG_minorlv.U2GS_MinorlvZoneReq,
	[22887] = MSG_minorlv.U2GS_MinorlvZoneVote,
	[33037] = MSG_minorlv.U2GS_SetMinorlvRoteScale,
	--Endminorlv

	--Begin moneytree...
	[65365] = MSG_moneytree.GS2U_MoneyShakeShowType,
	[50311] = MSG_moneytree.GS2U_TodayMoneyShakeNum,
	[53172] = MSG_moneytree.U2GS_MoneyShake,
	[42025] = MSG_moneytree.U2GS_TodayMoneyShakeNum,
	--Endmoneytree

	--Begin multiplefight...
	[42771] = MSG_multiplefight.GS2U_MultipleCopyHarmList,
	[9733] = MSG_multiplefight.U2GS_MultipleCopyHarmList,
	--Endmultiplefight

	--Begin newmount...
	[13818] = MSG_newmount.GS2U_GetAllMount,
	[6004] = MSG_newmount.GS2U_MountUpDegreeChange,
	[48090] = MSG_newmount.GS2U_MountUpDown,
	[47117] = MSG_newmount.GS2U_MountUpQualitySucc,
	[41022] = MSG_newmount.GS2U_MountUpStar,
	[41918] = MSG_newmount.GS2U_MountUpStarOnKey,
	[58884] = MSG_newmount.GS2U_NoticeAddMount,
	[59224] = MSG_newmount.GS2U_ReturnMountUpDegree,
	[60193] = MSG_newmount.U2GS_ActiveNewMount,
	[5504] = MSG_newmount.U2GS_GetAllMount,
	[6166] = MSG_newmount.U2GS_MountUpDegree,
	[39776] = MSG_newmount.U2GS_MountUpDown,
	[29405] = MSG_newmount.U2GS_MountUpQuality,
	[32708] = MSG_newmount.U2GS_MountUpStar,
	--Endnewmount

	--Begin newtask...
	[3177] = MSG_newtask.CollectSuccess,
	[63871] = MSG_newtask.GS2U_BreakCollect,
	[33056] = MSG_newtask.GS2U_GetAllTask,
	[50244] = MSG_newtask.GS2U_NoticeAccpetOrCompleteTask,
	[39077] = MSG_newtask.GS2U_SubmitTask,
	[56307] = MSG_newtask.U2GS_BeginCollect,
	[54223] = MSG_newtask.U2GS_ChoosePetTask,
	[130] = MSG_newtask.U2GS_GetAllTask,
	[20053] = MSG_newtask.U2GS_SetCompleteDialogue,
	[6151] = MSG_newtask.U2GS_SubmitTask,
	--Endnewtask

	--Begin pet...
	[13720] = MSG_pet.GS2U_ActivePetEquipSuccess,
	[53571] = MSG_pet.GS2U_AllPetesBaseInfo,
	[77] = MSG_pet.GS2U_ChangeMainViceSuccess,
	[42010] = MSG_pet.GS2U_NoticeAddPet,
	[9031] = MSG_pet.GS2U_NoticePlayerPetExp,
	[29555] = MSG_pet.GS2U_NoticeRemovePet,
	[12772] = MSG_pet.GS2U_PetAllInfo,
	[6163] = MSG_pet.GS2U_PetChangedFight,
	[34769] = MSG_pet.GS2U_PetFight,
	[72] = MSG_pet.GS2U_PetHoleOpenPractice,
	[22771] = MSG_pet.GS2U_PetHoleUpDegreeResult,
	[11536] = MSG_pet.GS2U_PetModifyName,
	[47118] = MSG_pet.GS2U_PetNormalInheritSuccess,
	[44942] = MSG_pet.GS2U_PetPerfectInheritSuccess,
	[49299] = MSG_pet.GS2U_PetPracticeResult,
	[62124] = MSG_pet.GS2U_PetSetMainFight,
	[64197] = MSG_pet.GS2U_PetUpDegreeSuccess,
	[13064] = MSG_pet.GS2U_PetUpResult,
	[50969] = MSG_pet.GS2U_PetUpStarResult,
	[36633] = MSG_pet.GS2U_ReplacePetPracticeSuccess,
	[22297] = MSG_pet.U2GS_ActivePetEquip,
	[56008] = MSG_pet.U2GS_ChangeMainVice,
	[5284] = MSG_pet.U2GS_GetPetAllInfo,
	[26127] = MSG_pet.U2GS_PetFeed,
	[41571] = MSG_pet.U2GS_PetFight,
	[6283] = MSG_pet.U2GS_PetFlyToMaster,
	[52908] = MSG_pet.U2GS_PetHoleUpDegree,
	[25478] = MSG_pet.U2GS_PetModifyName,
	[16299] = MSG_pet.U2GS_PetNormalInherit,
	[60975] = MSG_pet.U2GS_PetPerfectInherit,
	[8172] = MSG_pet.U2GS_PetPractice,
	[42386] = MSG_pet.U2GS_PetSetMainFight,
	[14896] = MSG_pet.U2GS_PetUp,
	[51380] = MSG_pet.U2GS_PetUpDegree,
	[5426] = MSG_pet.U2GS_PetUpStar,
	[46813] = MSG_pet.U2GS_RemovePet,
	[35852] = MSG_pet.U2GS_ReplacePetPractice,
	--Endpet

	--Begin player...
	[51801] = MSG_player.Any_ChangeMap,
	[1702] = MSG_player.Any_PlayerLogout,
	[45297] = MSG_player.C2S_ChangeMap,
	[46744] = MSG_player.GS2U_AllBattleProp,
	[5154] = MSG_player.GS2U_AngerValue,
	[28245] = MSG_player.GS2U_BattlePropList,
	[4623] = MSG_player.GS2U_BlockStatusChange,
	[51339] = MSG_player.GS2U_BroadCastJump,
	[45334] = MSG_player.GS2U_BroadcastDisapear,
	[65080] = MSG_player.GS2U_BroadcastMonsterHpPC,
	[54157] = MSG_player.GS2U_BroadcastPlayerHpPC,
	[17135] = MSG_player.GS2U_BroadcastPlayerRevive,
	[46672] = MSG_player.GS2U_BroadcastVisibleEquipOff,
	[42110] = MSG_player.GS2U_BroadcastVisibleEquipOn,
	[20809] = MSG_player.GS2U_ChangeCamp,
	[47012] = MSG_player.GS2U_ChangeNameResult,
	[14493] = MSG_player.GS2U_ChatVoiceKey,
	[39394] = MSG_player.GS2U_Chatinfo,
	[45054] = MSG_player.GS2U_CreatePlayerResult,
	[9420] = MSG_player.GS2U_CrossServerBuffList,
	[39385] = MSG_player.GS2U_DeletePlayerResult,
	[41304] = MSG_player.GS2U_FightPoint,
	[30545] = MSG_player.GS2U_GatherNextCanCollectTime,
	[30981] = MSG_player.GS2U_HeartBeatAck,
	[38711] = MSG_player.GS2U_KickOutTip,
	[12529] = MSG_player.GS2U_KillingValueChange,
	[11622] = MSG_player.GS2U_LoginLineUpNum,
	[22162] = MSG_player.GS2U_LoginResult,
	[18166] = MSG_player.GS2U_LookInfoPlayer,
	[30932] = MSG_player.GS2U_MapLine,
	[18671] = MSG_player.GS2U_MissionObjectGatherIdes,
	[59133] = MSG_player.GS2U_MissionObjectList,
	[42163] = MSG_player.GS2U_MonsterChangeState,
	[32656] = MSG_player.GS2U_MonsterList,
	[58171] = MSG_player.GS2U_MoveInfo,
	[639] = MSG_player.GS2U_NpcList,
	[27200] = MSG_player.GS2U_OffLineMsgList,
	[35833] = MSG_player.GS2U_OpenSystem,
	[18025] = MSG_player.GS2U_PetList,
	[47341] = MSG_player.GS2U_PlayerAddExp,
	[25296] = MSG_player.GS2U_PlayerBaseInfo,
	[15512] = MSG_player.GS2U_PlayerChangedWealth,
	[38317] = MSG_player.GS2U_PlayerHp,
	[65190] = MSG_player.GS2U_PlayerLevelUp,
	[42726] = MSG_player.GS2U_PlayerRevive,
	[2670] = MSG_player.GS2U_RespChatVoice,
	[2854] = MSG_player.GS2U_RespChatVoiceError,
	[22864] = MSG_player.GS2U_RespDayBuyInfo,
	[37557] = MSG_player.GS2U_RespDayBuyReward,
	[58071] = MSG_player.GS2U_RespTurnPlateInfo,
	[43604] = MSG_player.GS2U_RespTurnPlateReward,
	[27399] = MSG_player.GS2U_ResponseNextMenu,
	[42464] = MSG_player.GS2U_SelPlayerResult,
	[27152] = MSG_player.GS2U_ServerTimeZone,
	[35067] = MSG_player.GS2U_StopMove,
	[36481] = MSG_player.GS2U_TakeBackPet,
	[5369] = MSG_player.GS2U_TipsString,
	[22727] = MSG_player.GS2U_TransferNewPos,
	[18582] = MSG_player.GS2U_UserPlayerList,
	[52752] = MSG_player.U2GS_CancelEnterMap,
	[10342] = MSG_player.U2GS_ChangeMapLine,
	[43873] = MSG_player.U2GS_ChangeName,
	[21140] = MSG_player.U2GS_ChatInfo,
	[15792] = MSG_player.U2GS_ChatVoice,
	[36175] = MSG_player.U2GS_ChatVoiceKey,
	[62701] = MSG_player.U2GS_CheckEntity,
	[61093] = MSG_player.U2GS_DigTransferMap,
	[30475] = MSG_player.U2GS_EnteredMap,
	[62331] = MSG_player.U2GS_Feedback,
	[39242] = MSG_player.U2GS_HeartBeat,
	[33460] = MSG_player.U2GS_HeartBeatReal,
	[5620] = MSG_player.U2GS_Jump,
	[12636] = MSG_player.U2GS_LeaveBlock,
	[1578] = MSG_player.U2GS_MoveTo,
	[56720] = MSG_player.U2GS_Photo,
	[41242] = MSG_player.U2GS_ReqChatVoice,
	[63385] = MSG_player.U2GS_ReqDayBuyReward,
	[59971] = MSG_player.U2GS_ReqTurnPlateInfo,
	[20128] = MSG_player.U2GS_ReqTurnPlateReward,
	[36878] = MSG_player.U2GS_RequestChangeCamp,
	[4022] = MSG_player.U2GS_RequestCreatePlayer,
	[23657] = MSG_player.U2GS_RequestDeletePlayer,
	[56084] = MSG_player.U2GS_RequestLogin,
	[18211] = MSG_player.U2GS_RequestMapLine,
	[63243] = MSG_player.U2GS_RequestNextMenu,
	[33893] = MSG_player.U2GS_RequestPlayerBaseInfo,
	[60126] = MSG_player.U2GS_RequestRevive,
	[52607] = MSG_player.U2GS_RequestReviveCost,
	[56497] = MSG_player.U2GS_SelPlayerEnterGame,
	[41869] = MSG_player.U2GS_StopMove,
	[37548] = MSG_player.U2GS_UseActiveCode,
	--Endplayer

	--Begin practive...
	[37075] = MSG_practive.GS2U_RequestRank,
	[48065] = MSG_practive.U2GS_RequestPracticeTime,
	[51405] = MSG_practive.U2GS_SendMapId,
	--Endpractive

	--Begin preach...
	[15034] = MSG_preach.GS2U_PreachBegin,
	[29206] = MSG_preach.GS2U_PreachEXP,
	[23742] = MSG_preach.GS2U_PreachSynTime,
	[48785] = MSG_preach.GS2U_RespInspireCount,
	[53552] = MSG_preach.U2GS_PlayerEntered,
	[9077] = MSG_preach.U2GS_ReqInspireCount,
	--Endpreach

	--Begin rank...
	[28763] = MSG_rank.GS2U_OwnTop,
	[30096] = MSG_rank.GS2U_RankInfoList,
	[2147] = MSG_rank.U2GS_RequestRankInfo,
	--Endrank

	--Begin recharge...
	[19398] = MSG_recharge.GS2U_AppRechargeInfo,
	[22441] = MSG_recharge.GS2U_FirstRechargeInfo,
	[2175] = MSG_recharge.U2GS_FirstRechargeInfo,
	--Endrecharge

	--Begin reconnect...
	[65348] = MSG_reconnect.GS2U_ReconnectResult,
	[31346] = MSG_reconnect.GS2U_ReconnectToken,
	[58037] = MSG_reconnect.U2GS_Reconnect,
	[1317] = MSG_reconnect.U2GS_SetReconnectTokenSuccess,
	--Endreconnect

	--Begin recover...
	[21921] = MSG_recover.GS2U_RecoverInfoSuccess,
	[23219] = MSG_recover.GS2U_RecoverLastNoActiveInfo,
	[37013] = MSG_recover.U2GS_LastNoActiveInfo,
	[25096] = MSG_recover.U2GS_RecoverInfo,
	--Endrecover

	--Begin redpackets...
	[20255] = MSG_redpackets.GS2U_GetRedpacketsSuccess,
	[59717] = MSG_redpackets.GS2U_GiveRedpacketsSuccess,
	[12454] = MSG_redpackets.GS2U_NewRedpackets,
	[23363] = MSG_redpackets.GS2U_RedpacketsAllGet,
	[34876] = MSG_redpackets.GS2U_RedpacketsList,
	[28575] = MSG_redpackets.GS2U_ViewRedpackets,
	[7890] = MSG_redpackets.U2GS_GetRedpackets,
	[60381] = MSG_redpackets.U2GS_GiveRedpackets,
	[14014] = MSG_redpackets.U2GS_RedpacketsList,
	[7713] = MSG_redpackets.U2GS_ViewRedpackets,
	--Endredpackets

	--Begin setting...
	[54439] = MSG_setting.GS2U_ServerSwitch,
	[4520] = MSG_setting.GS2U_WorldLv,
	--Endsetting

	--Begin shop...
	[1646] = MSG_shop.GS2U_FlushShop,
	[44000] = MSG_shop.GS2U_ForeverFriendValue,
	[36064] = MSG_shop.GS2U_GetShop,
	[6454] = MSG_shop.GS2U_GetShopStatus,
	[23387] = MSG_shop.GS2U_ShopBuyNormal,
	[34501] = MSG_shop.GS2U_ShopBuySpacial,
	[47236] = MSG_shop.U2GS_FlushShop,
	[35714] = MSG_shop.U2GS_ForeverFriendValue,
	[40710] = MSG_shop.U2GS_GetShop,
	[20396] = MSG_shop.U2GS_GetShopStatus,
	[18490] = MSG_shop.U2GS_ShopBuy,
	--Endshop

	--Begin signin...
	[29318] = MSG_signin.GS2U_OnlineSignInfo,
	[22123] = MSG_signin.GS2U_SignDaysSuccess,
	[52851] = MSG_signin.GS2U_SignInfo,
	[10416] = MSG_signin.U2GS_RequestSignInfo,
	[5266] = MSG_signin.U2GS_SignDays,
	--Endsignin

	--Begin singleTower...
	[28899] = MSG_singleTower.GS2U_FightEnd,
	[38074] = MSG_singleTower.GS2U_GiveDayReward,
	[14690] = MSG_singleTower.GS2U_RespAllTowerInfo,
	[58387] = MSG_singleTower.GS2U_SingleTowerAtkNum,
	[9747] = MSG_singleTower.GS2U_SingleTowerSynchrTime,
	[33255] = MSG_singleTower.U2GS_GetDayReward,
	[42321] = MSG_singleTower.U2GS_JointTower,
	[40518] = MSG_singleTower.U2GS_ReqAllTowerInfo,
	--EndsingleTower

	--Begin skill...
	[491] = MSG_skill.GS2U_ActivatedSkillSuccess,
	[4393] = MSG_skill.GS2U_RemoveTempSkill,
	[5852] = MSG_skill.GS2U_SetSkillSuccess,
	[15045] = MSG_skill.GS2U_SkillInfoList,
	[38634] = MSG_skill.GS2U_TempSkillAddList,
	[63049] = MSG_skill.GS2U_UpSkillSuccess,
	[49922] = MSG_skill.U2GS_ActivatedSkill,
	[34869] = MSG_skill.U2GS_SetSkill,
	[25536] = MSG_skill.U2GS_upSkill,
	--Endskill

	--Begin soul...
	[43703] = MSG_soul.GS2U_AddSoulId,
	[60757] = MSG_soul.GS2U_ChallengeCircleCoolTime,
	[7071] = MSG_soul.GS2U_ChallengeCircleTowerFailed,
	[37397] = MSG_soul.GS2U_SoulEquip,
	[313] = MSG_soul.GS2U_SoulInfo,
	[17520] = MSG_soul.U2GS_ChallengeCircleTower,
	[17451] = MSG_soul.U2GS_SoulEquip,
	[7115] = MSG_soul.U2GS_SoulInfo,
	--Endsoul

	--Begin team...
	[40018] = MSG_team.GS2U_AddTeamMemberInfo,
	[20776] = MSG_team.GS2U_ApplyList,
	[23545] = MSG_team.GS2U_AutoAgreeApply,
	[1783] = MSG_team.GS2U_CancelMatching,
	[65357] = MSG_team.GS2U_ChangeTarget,
	[52189] = MSG_team.GS2U_ChangedLeader,
	[24383] = MSG_team.GS2U_DelTeammateInfo,
	[28554] = MSG_team.GS2U_InviteFollow,
	[29880] = MSG_team.GS2U_LearderInviteEnterMap,
	[63045] = MSG_team.GS2U_Matching,
	[8579] = MSG_team.GS2U_MemberDealInviteEnterMap,
	[2762] = MSG_team.GS2U_MemberHpChange,
	[53845] = MSG_team.GS2U_MiniMapMemberInfo,
	[25845] = MSG_team.GS2U_NotFolowLeader,
	[45149] = MSG_team.GS2U_ReceiveApplyInfo,
	[15498] = MSG_team.GS2U_ReceiveInviteInfo,
	[4537] = MSG_team.GS2U_RemoveWorldPropaganda,
	[7793] = MSG_team.GS2U_ReturnCopyNum,
	[62312] = MSG_team.GS2U_ReturnTeamCopyNum,
	[43567] = MSG_team.GS2U_SetFollow,
	[55031] = MSG_team.GS2U_TeamInfo,
	[36615] = MSG_team.GS2U_TeamList,
	[39669] = MSG_team.GS2U_TeamMemberFight,
	[63632] = MSG_team.GS2U_TeamMemberOffline,
	[17622] = MSG_team.GS2U_TeamMemberOnline,
	[27554] = MSG_team.GS2U_ViewTeam,
	[21089] = MSG_team.GS2U_WorldPropaganda,
	[42781] = MSG_team.U2GS_AckInviteTeam,
	[46457] = MSG_team.U2GS_CancelMatching,
	[21503] = MSG_team.U2GS_ChangeTarget,
	[14040] = MSG_team.U2GS_FollowLeader,
	[52373] = MSG_team.U2GS_GetMiniMapMemberInfo,
	[63768] = MSG_team.U2GS_LeaveAwayTeam,
	[4311] = MSG_team.U2GS_Matching,
	[53397] = MSG_team.U2GS_MemberDealInviteEnterMap,
	[8639] = MSG_team.U2GS_OperateTeam,
	[47904] = MSG_team.U2GS_RequestInviteList,
	[34935] = MSG_team.U2GS_RequestPlayerCopyNum,
	[25391] = MSG_team.U2GS_RequestTeamCopyNum,
	[59716] = MSG_team.U2GS_RequestTeamList,
	[51157] = MSG_team.U2GS_SetAutoAgreeApply,
	[60758] = MSG_team.U2GS_SetAutoAgreeInvite,
	[23621] = MSG_team.U2GS_SetFollow,
	[19931] = MSG_team.U2GS_TeamMemberFight,
	[34356] = MSG_team.U2GS_ViewTeam,
	[1351] = MSG_team.U2GS_WorldPropaganda,
	--Endteam

	--Begin townDemonTower...
	[51666] = MSG_townDemonTower.GS2U_GetTowerHurtRank,
	[57548] = MSG_townDemonTower.GS2U_NextFloorCountDown,
	[33911] = MSG_townDemonTower.GS2U_NoticeCurrentFloor,
	[58022] = MSG_townDemonTower.GS2U_NoticeTowerBossHP,
	[46587] = MSG_townDemonTower.GS2U_NoticeTowerResidueTime,
	[19886] = MSG_townDemonTower.GS2U_NoticeTowerResult,
	[35492] = MSG_townDemonTower.U2GS_GetTowerHurtRank,
	--EndtownDemonTower

	--Begin trade...
	[4707] = MSG_trade.GS2U_BuyTradeItemFail,
	[38542] = MSG_trade.GS2U_BuyTradeItemSuccess,
	[61290] = MSG_trade.GS2U_DownTradeItemSuccess,
	[5602] = MSG_trade.GS2U_OwnUpTradeItem,
	[27905] = MSG_trade.GS2U_SelectTradeItemList,
	[7597] = MSG_trade.GS2U_TradeItemListReturn,
	[32127] = MSG_trade.GS2U_UpTradeItemSuccess,
	[30476] = MSG_trade.U2GS_BuyTradeItem,
	[19491] = MSG_trade.U2GS_DownTradeItem,
	[54032] = MSG_trade.U2GS_RequestOwnUpTrade,
	[54468] = MSG_trade.U2GS_RequestTradeItemList,
	[22855] = MSG_trade.U2GS_SelectTradeItemList,
	[28930] = MSG_trade.U2GS_UpTradeItem,
	--Endtrade

	--Begin vip...
	[41258] = MSG_vip.GS2U_BuyVipSpecialItemSuccess,
	[30150] = MSG_vip.GS2U_GetVipLevelGiftSuccess,
	[19936] = MSG_vip.GS2U_MonthCardDayRewardSuccess,
	[63914] = MSG_vip.GS2U_MonthCardInfo,
	[59554] = MSG_vip.GS2U_VipBuyCount,
	[34252] = MSG_vip.GS2U_VipBuyCountList,
	[2079] = MSG_vip.GS2U_VipInfo,
	[4982] = MSG_vip.GS2U_VipInfoExp,
	[42947] = MSG_vip.U2GS_BuyVipSpecialItem,
	[64615] = MSG_vip.U2GS_GetVipLevelGift,
	[8081] = MSG_vip.U2GS_MonthCardDayReward,
	[54894] = MSG_vip.U2GS_RequestVipInfo,
	[51240] = MSG_vip.U2GS_VipBuyCount,
	--Endvip

	--Begin wing...
	[34246] = MSG_wing.GS2U_BroadCastWinglv,
	[51667] = MSG_wing.GS2U_ReturnWingUpDegree,
	[40273] = MSG_wing.GS2U_ReturnWingUpQuality,
	[469] = MSG_wing.GS2U_WingInfo,
	[38135] = MSG_wing.GS2U_WingUpFailed,
	[62397] = MSG_wing.GS2U_WingUpSuccess,
	[23570] = MSG_wing.U2GS_RequestWingInfo,
	[54007] = MSG_wing.U2GS_RequestWingUpDegree,
	[21808] = MSG_wing.U2GS_RequestWingUpQuality,
	[38805] = MSG_wing.U2GS_WingHole,
	[56280] = MSG_wing.U2GS_WingUp,
	--Endwing

	--Begin world...
	--Endworld
}
 --END table for msgs description

