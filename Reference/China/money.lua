local money = 
{
	{
		__mask = "cA",
		money_content = "@287702",
		money_icon = 1,
		money_name = "@486599"
	},
	{
		__mask = "cB",
		money_content = "@451587",
		money_icon = 2,
		money_name = "@335269",
		orderby = 2
	},
	{
		__mask = "cB",
		money_content = "@399343",
		money_icon = 3,
		money_name = "@332546",
		orderby = 3
	},
	{
		__mask = "cB",
		money_content = "@514759",
		money_icon = 4,
		money_name = "@231061",
		orderby = 4
	},
	{
		__mask = "cB",
		money_content = "@446127",
		money_icon = 5,
		money_name = "@335131",
		orderby = 5
	},
	{
		__mask = "cB",
		money_content = "@25275",
		money_icon = 6,
		money_name = "@62467",
		orderby = 6
	},
	{
		__mask = "VB",
		ifshow = 0,
		money_content = "@3273",
		money_name = "@510912",
		orderby = 7
	},
	{
		__mask = "NB",
		ifshow = 0,
		money_content = "@243735",
		money_icon = 8,
		orderby = 8
	},
	{
		__mask = "QB",
		money_name = "@419249",
		orderby = 9
	},
	{
		__mask = "dB",
		ifshow = 0,
		money_content = "@368173",
		money_icon = 9,
		money_name = "@79661",
		orderby = 10
	},
	[21] = {
		__mask = "9B",
		ifshow = 0,
		money_content = "@337300",
		money_icon = 21,
		money_name = "@237405",
		money_type = 1,
		orderby = 21
	},
	[22] = {
		__mask = "9B",
		ifshow = 0,
		money_content = "@332146",
		money_icon = 22,
		money_name = "@494985",
		money_type = 1,
		orderby = 22
	},
	[23] = {
		__mask = "9B",
		ifshow = 0,
		money_content = "@163873",
		money_icon = 23,
		money_name = "@387668",
		money_type = 1,
		orderby = 23
	}
}
local __default_values = {
	ifshow = 1,
	ifuse = 0,
	money_content = "@135716",
	money_icon = 7,
	money_name = "@124441",
	money_type = 0,
	orderby = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( money ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( money, { __default = __default_values, __hash = 0x2ca1ba12, __masked = true } )
end

return money
