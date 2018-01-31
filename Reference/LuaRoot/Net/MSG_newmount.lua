return {
	GS2U_GetAllMount = 
	{
		fields = "$mounts,1",
		[1] = {
			fields = "id,degree,star,num,quality,restTime,select,iiiBiit",
		},
	},

	GS2U_MountUpDegreeChange = 
	{
		fields = "roleId,mountDegree,LB",
	},

	GS2U_MountUpDown = 
	{
		fields = "roleId,id,mountDegree,LiB",
	},

	GS2U_MountUpQualitySucc = 
	{
		fields = "$info,u",
		[1] = {
			fields = "id,degree,star,num,quality,restTime,select,iiiBiit",
		},
	},

	GS2U_MountUpStar = 
	{
		fields = "isSucce,moneyType,moneyNum,$info,tBiu",
		[1] = {
			fields = "id,degree,star,num,quality,restTime,select,iiiBiit",
		},
	},

	GS2U_MountUpStarOnKey = 
	{
		fields = "moneyType,moneyNum,$itemCostList,$info,Bi1u",
		[1] = {
			fields = "itemId,itemNum,ii",
		},
		[2] = {
			fields = "id,degree,star,num,quality,restTime,select,iiiBiit",
		},
	},

	GS2U_NoticeAddMount = 
	{
		fields = "$info,u",
		[1] = {
			fields = "id,degree,star,num,quality,restTime,select,iiiBiit",
		},
	},

	GS2U_ReturnMountUpDegree = 
	{
		fields = "$info,u",
		[1] = {
			fields = "id,degree,star,num,quality,restTime,select,iiiBiit",
		},
	},

	U2GS_ActiveNewMount = 
	{
		fields = "id,i",
	},

	U2GS_GetAllMount = 
	{
	},

	U2GS_MountUpDegree = 
	{
		fields = "id,i",
	},

	U2GS_MountUpDown = 
	{
		fields = "id,i",
	},

	U2GS_MountUpQuality = 
	{
		fields = "id,i",
	},

	U2GS_MountUpStar = 
	{
		fields = "id,isOneKey,it",
	},

}
