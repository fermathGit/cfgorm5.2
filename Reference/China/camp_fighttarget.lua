local __rt_1 = {
	34,
	50
}
local __rt_2 = {
	34,
	100
}
local __rt_3 = {
	34,
	200
}
local __rt_4 = {
	34,
	300
}
local camp_fighttarget = 
{
	{
		describe = "@464698",
		icon = "Camp_victory",
		rewred = {
			5400,
			1
		},
		type = 0
	},
	{
		describe = "@11639",
		icon = "Camp_Kill_white",
		numb = 5,
		rewred = __rt_1
	},
	{
		icon = "Camp_Kill_green",
		numb = 10
	},
	{
		describe = "@211395",
		icon = "Camp_kill_blue",
		numb = 50,
		rewred = __rt_3
	},
	{
		describe = "@15551",
		icon = "Camp_Kill_purple",
		numb = 100,
		rewred = {
			20904,
			1
		}
	},
	{
		describe = "@97556",
		icon = "Camp_Assists_white",
		numb = 5,
		rewred = __rt_1,
		type = 2
	},
	{
		describe = "@289552",
		icon = "Camp_Assists_green",
		numb = 20,
		type = 2
	},
	{
		describe = "@18685",
		numb = 50,
		rewred = __rt_3,
		type = 2
	},
	{
		describe = "@31322",
		icon = "Camp_Assists_purple",
		numb = 150,
		rewred = __rt_4,
		type = 2
	},
	{
		describe = "@152970",
		icon = "Camp_integral_white",
		numb = 20,
		rewred = __rt_1,
		type = 3
	},
	{
		describe = "@117578",
		icon = "Camp_integral_green",
		numb = 100,
		type = 3
	},
	{
		describe = "@361894",
		icon = "Camp_integral_blue",
		numb = 300,
		rewred = __rt_3,
		type = 3
	},
	{
		describe = "@119454",
		icon = "Camp_integral_pruple",
		numb = 650,
		rewred = __rt_4,
		type = 3
	},
	{
		describe = "@483937",
		icon = "Camp_lose",
		rewred = {
			5401,
			1
		},
		type = 4
	},
	{
		describe = "@383795",
		icon = "Camp_tie",
		rewred = {
			34,
			800
		},
		type = 5
	}
}
local __default_values = {
	describe = "@107663",
	icon = "Camp_Assists_blue",
	numb = 1,
	rewred = __rt_2,
	show = 1,
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( camp_fighttarget ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( camp_fighttarget, { __default = __default_values, __hash = 0x3a559194, __masked = false } )
end

return camp_fighttarget
