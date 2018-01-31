local DatabaseTool = require "DatabaseTool"

EngineFFI = nil

if not EngineFFI then
	--package.loaded["EngineFFI"] = nil
	local _EngineFFI = require "EngineFFI"
	if _EngineFFI then
		_EngineFFI.Load()
		EngineFFI = _EngineFFI
	end
end

return {
	LoadFFI = function()
		if not EngineFFI then
			EngineFFI = require "EngineFFI"
			EngineFFI.Load()
		end
		return EngineFFI
	end,

	ReloadFFI = function()
		package.loaded["EngineFFI"] = nil
		EngineFFI = require "EngineFFI"
		EngineFFI.Load()
		return EngineFFI
	end,
}
