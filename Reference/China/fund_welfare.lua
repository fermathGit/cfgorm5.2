local fund_welfare = 
{
	{
		item = 924
	},
	{
		fund_num = 100,
		item = 73,
		needlevel = 30,
		num = 20
	},
	{
		fund_num = 200,
		needlevel = 40,
		num = 20
	},
	{
		fund_num = 350,
		item = 5803,
		needlevel = 50
	},
	[6] = {
		fund_num = 500,
		item = 925,
		needlevel = 70
	}
}
local __default_values = {
	fund_num = 1,
	item = 71,
	needlevel = 20,
	num = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( fund_welfare ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( fund_welfare, { __default = __default_values, __hash = 0x3e0f13bd, __masked = false } )
end

return fund_welfare
