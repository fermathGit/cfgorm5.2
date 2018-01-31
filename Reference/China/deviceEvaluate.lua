local deviceEvaluate = 
{
	{
		DeviceName = "Coolpad",
		DeviceType = 0
	},
	{
		DeviceName = "iPhoneUnknown",
		DeviceType = 0
	},
	{
		DeviceName = "iPadUnknown",
		DeviceType = 0
	},
	{
		DeviceName = "iPhone4",
		DeviceType = 0
	},
	{
		DeviceName = "iPhone4S",
		DeviceType = 0,
		Level = 2
	},
	{
		DeviceName = "iPad2Gen",
		DeviceType = 0
	},
	{
		DeviceName = "iPadMini1Gen",
		DeviceType = 0
	},
	{
		DeviceName = "iPad3Gen",
		DeviceType = 0,
		Level = 3
	},
	{
		DeviceName = "iPad4Gen",
		DeviceType = 0,
		Level = 3
	},
	{
		DeviceName = "iPhone5",
		DeviceType = 0,
		Level = 2
	},
	{
		DeviceName = "iPhone5C",
		DeviceType = 0,
		Level = 2
	},
	{
		DeviceName = "iPhone5S",
		DeviceType = 0,
		Level = 3
	},
	{
		DeviceName = "iPhone6",
		DeviceType = 0,
		Level = 3
	},
	{
		DeviceName = "iPhone6S",
		DeviceType = 0,
		Level = 3
	},
	[1000] = {
		DeviceName = "Mali-400 MP",
		Level = 2
	},
	[1001] = {
		DeviceName = "Mali-450 MP",
		Level = 2
	},
	[1002] = {
		DeviceName = "Mali-T604",
		Level = 2
	},
	[1003] = {
		DeviceName = "Mali-T624",
		Level = 2
	},
	[1004] = {
		DeviceName = "Mali-T628",
		Level = 3
	},
	[1005] = {
		DeviceName = "Mali-T720",
		Level = 3
	},
	[1006] = {
		DeviceName = "Mali-T760",
		Level = 3
	},
	[1007] = {
		DeviceName = "PowerVR SGX 531"
	},
	[1008] = {
		DeviceName = "PowerVR SGX 530"
	},
	[1009] = {
		DeviceName = "PowerVR SGX 540"
	},
	[1010] = {
		DeviceName = "PowerVR SGX 543",
		Level = 2
	},
	[1011] = {
		DeviceName = "PowerVR SGX 543 MP3",
		Level = 2
	},
	[1012] = {
		DeviceName = "PowerVR SGX 543 MP4",
		Level = 2
	},
	[1013] = {
		DeviceName = "PowerVR SGX 544",
		Level = 2
	},
	[1014] = {
		DeviceName = "PowerVR SGX 544 MP2",
		Level = 3
	},
	[1015] = {
		DeviceName = "PowerVR SGX 544 MP3",
		Level = 3
	},
	[1016] = {
		DeviceName = "PowerVR SGX 544 MP4",
		Level = 3
	},
	[1017] = {
		DeviceName = "PowerVR G6200",
		Level = 3
	},
	[1018] = {
	},
	[1019] = {
		DeviceName = "Adreno 203"
	},
	[1020] = {
		DeviceName = "Adreno 205"
	},
	[1021] = {
		DeviceName = "Adreno 220"
	},
	[1022] = {
		DeviceName = "Adreno 225"
	},
	[1023] = {
		DeviceName = "Adreno 305",
		Level = 2
	},
	[1024] = {
		DeviceName = "Adreno 306",
		Level = 2
	},
	[1025] = {
		DeviceName = "Adreno 320",
		Level = 2
	},
	[1026] = {
		DeviceName = "Adreno 330",
		Level = 3
	},
	[1027] = {
		DeviceName = "Adreno 418",
		Level = 3
	},
	[1028] = {
		DeviceName = "Adreno 420",
		Level = 3
	},
	[1029] = {
		DeviceName = "Adreno 430",
		Level = 3
	},
	[1030] = {
		DeviceName = "Adreno 505",
		Level = 3
	},
	[1031] = {
		DeviceName = "Adreno 510",
		Level = 3
	},
	[1032] = {
		DeviceName = "Adreno 530",
		Level = 3
	},
	[1033] = {
		DeviceName = "Tegra 2",
		Level = 0
	},
	[1034] = {
		DeviceName = "Tegra 3",
		Level = 2
	},
	[1035] = {
		DeviceName = "Tegra 4",
		Level = 3
	},
	[1036] = {
		DeviceName = "Vivante GC400"
	},
	[1037] = {
		DeviceName = "Vivante GC600"
	},
	[1038] = {
		DeviceName = "Vivante GC800"
	},
	[1039] = {
		DeviceName = "Vivante GC1000"
	},
	[1040] = {
		DeviceName = "Vivante GC2000"
	},
	[1041] = {
		DeviceName = "Vivante GC4000"
	}
}
local __default_values = {
	DeviceName = "Adreno 200",
	DeviceType = 1,
	Level = 1
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( deviceEvaluate ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( deviceEvaluate, { __default = __default_values, __hash = 0x4a401332, __masked = false } )
end

return deviceEvaluate
