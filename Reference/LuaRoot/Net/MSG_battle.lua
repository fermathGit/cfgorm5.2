return {
	C2S_PlayerUseShiftSkill = 
	{
		fields = "code,skillId,serial,targetCodeList,$sprint,$actionMove,Lii1uu",
		[1] = {
			fields = "x,y,ff",
		},
		[2] = {
			fields = "x,y,ff",
		},
	},

	C2S_PlayerUseSkill = 
	{
		fields = "code,skillId,serial,targetCodeList,Lii1",
	},

	GS2U_AttackOffsetEffect = 
	{
		fields = "userCode,skillId,serial,code,x,y,LiiLff",
	},

	GS2U_AttackResult = 
	{
		fields = "userCode,targetCode,skillId,serial,result,bhp_per,diffHp,damageHp,LLii1Si2",
	},

	GS2U_AttackResultEx = 
	{
		fields = "userCode,targetCode,skillId,serial,result,bhp_per,diffHp,damageHp,LLii1Bi2",
	},

	GS2U_BattleHpRecoverResult = 
	{
		fields = "remainTime,hp,ii",
	},

	GS2U_BreakSkill = 
	{
		fields = "userCode,skillId,serial,Lii",
	},

	GS2U_ChangeBattleFieldId = 
	{
		fields = "roleId,id,LL",
	},

	GS2U_ChangeFightState = 
	{
		fields = "roleId,state,Lb",
	},

	GS2U_ChangeOwnerId = 
	{
		fields = "id,ownerId,LL",
	},

	GS2U_Dead = 
	{
		fields = "deadActorCode,killerCode,skillID,LLi",
	},

	GS2U_FixPlayerHp = 
	{
		fields = "hp,i",
	},

	GS2U_ForceDeadNow = 
	{
		fields = "deadActorCode,killerCode,killerName,skillID,LLzi",
	},

	GS2U_MonsterSpeed = 
	{
		fields = "code,speed,moveStatus,LfB",
	},

	GS2U_PkValue = 
	{
		fields = "value,i",
	},

	GS2U_PlayerDead = 
	{
		fields = "diedCode,killerName,canHandNormalRelive,reaminTime,canSituRelive,addBuffId,moneyType,moneyValue,Lztitiii",
	},

	GS2U_SprintFailed = 
	{
		fields = "userCode,skillId,serial,x,y,Liiff",
	},

	GS2U_UseSkillFailed = 
	{
		fields = "userCode,skillId,serial,type,Liii",
	},

	GS2U_UseSkillToObject = 
	{
		fields = "userCode,skillId,serial,targetCodeList,Lii1",
	},

	GS2U_UseSkillToPos = 
	{
		fields = "userCode,skillId,serial,targetCodeList,$sprint,$actionMove,Lii1uu",
		[1] = {
			fields = "x,y,ff",
		},
		[2] = {
			fields = "x,y,ff",
		},
	},

	GS2U_UseSpeSkillSuccess = 
	{
		fields = "skillId,serial,ii",
	},

	U2GS_BattleHpRecover = 
	{
	},

	U2GS_ChangeFightState = 
	{
		fields = "state,b",
	},

	U2GS_GetPkValue = 
	{
	},

}
