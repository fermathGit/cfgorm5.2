local __rt_1 = {
	3,
	0
}
local __rt_2 = {
	{
		1,
		0
	},
	{
		2,
		0
	},
	__rt_1
}
local __rt_3 = {
	1,
	1
}
local __rt_4 = {
	2,
	1
}
local guild_rank_privilege = 
{
	{
		__mask = "ANA",
		name = "@361706",
		rank_appointment = 0,
		recruit = 0
	},
	{
		__mask = "gtA",
		level = 2,
		name = "@300735",
		rank_appointment = 0,
		recruit = 0,
		salaryNum = 120
	},
	{
		__mask = "ggA",
		level = 3,
		salaryNum = 150
	},
	{
		__mask = "9jA",
		auto_recruit = 1,
		construction = 1,
		edit_announcement = 1,
		fire = 1,
		level = 4,
		name = "@404559",
		open_events = {
			__rt_3,
			__rt_4,
			__rt_1
		},
		salaryNum = 200
	},
	{
		__mask = "/jA",
		auto_recruit = 1,
		change_name = 1,
		construction = 1,
		edit_announcement = 1,
		fire = 1,
		level = 5,
		name = "@271244",
		open_events = {
			__rt_3,
			__rt_4,
			{
				3,
				1
			}
		},
		salaryNum = 300
	}
}
local __default_values = {
	auto_recruit = 0,
	change_name = 0,
	construction = 0,
	edit_announcement = 0,
	fire = 0,
	level = 1,
	name = "@266486",
	open_events = __rt_2,
	rank_appointment = 1,
	recruit = 1,
	salaryBase = 10,
	salaryNum = 100,
	salaryType = 3
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( guild_rank_privilege ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( guild_rank_privilege, { __default = __default_values, __hash = 0x144b3602, __masked = true } )
end

return guild_rank_privilege
