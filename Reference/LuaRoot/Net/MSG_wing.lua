return {
	GS2U_BroadCastWinglv = 
	{
		fields = "playerId,wing,L1",
	},

	GS2U_ReturnWingUpDegree = 
	{
		fields = "wingid,level,hadCount,iii",
	},

	GS2U_ReturnWingUpQuality = 
	{
		fields = "wingid,qua,ii",
	},

	GS2U_WingInfo = 
	{
		fields = "$host,$partlist,u1",
		[1] = {
			fields = "hadCount,level,ii",
		},
		[2] = {
			fields = "wingid,level,qua,hadCount,iiii",
		},
	},

	GS2U_WingUpFailed = 
	{
		fields = "errorcode,i",
	},

	GS2U_WingUpSuccess = 
	{
		fields = "wingid,level,hadCount,addAllCount,type,iiiii",
	},

	U2GS_RequestWingInfo = 
	{
	},

	U2GS_RequestWingUpDegree = 
	{
		fields = "wingId,i",
	},

	U2GS_RequestWingUpQuality = 
	{
		fields = "wingId,i",
	},

	U2GS_WingHole = 
	{
		fields = "upId,replaceId,ii",
	},

	U2GS_WingUp = 
	{
		fields = "wingId,upType,ii",
	},

}
