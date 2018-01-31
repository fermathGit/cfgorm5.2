local __rt_1 = {
	__mask = "I",
	time_delay = 500
}
local __rt_2 = {
	__mask = "I",
	time_delay = 200
}
local __rt_3 = {
	__mask = "I",
	time_delay = 100
}
local __rt_4 = {
	__mask = "I",
	time_delay = 300
}
local camera_shake = 
{
	{
		__mask = "T",
		shake_power = 0.9,
		shake_time = 0.4,
		use_wave = 1
	},
	{
		__mask = "R",
		shake_power = 1.5,
		use_wave = 1
	},
	{
		__mask = "R",
		shake_power = 2,
		use_wave = 1
	},
	{
		__mask = "T",
		shake_power = 0.65,
		shake_time = 0.3,
		use_wave = 1
	},
	{
		__mask = "R",
		shake_power = 3,
		use_wave = 1
	},
	{
		__mask = "R",
		shake_power = 5,
		use_wave = 1
	},
	{
		__mask = "T",
		shake_power = 0.35,
		shake_time = 0.3,
		use_wave = 1
	},
	[101] = __rt_1,
	[102] = __rt_1,
	[103] = {
		__mask = "I",
		time_delay = 400
	},
	[104] = __rt_2,
	[105] = __rt_2,
	[106] = __rt_3,
	[107] = __rt_3,
	[108] = __rt_2,
	[109] = __rt_3,
	[110] = __rt_4,
	[111] = __rt_4,
	[112] = {
		__mask = "I",
		time_delay = 1000
	},
	[113] = __rt_3,
	[114] = __rt_2,
	[115] = __rt_3
}
local __default_values = {
	shake_power = 0.8,
	shake_time = 0.5,
	shake_type = 0,
	time_delay = 0,
	use_wave = 99
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( camera_shake ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( camera_shake, { __default = __default_values, __hash = 0x58c6b955, __masked = true } )
end

return camera_shake
