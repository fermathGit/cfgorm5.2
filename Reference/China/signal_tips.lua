local signal_tips = 
{
	{
		__mask = "Q",
		type = 2
	},
	{
		__mask = "R",
		dec = "@521744",
		type = 2
	},
	{
		__mask = "R",
		dec = "@209929",
		type = 2
	},
	{
		__mask = "R",
		dec = "@86298",
		type = 2
	},
	{
		__mask = "R",
		dec = "@91880",
		type = 2
	},
	{
		__mask = "R",
		dec = "@482322",
		type = 2
	},
	{
		__mask = "R",
		dec = "@257122",
		type = 2
	},
	{
		__mask = "D",
		dec = "@496060",
		map = 2
	},
	{
		__mask = "D",
		dec = "@332994",
		map = 2
	},
	{
		__mask = "D",
		dec = "@169927",
		map = 2
	},
	{
		__mask = "D",
		dec = "@6859",
		map = 2
	},
	{
		__mask = "D",
		dec = "@379553",
		map = 2
	},
	{
		__mask = "D",
		dec = "@495812",
		map = 2
	},
	{
		__mask = "D",
		dec = "@357294",
		map = 2
	}
}
local __default_values = {
	dec = "@120144",
	map = 1,
	signal_tips_cd = 10,
	signal_tips_show = 3,
	type = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( signal_tips ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( signal_tips, { __default = __default_values, __hash = 0x723e2172, __masked = true } )
end

return signal_tips
