return {
	CollectSuccess = 
	{
		fields = "gatherId,L",
	},

	GS2U_BreakCollect = 
	{
		fields = "gatherId,roleId,LL",
	},

	GS2U_GetAllTask = 
	{
		fields = "$tasks,finishIdes,12",
		[1] = {
			fields = "id,complete,num,its",
		},
	},

	GS2U_NoticeAccpetOrCompleteTask = 
	{
		fields = "$task,u",
		[1] = {
			fields = "id,complete,num,its",
		},
	},

	GS2U_SubmitTask = 
	{
		fields = "id,i",
	},

	U2GS_BeginCollect = 
	{
		fields = "gatherId,L",
	},

	U2GS_ChoosePetTask = 
	{
		fields = "petId,i",
	},

	U2GS_GetAllTask = 
	{
	},

	U2GS_SetCompleteDialogue = 
	{
		fields = "id,i",
	},

	U2GS_SubmitTask = 
	{
		fields = "id,isDouble,it",
	},

}
