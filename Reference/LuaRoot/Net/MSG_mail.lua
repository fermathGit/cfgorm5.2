return {
	GS2U_AddMailInfo = 
	{
		fields = "$addMail,u",
		[1] = {
			fields = "type,mailID,mailTitle,mailSendTime,isRead,ishaveAttach,ilzitt",
		},
	},

	GS2U_DeleteMail = 
	{
		fields = "mailID,1",
	},

	GS2U_DeleteMailAttachment = 
	{
		fields = "mailID,1",
	},

	GS2U_MailDetail = 
	{
		fields = "$detail,u",
		[1] = {
			fields = "mailID,mailTitle,mailContent,mailContentParms,$itemList,$coinList,lzi123",
			[1] = {
				fields = "itemID,itemNumber,isBind,IIt",
			},
			[2] = {
				fields = "coinType,coinNum,BI",
			},
		},
	},

	GS2U_MailInfo = 
	{
		fields = "$mailInfoList,1",
		[1] = {
			fields = "type,mailID,mailTitle,mailSendTime,isRead,ishaveAttach,ilzitt",
		},
	},

	U2GS_DeleteMail = 
	{
		fields = "mailID,l",
	},

	U2GS_GetMailAttachment = 
	{
		fields = "mailID,l",
	},

	U2GS_ReadMail = 
	{
		fields = "mailID,l",
	},

}
