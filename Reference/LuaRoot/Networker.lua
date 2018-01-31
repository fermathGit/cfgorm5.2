local MessageType = require "Net.MessageType"
local DatabaseTool = require "DatabaseTool"
local xstr = require "std.xstr"
local MessageNameLut = {}
local LuaProtoVersion = -1

for k, v in pairs( MessageType ) do
	local isStr = type( k ) == "string"
	if isStr then
		if k ~= "__VERSION__" then
			MessageNameLut[v] = k
		else
			LuaProtoVersion = v
			print( string.format( "lua proto version: %d", v ) )
		end
	end
end

function __Lua_Networker_NetMessageCallback( id )
	local def = MessageType[id]
	if def then
		--print( "lua netmsg callback: "..tostring( id ) )
		--local msg = LuaNetProto.Deserialize( def )
		--print( DatabaseTool.SerializeTable( msg ) )
	else
		print( "unknown netmsg id: "..tostring( id ) )
	end
	return false
end

local function GetProtoName( id )
	return MessageNameLut[id]
end

local function ShowProtoDef( id_or_name )
	if type( id_or_name ) == "string" then
		id_or_name = MessageType[id_or_name] --convert id from name
	end
	local def = MessageType[id_or_name]
	if def then
		print( string.format( "proto %s[%d]", MessageNameLut[id_or_name], id_or_name ) )
		print( DatabaseTool.SerializeTable( def ) )
	else
		print( string.format( "proto id[%d] not found!", id_or_name ) )
	end
end

local function _CreateBase( t )
	if t == 't' then
		return false
	elseif t == 'z' then
		return ""
	elseif t == 'l' or t == 'L' then
		return "0" -- int64, uint64
	else
		return 0
	end
end

-- forward declaration
local _CreateTable = nil

local function _CreateValue( def, t, demo )
	t = string.sub( t, 1, 1 )
	if xstr.isdigit( t ) then
		local index = t - '0'
		local v = def[index]
		if type( v ) == "table" then
			return _CreateTable( v, demo )
		else
			return nil
		end
	else
		return _CreateBase( t )
	end
end

_CreateTable = function( def, demo )
	local proto = {}
	local fields = def.fields -- get all the fields as a string
	if not fields then
		return proto
	end
	local segs = {}
	local idx = 1
	for c in fields:gmatch( "([^,]+)" ) do
		segs[idx] = c
		idx = idx + 1
	end
	local count = idx - 1
	if count >= 2 then
		local fn = count - 1 -- fields number
		local fdef = segs[count] -- the last one is types string
		if fn == #fdef then
			local fi = 1
			for t in fdef:gmatch( "." ) do
				local n = segs[fi]
				local leading = string.sub( n, 1, 1 )
				local v = nil
				if leading == "$" then
					n = string.sub( n, 2 ) -- remove the leading char
					v = {}
					if demo then
						v[1] = _CreateValue( def, t, demo )
					end
				else
					v = _CreateValue( def, t, demo )
				end
				proto[n] = v
				fi = fi + 1
			end
		end
	end
	return proto
end

local function CreateProto( id_or_name, demo )
	if type( id_or_name ) == "string" then
		id_or_name = MessageType[id_or_name] --convert id from name
	end
	local def = MessageType[id_or_name]
	if def then
		local ret = _CreateTable( def, demo )
		if ret then
			ret.getId = function()
				return id_or_name
			end
		end
		return ret
	end
end

local function ShowMessageContent( msg )
	print( DatabaseTool.SerializeTable( msg ) )
end

local function ShowMessageTemplate( id_or_name )
	print( DatabaseTool.SerializeTable( CreateProto( id_or_name, true ) ) )
end

local function SendMessage( msg, id )
	id = id or msg:getId()
	local def = MessageType[id]
	if not def then
		print( string.format( "undefine message type id: %d", id ) )
		return
	end
	LuaNetProto.SendRawMessage( def, msg, id )
end

local function GetHookedMessages()
	package.loaded["NetMsgHook"] = nil
	return require "NetMsgHook"
end

local function GetMsgSignatureInfo()
	return require "Net.ProtocalSignature"
end

return {
	SendMessage = SendMessage,
	GetProtoName = GetProtoName,
	ShowProtoDef = ShowProtoDef,
	ShowMessageContent = ShowMessageContent,
	ShowMessageTemplate = ShowMessageTemplate,
	CreateProto = CreateProto,
	SendMessage = SendMessage,
	GetHookedMessages = GetHookedMessages,
	GetMsgSignatureInfo = GetMsgSignatureInfo,
}

