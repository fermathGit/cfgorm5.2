return {
	GS2U_ExpMedRateChange = 
	{
		fields = "$rate,u",
		[1] = {
			fields = "rate,remainTime,si",
		},
	},

	GS2U_ExpMedRateDelete = 
	{
		fields = "rate,s",
	},

	GS2U_ExpMedRateList = 
	{
		fields = "$rates,1",
		[1] = {
			fields = "rate,remainTime,si",
		},
	},

	GS2U_GirlBlessValueChange = 
	{
		fields = "$value,u",
		[1] = {
			fields = "id,remainTime,si",
		},
	},

	GS2U_GirlBlessValueDelete = 
	{
		fields = "id,s",
	},

	GS2U_GirlBlessValueList = 
	{
		fields = "$list,1",
		[1] = {
			fields = "id,remainTime,si",
		},
	},

	GS2U_ISMoveItemNeedKey = 
	{
		fields = "nextVerifyTime,i",
	},

	GS2U_InitBagItem = 
	{
		fields = "type,$items,B1",
		[1] = {
			fields = "itemID,itemUID,itemSum,isBind,expiredTime,iLiti",
		},
	},

	GS2U_InitCellInfoList = 
	{
		fields = "$slots,1",
		[1] = {
			fields = "type,max,used,bii",
		},
	},

	GS2U_ItemGroupReaminCount = 
	{
		fields = "group,remainNum,ss",
	},

	GS2U_RemoveItem = 
	{
		fields = "type,changeReason,deleteItems,Bi1",
	},

	GS2U_UIGetItemInfo = 
	{
		fields = "$list,bagId,1i",
		[1] = {
			fields = "itemID,itemSum,isBind,iit",
		},
	},

	GS2U_UpdateItem = 
	{
		fields = "type,changeUid,changeReason,changeNum,$updateItems,BLii1",
		[1] = {
			fields = "itemID,itemUID,itemSum,isBind,expiredTime,iLiti",
		},
	},

	MsgMoveItem = 
	{
		fields = "itemUID,source,target,key,LBBz",
	},

	MsgOpenCell = 
	{
		fields = "type,toCell,Bi",
	},

	U2GS_IsMoveItemNeedKey = 
	{
	},

	U2GS_SellItem = 
	{
		fields = "itemUIDes,1",
	},

	U2GS_SetStoreKey = 
	{
		fields = "oldKey,nowKey,zz",
	},

	U2GS_SortBag = 
	{
		fields = "type,B",
	},

	U2GS_UseBagItem = 
	{
		fields = "itemUID,num,Li",
	},

	U2GS_UseBagItemToObject = 
	{
		fields = "itemUID,num,objectId,LiL",
	},

}
