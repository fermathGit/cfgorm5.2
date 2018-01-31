local deviceInfo = {
	phoneBrand = nil,
	phoneModel = nil,
	phoneMaxRAM = 0,
	phoneAvailableRAM = 0,
	phoneCpuName = nil,
	phoneCpuFrequency = nil,
	phoneCpuCores = nil,
}

local _DevicesInfo = PlatformHelper.DevicesInfo

deviceInfo.phoneBrand = _DevicesInfo.GetPhoneBrand()
deviceInfo.phoneModel = _DevicesInfo.GetPhoneModel()
deviceInfo.phoneMaxRAM = _DevicesInfo.GetPhoneMaxRAM()
deviceInfo.phoneAvailableRAM = _DevicesInfo.GetAvavibleRAM()
deviceInfo.phoneCpuName = _DevicesInfo.GetPhoneCPUName()
deviceInfo.phoneCpuFrequency = _DevicesInfo.GetPhoneCPUFrequency()
deviceInfo.phoneCpuCores = _DevicesInfo.GetPhoneCores()

print( "lua DeviceInfo exit." )


return deviceInfo

