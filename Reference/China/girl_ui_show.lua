local __rt_1 = {
}
local girl_ui_show = 
{
	{
		dec = "@46385"
	},
	{
		Ornam = {
			6,
			8
		}
	},
	{
		Ornam = {
			4,
			6
		}
	},
	{
		Ornam = {
			4,
			7,
			8
		}
	},
	{
		dec = "@480923"
	},
	{
		Ornam = {
			5,
			8
		}
	},
	{
		Ornam = {
			4,
			5,
			7
		}
	}
}
local __default_values = {
	Ornam = __rt_1,
	dec = ""
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( girl_ui_show ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( girl_ui_show, { __default = __default_values, __hash = 0x5b62f8f6, __masked = false } )
end

return girl_ui_show
