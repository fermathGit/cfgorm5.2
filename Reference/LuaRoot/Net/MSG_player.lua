return {
	Any_ChangeMap = 
	{
		fields = "mapId,x,y,line,iffi",
	},

	Any_PlayerLogout = 
	{
		fields = "code,reason,LB",
	},

	C2S_ChangeMap = 
	{
		fields = "mapId,waypointName,iz",
	},

	GS2U_AllBattleProp = 
	{
		fields = "code,battlePropInfo,L1",
	},

	GS2U_AngerValue = 
	{
		fields = "value,i",
	},

	GS2U_BattlePropList = 
	{
		fields = "code,$battleProp,L1",
		[1] = {
			fields = "index,value,Bf",
		},
	},

	GS2U_BlockStatusChange = 
	{
		fields = "$changes,1",
		[1] = {
			fields = "blockName,blockStatus,zB",
		},
	},

	GS2U_BroadCastJump = 
	{
		fields = "roleID,$jump,Lu",
		[1] = {
			fields = "jumpBeginX,jumpBeginY,jumpTargetX,jumptargetY,jumpHigh,jumpTime,ffffff",
		},
	},

	GS2U_BroadcastDisapear = 
	{
		fields = "code,1",
	},

	GS2U_BroadcastMonsterHpPC = 
	{
		fields = "code,hpPC,LS",
	},

	GS2U_BroadcastPlayerHpPC = 
	{
		fields = "code,hpPC,LB",
	},

	GS2U_BroadcastPlayerRevive = 
	{
		fields = "code,mapId,x,y,hpPC,LSffB",
	},

	GS2U_BroadcastVisibleEquipOff = 
	{
		fields = "code,type,LI",
	},

	GS2U_BroadcastVisibleEquipOn = 
	{
		fields = "code,equip,Li",
	},

	GS2U_ChangeCamp = 
	{
		fields = "code,camp,Li",
	},

	GS2U_ChangeNameResult = 
	{
		fields = "roleID,name,errorCode,LzI",
	},

	GS2U_ChatVoiceKey = 
	{
		fields = "seed,key,iL",
	},

	GS2U_Chatinfo = 
	{
		fields = "channel,senderID,senderName,senderVip,content,isAdmini,bLzbzt",
	},

	GS2U_CreatePlayerResult = 
	{
		fields = "errorCode,roleID,createTime,iLi",
	},

	GS2U_CrossServerBuffList = 
	{
		fields = "$buffs,1",
		[1] = {
			fields = "buffUID,buffID,time,LII",
		},
	},

	GS2U_DeletePlayerResult = 
	{
		fields = "roleID,errorCode,Li",
	},

	GS2U_FightPoint = 
	{
		fields = "value,i",
	},

	GS2U_GatherNextCanCollectTime = 
	{
		fields = "code,nextCanCollectTime,Li",
	},

	GS2U_HeartBeatAck = 
	{
		fields = "cd,serverTime,II",
	},

	GS2U_KickOutTip = 
	{
		fields = "type,b",
	},

	GS2U_KillingValueChange = 
	{
		fields = "playerId,killingValue,Li",
	},

	GS2U_LoginLineUpNum = 
	{
		fields = "num,s",
	},

	GS2U_LoginResult = 
	{
		fields = "result,i",
	},

	GS2U_LookInfoPlayer = 
	{
		fields = "code,name,x,y,career,camp,sex,move_speed,level,hp_per,mountId,mountDegree,wing,pet_list,$move_list,$buffs,visible_equips,$jump,battleState,killCompareId,guildId,guildName,rank,pkValue,soulLv,fashionList,head,title,equipStrengLv,LzffBbbfsBSB12345uiiLziii6iii",
		[1] = {
			fields = "x,y,ff",
		},
		[2] = {
			fields = "buffUID,buffID,time,LII",
		},
		[3] = {
			fields = "jumpBeginX,jumpBeginY,jumpTargetX,jumptargetY,jumpHigh,jumpTime,ffffff",
		},
	},

	GS2U_MapLine = 
	{
		fields = "$lines,1",
		[1] = {
			fields = "line,num,ii",
		},
	},

	GS2U_MissionObjectGatherIdes = 
	{
		fields = "code,objectIdes,L1",
	},

	GS2U_MissionObjectList = 
	{
		fields = "$missionObj_list,firstEnterMap,ut",
		[1] = {
			fields = "code,id,x,y,rotW,nextCanCollectTime,LIfffi",
		},
	},

	GS2U_MonsterChangeState = 
	{
		fields = "code,toState,reamin,Lii",
	},

	GS2U_MonsterList = 
	{
		fields = "$monster_list,firstEnterMap,ut",
		[1] = {
			fields = "code,id,x,y,rotW,targetX,targetY,move_speed,attack_speed,moveStatus,hp_per,camp,usercode,$buffs,battleState,battleCompareId,state,reamin,name,LIfffffffBSbL1iLiiz",
			[1] = {
				fields = "buffUID,buffID,time,LII",
			},
		},
	},

	GS2U_MoveInfo = 
	{
		fields = "code,$posInfos,L1",
		[1] = {
			fields = "x,y,ff",
		},
	},

	GS2U_NpcList = 
	{
		fields = "$npc_list,u",
		[1] = {
			fields = "code,id,x,y,rotW,name,actionStatus,title,LIfffzIz",
		},
	},

	GS2U_OffLineMsgList = 
	{
		fields = "$list,1",
		[1] = {
			fields = "sendId,name,time,content,Lziz",
		},
	},

	GS2U_OpenSystem = 
	{
		fields = "openSystem,1",
	},

	GS2U_PetList = 
	{
		fields = "$pet_list,u",
		[1] = {
			fields = "code,id,name,playerCode,x,y,targetX,targetY,move_speed,hp_per,camp,pkMode,$buffs,killCompareId,guildId,killingValue,lv,LIzLfffffBbB1iLii",
			[1] = {
				fields = "buffUID,buffID,time,LII",
			},
		},
	},

	GS2U_PlayerAddExp = 
	{
		fields = "curExp,addExp,isAddper,lit",
	},

	GS2U_PlayerBaseInfo = 
	{
		fields = "$baseInfo,u",
		[1] = {
			fields = "code,name,x,y,level,camp,career,sex,vip,hp_per,exp,maxExp,cur_hp,pkMode,$moneys,visible_equips,guildId,guildName,guildRank,mountId,mountDegree,wing,soulLv,fashionList,$buffs,head,title,equipStrengLv,createTime,levelChangeTime,angerValue,LzffsbbbbBllIB12LziiB3i45iiiiii",
			[1] = {
				fields = "moneyType,value,BI",
			},
			[2] = {
				fields = "buffUID,buffID,time,LII",
			},
		},
	},

	GS2U_PlayerChangedWealth = 
	{
		fields = "type,wealth,reason,changeUid,IISL",
	},

	GS2U_PlayerHp = 
	{
		fields = "code,hp,LI",
	},

	GS2U_PlayerLevelUp = 
	{
		fields = "code,curExp,maxExp,addExp,level,levelChangeTime,LlliBi",
	},

	GS2U_PlayerRevive = 
	{
		fields = "mapId,x,y,curHp,maxHp,SffII",
	},

	GS2U_RespChatVoice = 
	{
		fields = "count,index,key,data,BBL1",
	},

	GS2U_RespChatVoiceError = 
	{
		fields = "key,errorCode,LB",
	},

	GS2U_RespDayBuyInfo = 
	{
		fields = "daybuy,l",
	},

	GS2U_RespDayBuyReward = 
	{
		fields = "err,b",
	},

	GS2U_RespTurnPlateInfo = 
	{
		fields = "count,b",
	},

	GS2U_RespTurnPlateReward = 
	{
		fields = "num,err,sb",
	},

	GS2U_ResponseNextMenu = 
	{
		fields = "id,i",
	},

	GS2U_SelPlayerResult = 
	{
		fields = "result,i",
	},

	GS2U_ServerTimeZone = 
	{
		fields = "timeZone,I",
	},

	GS2U_StopMove = 
	{
		fields = "code,posX,posY,Lff",
	},

	GS2U_TakeBackPet = 
	{
		fields = "code,1",
	},

	GS2U_TipsString = 
	{
		fields = "type,id,params,Bi1",
	},

	GS2U_TransferNewPos = 
	{
		fields = "code,$pos,reason,LuB",
		[1] = {
			fields = "x,y,ff",
		},
	},

	GS2U_UserPlayerList = 
	{
		fields = "$info,1",
		[1] = {
			fields = "roleID,name,level,camp,career,sex,mapID,oldMapID,canRename,visible_equips,fashionList,wing,head,equipStrengLv,fightPoint,LzibbbSSt123iii",
		},
	},

	U2GS_CancelEnterMap = 
	{
	},

	U2GS_ChangeMapLine = 
	{
		fields = "line,i",
	},

	U2GS_ChangeName = 
	{
		fields = "roleID,name,Lz",
	},

	U2GS_ChatInfo = 
	{
		fields = "channel,receiverID,receiverName,content,bLzz",
	},

	U2GS_ChatVoice = 
	{
		fields = "count,index,key,data,BBL1",
	},

	U2GS_ChatVoiceKey = 
	{
		fields = "seed,i",
	},

	U2GS_CheckEntity = 
	{
		fields = "roleID,L",
	},

	U2GS_DigTransferMap = 
	{
		fields = "reason,mapId,x,y,Biff",
	},

	U2GS_EnteredMap = 
	{
	},

	U2GS_Feedback = 
	{
		fields = "str,z",
	},

	U2GS_HeartBeat = 
	{
		fields = "serverTime,I",
	},

	U2GS_HeartBeatReal = 
	{
		fields = "time,I",
	},

	U2GS_Jump = 
	{
	},

	U2GS_LeaveBlock = 
	{
	},

	U2GS_MoveTo = 
	{
		fields = "code,$posInfos,L1",
		[1] = {
			fields = "x,y,ff",
		},
	},

	U2GS_Photo = 
	{
		fields = "time,s",
	},

	U2GS_ReqChatVoice = 
	{
		fields = "key,L",
	},

	U2GS_ReqDayBuyReward = 
	{
		fields = "id,b",
	},

	U2GS_ReqTurnPlateInfo = 
	{
	},

	U2GS_ReqTurnPlateReward = 
	{
		fields = "num,s",
	},

	U2GS_RequestChangeCamp = 
	{
		fields = "camp,i",
	},

	U2GS_RequestCreatePlayer = 
	{
		fields = "name,career,sex,zbb",
	},

	U2GS_RequestDeletePlayer = 
	{
		fields = "roleID,L",
	},

	U2GS_RequestLogin = 
	{
		fields = "protocolVer,platformAccount,platformName,deviceId,serverId,thirdPartyAcoount,imei,mac,platformToken,izzzizzzz",
	},

	U2GS_RequestMapLine = 
	{
	},

	U2GS_RequestNextMenu = 
	{
	},

	U2GS_RequestPlayerBaseInfo = 
	{
	},

	U2GS_RequestRevive = 
	{
	},

	U2GS_RequestReviveCost = 
	{
	},

	U2GS_SelPlayerEnterGame = 
	{
		fields = "roleID,L",
	},

	U2GS_StopMove = 
	{
		fields = "code,posX,posY,Lff",
	},

	U2GS_UseActiveCode = 
	{
		fields = "code,z",
	},

}
