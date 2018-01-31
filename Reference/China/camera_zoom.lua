local camera_zoom = 
{
	{
		desc = "@449893",
		zoom_dis = -9,
		zoom_time = 0.3
	},
	{
		desc = "@47119",
		reset_time = 1,
		zoom_dis = 7
	},
	{
		desc = "@254119",
		zoom_dis = 4,
		zoom_time = 1.2
	},
	{
		desc = "@126265",
		reset_time = 1.5,
		zoom_dis = -7
	},
	{
		zoom_dis = -4,
		zoom_time = 0.4
	},
	{
	},
	{
		zoom_time = 0
	},
	{
		reset_time = 1
	},
	{
		desc = "@34216",
		zoom_dis = 4,
		zoom_time = 0.3
	},
	{
		desc = "@155730",
		reset_time = 2,
		zoom_dis = -6
	},
	{
		desc = "@516868",
		zoom_dis = 0,
		zoom_time = 0
	},
	{
		desc = "@28172",
		zoom_dis = 4
	},
	{
		desc = "@145635",
		zoom_dis = 3,
		zoom_time = 0.8
	},
	{
		desc = "@510402",
		zoom_dis = 0,
		zoom_time = 0
	},
	{
		desc = "@267764",
		zoom_dis = 3
	},
	{
		desc = "@383654",
		zoom_dis = -12,
		zoom_time = 0.9
	}
}
local __default_values = {
	desc = "@313080",
	reset_time = 0,
	zoom_dis = 1,
	zoom_time = 0.1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( camera_zoom ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( camera_zoom, { __default = __default_values, __hash = 0x495101bc, __masked = false } )
end

return camera_zoom
