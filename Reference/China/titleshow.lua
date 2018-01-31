local titleshow = 
{
	{
		Content = "@454614",
		Title = "@350255",
		Title_Name = "@355334",
		__mask = "Z"
	},
	{
		Content = "@489414",
		Title = "@206301",
		Title_Name = "@417547",
		__mask = "Z"
	},
	{
		Content = "@130997",
		Title = "@84918",
		Title_Name = "@127140",
		__mask = "Z"
	},
	{
		Content = "@306999",
		Title = "@429827",
		Title_Name = "@170092",
		__mask = "Z"
	},
	{
		Content = "@311880",
		Title = "@261717",
		Title_Name = "@162729",
		__mask = "Z"
	},
	{
		Content = "@295719",
		Title = "@37714",
		Title_Name = "@340730",
		__mask = "Z"
	},
	{
		Content = "@111611",
		Title = "@436572",
		__mask = "J"
	},
	{
		Content = "@250446",
		Title = "@154932",
		Title_Name = "@406035",
		__mask = "Z"
	},
	{
		Content = "@94309",
		Title = "@240991",
		Title_Name = "@413472",
		__mask = "Z"
	},
	{
		Title_Name = "@383120",
		__mask = "Q"
	},
	{
		Content = "@229837",
		Title = "@435095",
		Title_Name = "@476456",
		__mask = "Z"
	},
	{
		Content = "@480542",
		Title = "@291140",
		Title_Name = "@287752",
		__mask = "Z"
	}
}
local __default_values = {
	Content = "@105212",
	Speech = "",
	Title = "@135334",
	Title_Name = "@100133",
	VFX_Sound = "",
	show3_time = 5000
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( titleshow ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( titleshow, { __default = __default_values, __hash = 0x108a78fb, __masked = true } )
end

return titleshow
