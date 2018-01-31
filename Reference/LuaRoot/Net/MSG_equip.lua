return {
	GS2U_ActiveEquipSucce = 
	{
		fields = "$equipItem,u",
		[1] = {
			fields = "id,coolTime,$attris1,ii1",
			[1] = {
				fields = "type,key,value,rate,BBfi",
			},
		},
	},

	GS2U_EquipDurChange = 
	{
		fields = "type,equipDur,Bi",
	},

	GS2U_EquipStrengLvChange = 
	{
		fields = "roelId,lv,Li",
	},

	GS2U_GetAllEquip = 
	{
		fields = "$equips,1",
		[1] = {
			fields = "type,strengthLevel,strengthGrild,bless,upId,equipDur,$tree,$starlist,BBBiii12",
			[1] = {
				fields = "id,coolTime,$attris1,ii1",
				[1] = {
					fields = "type,key,value,rate,BBfi",
				},
			},
			[2] = {
				fields = "id,equipId,quality,propLv,rateVal,iiiii",
			},
		},
	},

	GS2U_StarGoEquip = 
	{
		fields = "$star,u",
		[1] = {
			fields = "id,equipId,quality,propLv,rateVal,iiiii",
		},
	},

	GS2U_StrengthEquip = 
	{
		fields = "part,$info,Bu",
		[1] = {
			fields = "level,grild,bless,succe,BBit",
		},
	},

	GS2U_StrengthEquipOneKey = 
	{
		fields = "part,$info,12",
		[1] = {
			fields = "level,grild,bless,succe,BBit",
		},
	},

	GS2U_UpEquip = 
	{
		fields = "id,i",
	},

	U2GS_ActiveEquip = 
	{
		fields = "id,i",
	},

	U2GS_DurEquip = 
	{
		fields = "isAll,type,tB",
	},

	U2GS_StarGoEquip = 
	{
		fields = "id,equipId,ii",
	},

	U2GS_StrengthEquip = 
	{
		fields = "part,firstKey,Bt",
	},

	U2GS_UpEquip = 
	{
		fields = "id,i",
	},

}
