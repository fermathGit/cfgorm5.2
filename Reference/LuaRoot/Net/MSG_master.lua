return {
	GS2U_ResponseMasterTask = 
	{
		fields = "taskid,i",
	},

	GS2U_ResponseMasterTaskList = 
	{
		fields = "getted,type,hadAcceptCount,immediatelyCount,finishCount,refreshCount,refreshProCount,autoRefreshTime,$taskList,bbbbbbbi1",
		[1] = {
			fields = "taskId,quaDataId,ii",
		},
	},

	GS2U_ResponseMasterTaskReward = 
	{
		fields = "succ,t",
	},

	U2GS_AcceptMasterTask = 
	{
		fields = "taskid,i",
	},

	U2GS_ImmediatelyCompleteMasterTask = 
	{
		fields = "taskid,i",
	},

	U2GS_RefreshMasterTaskList = 
	{
		fields = "type,b",
	},

	U2GS_RequestMasterTaskList = 
	{
	},

	U2GS_RequestMasterTaskReward = 
	{
	},

}
