local MessageType = require "Net.MessageType"

local hooks = {
	"MSG_GS2U_PetInfoList",
}

local _hooks = {}
for _, v in pairs( hooks ) do
	local id = MessageType[v]
	if id then
		_hooks[#_hooks + 1] = v
	else
		print( "invalid message type: "..v )
	end
end

return _hooks
