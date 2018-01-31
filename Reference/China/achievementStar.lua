local achievementStar = 
{
	{
		item = 1000009
	},
	{
		item = 32202,
		num = 50,
		star = 40
	},
	{
		num = 50,
		star = 60
	},
	{
		item = 313600,
		star = 80
	},
	{
		item = 32403,
		num = 100,
		star = 100
	}
}
local __default_values = {
	item = 15100,
	num = 1,
	star = 20
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( achievementStar ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( achievementStar, { __default = __default_values, __hash = 0x7e3cd8c6, __masked = false } )
end

return achievementStar
