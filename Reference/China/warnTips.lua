local __rt_1 = {
}
local warnTips = 
{
	{
		__mask = "P",
		colour = {
			255,
			0,
			0
		},
		picture = "warning_1",
		tips1 = "@235166",
		tips2 = "@147629"
	},
	{
		__mask = "M",
		tips1 = "@263910",
		tips2 = "@87650"
	},
	{
		__mask = "M",
		tips1 = "@263910",
		tips2 = "@341702"
	},
	{
		__mask = "E",
		tips1 = "@235340"
	},
	{
		__mask = "E",
		tips1 = "@425768"
	},
	{
		__mask = "E",
		tips1 = "@288536"
	},
	{
		__mask = "E",
		tips1 = "@429903"
	},
	{
		__mask = "M",
		tips1 = "@235166",
		tips2 = "@436714"
	},
	{
		__mask = "M",
		tips1 = "@263910",
		tips2 = "@198562"
	},
	{
		__mask = "K",
		picture = "",
		tips2 = "@139911"
	},
	{
		__mask = "K",
		picture = "",
		tips2 = "@450588"
	},
	{
		__mask = "K",
		picture = "",
		tips2 = "@246852"
	},
	{
		__mask = "K",
		picture = "",
		tips2 = "@128164"
	}
}
local __default_values = {
	colour = __rt_1,
	picture = "warning_2",
	tips1 = "@33442",
	tips2 = "@180359"
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( warnTips ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( warnTips, { __default = __default_values, __hash = 0x3a09fdd9, __masked = true } )
end

return warnTips
