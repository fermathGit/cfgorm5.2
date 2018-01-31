local taskdescribe = 
{
	{
		Content = "@503625",
		Title_Name = "@510966",
		__mask = "F"
	},
	{
		Content = "@305691",
		Title_Name = "@174922",
		__mask = "F"
	},
	{
		Title_Name = "@319969",
		__mask = "E"
	},
	{
		Content = "@334265",
		Title_Name = "@154492",
		__mask = "F"
	},
	{
		Content = "@457786",
		Title_Name = "@50626",
		__mask = "F"
	},
	{
		Content = "@233612",
		Title_Name = "@139029",
		__mask = "F"
	},
	{
		Content = "@513766",
		Title_Name = "@455691",
		__mask = "F"
	},
	{
		Content = "@23330",
		Title_Name = "@43678",
		__mask = "F"
	},
	{
		Content = "@406429",
		Title_Name = "@161519",
		__mask = "F"
	},
	{
		Content = "@49872",
		__mask = "B"
	},
	{
		Content = "@2188",
		Title_Name = "@507128",
		__mask = "F"
	},
	{
		Content = "@467229",
		Title_Name = "@155451",
		__mask = "F"
	},
	{
		Content = "@331486",
		Title_Name = "@419377",
		__mask = "F"
	},
	[100] = {
		Content = "@498018",
		Title_Name = "@356434",
		__mask = "F"
	},
	[101] = {
		Content = "@410721",
		Title_Name = "@522302",
		__mask = "F"
	},
	[102] = {
		Content = "@333609",
		Title_Name = "@213410",
		__mask = "F"
	},
	[103] = {
		Content = "@345519",
		Title_Name = "@44401",
		__mask = "F"
	}
}
local __default_values = {
	Content = "@171486",
	Speech = "",
	Title_Name = "@137748",
	VFX = ""
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( taskdescribe ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( taskdescribe, { __default = __default_values, __hash = 0x6fc0d2fd, __masked = true } )
end

return taskdescribe
