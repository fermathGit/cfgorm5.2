return {
	GS2U_GetAllPets = 
	{
		fields = "$pets,1",
		[1] = {
			fields = "uid,id,name,level,exp,talent,hp,time,fight,skillGrild,isLocked,$skills,$hones,LizBLfiiiit12",
			[1] = {
				fields = "id,level,index,iBB",
			},
			[2] = {
				fields = "index,type,value,breakCount,max,BBfBf",
			},
		},
	},

	GS2U_GetUpPets = 
	{
		fields = "index,indexs,$upPets,b12",
		[1] = {
			fields = "uid,id,name,level,exp,talent,hp,time,fight,skillGrild,isLocked,$skills,$hones,LizBLfiiiit12",
			[1] = {
				fields = "id,level,index,iBB",
			},
			[2] = {
				fields = "index,type,value,breakCount,max,BBfBf",
			},
		},
	},

	GS2U_NoticePetCurHp = 
	{
		fields = "uid,hp,Li",
	},

	GS2U_NoticePetRevive = 
	{
		fields = "uid,hp,Li",
	},

	GS2U_PetBreak = 
	{
		fields = "uid,index,breakCount,max,LBBf",
	},

	GS2U_PetDevour = 
	{
		fields = "uid2,$info,1u",
		[1] = {
			fields = "uid,id,name,level,exp,talent,hp,time,fight,skillGrild,isLocked,$skills,$hones,LizBLfiiiit12",
			[1] = {
				fields = "id,level,index,iBB",
			},
			[2] = {
				fields = "index,type,value,breakCount,max,BBfBf",
			},
		},
	},

	GS2U_PetFit = 
	{
		fields = "index,b",
	},

	GS2U_PetForgetSkill = 
	{
		fields = "uid,index,LB",
	},

	GS2U_PetStudySkill = 
	{
		fields = "uid,index,id,level,LBiB",
	},

	GS2U_PetUpgradeSkill = 
	{
		fields = "uid,index,id,level,LBiB",
	},

	GS2U_Petup = 
	{
		fields = "index,uid,indexs,uids,bL12",
	},

	LockPet = 
	{
		fields = "petId,lock,Lt",
	},

	U2GS_GetAllPets = 
	{
	},

	U2GS_PetBreak = 
	{
		fields = "uid,index,LB",
	},

	U2GS_PetDevour = 
	{
		fields = "uid1,uid2,L1",
	},

	U2GS_PetFit = 
	{
		fields = "index,status,Bt",
	},

	U2GS_PetForgetSkill = 
	{
		fields = "uid,index,LB",
	},

	U2GS_PetStudySkill = 
	{
		fields = "uid,index,id,LBi",
	},

	U2GS_PetUpgradeSkill = 
	{
		fields = "uid,index,id,LBi",
	},

}
