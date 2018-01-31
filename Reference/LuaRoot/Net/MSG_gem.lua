return {
	GS2U_DownGem = 
	{
		fields = "part,index,ii",
	},

	GS2U_GetAllGem = 
	{
		fields = "$gems,1",
		[1] = {
			fields = "part,$gems,i1",
			[1] = {
				fields = "id,po,iB",
			},
		},
	},

	GS2U_OneDownGem = 
	{
		fields = "part,i",
	},

	GS2U_UpGem = 
	{
		fields = "$gems,1",
		[1] = {
			fields = "part,$gems,i1",
			[1] = {
				fields = "id,po,iB",
			},
		},
	},

	U2GS_DownGem = 
	{
		fields = "part,po,iB",
	},

	U2GS_GetAllGem = 
	{
	},

	U2GS_OneDownGem = 
	{
		fields = "part,i",
	},

	U2GS_UpGem = 
	{
		fields = "$upGems,1",
		[1] = {
			fields = "part,id,po,iLB",
		},
	},

}
