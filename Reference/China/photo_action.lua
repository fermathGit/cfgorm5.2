local __rt_1 = {
	action_name = "@368329"
}
local __rt_2 = {
	action_anni = "dead"
}
local __rt_3 = {
	action_anni = "run",
	action_name = "@406006"
}
local __rt_4 = {
	action_anni = "combo_1,combo_2,combo_3,combo_4,combo_5",
	action_name = "@426064"
}
local __rt_5 = {
	action_anni = "skill_3_1,skill_3_2",
	action_name = "@54541"
}
local __rt_6 = {
	action_anni = "skill_4_1,skill_4_2,skill_4_3",
	action_name = "@384058"
}
local __rt_7 = {
	action_anni = "skill_5_1,skill_5_2",
	action_name = "@363642"
}
local __rt_8 = {
	action_anni = "skill_1",
	action_name = "@249312"
}
local photo_action = 
{
	[101] = {
		action_anni = "skill_3_1,skill_3_2,skill_3_3",
		action_name = "@444083"
	},
	[102] = {
		action_anni = "skill_6_1,skill_6_2",
		action_name = "@249312"
	},
	[103] = {
		action_anni = "skill_4",
		action_name = "@54541"
	},
	[104] = {
		action_anni = "skill_2",
		action_name = "@384058"
	},
	[105] = {
		action_anni = "skill_5_1,skill_5_2,skill_5_3",
		action_name = "@363642"
	},
	[106] = __rt_1,
	[107] = __rt_2,
	[108] = __rt_3,
	[109] = __rt_4,
	[201] = {
		action_anni = "skill_1_1,skill_1_2",
		action_name = "@444083"
	},
	[202] = {
		action_anni = "skill_2_1,skill_2_2",
		action_name = "@249312"
	},
	[203] = __rt_5,
	[204] = __rt_6,
	[205] = __rt_7,
	[206] = __rt_1,
	[207] = __rt_2,
	[208] = __rt_3,
	[209] = __rt_4,
	[301] = {
		action_anni = "skill_4_1,skill_4_2",
		action_name = "@444083"
	},
	[302] = __rt_8,
	[303] = {
		action_anni = "skill_2_2",
		action_name = "@54541"
	},
	[304] = {
		action_anni = "skill_3_1,skill_3_2,skill_3_3",
		action_name = "@384058"
	},
	[305] = {
		action_anni = "skill_5_1,skill_5_2,skill_5_3,skill_5_4",
		action_name = "@363642"
	},
	[306] = __rt_1,
	[307] = __rt_2,
	[308] = __rt_3,
	[309] = __rt_4,
	[401] = {
		action_anni = "skill_2_1,skill_2_2,skill_2_3",
		action_name = "@444083"
	},
	[402] = __rt_8,
	[403] = __rt_5,
	[404] = __rt_6,
	[405] = __rt_7,
	[406] = __rt_1,
	[407] = __rt_2,
	[408] = __rt_3,
	[409] = __rt_4
}
local __default_values = {
	action_anni = "battlewin",
	action_name = "@143343"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( photo_action ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( photo_action, { __default = __default_values, __hash = 0x4eda09f1, __masked = false } )
end

return photo_action
