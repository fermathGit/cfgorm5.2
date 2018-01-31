local girlitem = 
{
	{
		Ornam_base = 1,
		Ornam_icon = 41,
		Ornam_name = "@245523",
		time = 1
	},
	{
		Ornam_base = 1,
		Ornam_icon = 43,
		Ornam_mord = "fox_hair_1",
		Ornam_type = 2,
		sort = 2,
		time = 1
	},
	{
		Ornam_base = 1,
		Ornam_mord = "fox_face_1",
		Ornam_name = "@509060",
		Ornam_type = 6,
		sort = 3,
		time = 1
	},
	{
		Ornam_icon = 95001,
		Ornam_mord = "fox_body_2",
		Ornam_name = "@407056",
		sort = 4
	},
	{
		Ornam_icon = 95100,
		Ornam_mord = "fox_hair_2",
		Ornam_name = "@474098",
		Ornam_type = 2,
		sort = 5
	},
	{
		Ornam_icon = 95200,
		Ornam_mord = "fox_ear_1",
		Ornam_name = "@93177",
		Ornam_type = 3,
		sort = 6
	},
	{
		Ornam_icon = 95201,
		Ornam_mord = "fox_ear_2",
		Ornam_name = "@177938",
		Ornam_type = 3,
		sort = 7
	},
	{
		Ornam_icon = 95400,
		Ornam_mord = "fox_tail_1",
		Ornam_name = "@485355",
		Ornam_type = 5,
		sort = 8
	}
}
local __default_values = {
	Ornam_base = 0,
	Ornam_icon = 10,
	Ornam_mord = "fox_body_1",
	Ornam_name = "@146277",
	Ornam_type = 1,
	sort = 1,
	time = 0
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( girlitem ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( girlitem, { __default = __default_values, __hash = 0x0fd95ee4, __masked = false } )
end

return girlitem
