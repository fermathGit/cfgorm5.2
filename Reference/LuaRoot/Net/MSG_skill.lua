return {
	GS2U_ActivatedSkillSuccess = 
	{
		fields = "code,$skillList,L1",
		[1] = {
			fields = "id,level,remainCD,used,iiit",
		},
	},

	GS2U_RemoveTempSkill = 
	{
		fields = "skillInfoList,1",
	},

	GS2U_SetSkillSuccess = 
	{
		fields = "code,unUseSkillList,useSkillList,L12",
	},

	GS2U_SkillInfoList = 
	{
		fields = "code,$skillInfoList,L1",
		[1] = {
			fields = "id,level,remainCD,used,iiit",
		},
	},

	GS2U_TempSkillAddList = 
	{
		fields = "$skillInfoList,1",
		[1] = {
			fields = "id,level,remainCD,used,iiit",
		},
	},

	GS2U_UpSkillSuccess = 
	{
		fields = "code,$skillInfoList,L1",
		[1] = {
			fields = "id,level,remainCD,used,iiit",
		},
	},

	U2GS_ActivatedSkill = 
	{
		fields = "code,id,Li",
	},

	U2GS_SetSkill = 
	{
		fields = "code,id,Li",
	},

	U2GS_upSkill = 
	{
		fields = "code,id,Li",
	},

}
