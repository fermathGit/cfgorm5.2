return {
	GS2U_RecoverInfoSuccess = 
	{
		fields = "dataid,i",
	},

	GS2U_RecoverLastNoActiveInfo = 
	{
		fields = "$info,1",
		[1] = {
			fields = "dataid,count,ii",
		},
	},

	U2GS_LastNoActiveInfo = 
	{
	},

	U2GS_RecoverInfo = 
	{
		fields = "costType,dataid,ii",
	},

}
