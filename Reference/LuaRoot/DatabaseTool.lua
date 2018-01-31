local Root = "L:/Client"

if io and io.popen and not LuaTinker then
	local cd = io.popen( "cd" ):read( '*l' )
	print( "cd: "..cd )
	local s, e = string.find( cd, "Client" )
	if e then
		Root = string.sub( cd, 1, e )
	end
end

if arg and arg[1] then
	Root = arg[1]
elseif arg and arg[0] then
	local s, e = string.find( arg[0], "Client" )
	if e then
		Root = string.sub( arg[0], 1, e )
	end
end

Root = string.gsub( Root, '\\', '/' )
local DatabaseRoot = Root.."/Assets/StreamingAssets/Database"
local LuaRoot = Root.."/Assets/StreamingAssets/LuaRoot"

local DatabaseCodeRoot = Root.."/Assets/Code/Database"
local DefaultNumberSerializedFormat = "%.14g"
local NumberSerializedFormat = "%.14g"
local LanguageLeadingTag = "@"
local MaxLocalVariableNum = 190 -- lparser.c #define MAXVARS 200
local PrintTableRefCount = false
local DatasetCSNames = {}
local DatasetFieldNameBank = {}
local floor = math.floor
local fmod = math.mod or math.fmod
local gmatch = string.gmatch
local byte = string.byte

local AllSupportedLanguages = {
	["chs"] = true, -- 简体中文,
    ["cht"] = true, --繁体中文,　　　　
    ["eng"] = true, --英文,
    ["tha"] = true, --泰文
    ["rus"] = true, --俄文
    ["kor"] = true, --韩文
    ["jpn"] = true, --日文
    ["enu"] = true, --欧美,区分新马English
    ["vietnam"] = true, --越南
    ["version"] = true, --版署
}

if DBLib then
	print( "DatabaseTool: DBLib implement by C#" )
else
	print( "DatabaseTool: DBLib implement by Lua" )
end

local function HashString( v )
	local val = 0
	local c = 0
	for _c in gmatch( v, "." ) do
		c = byte( _c )
		val = val + c * 193951
		val = fmod( val, 0x7fffffff )
		val = val * 399283
		val = fmod( val, 0x7fffffff )
	end
	return val
end

local function FixDatasetFieldName( key )
	local fkey, _ = string.gsub( key, " ", "_" )
	DatasetFieldNameBank[ fkey ] = key
	return fkey, "DBCache.FID_"..fkey, tostring( #key )
end

local function EncodeEscapeString( s )
	local buf = {}
	buf[#buf + 1] = "\""
	string.gsub( s, ".",
		function ( c )
			if c == '\n' then
				buf[#buf + 1] = "\\n"
			elseif c == '\t' then
				buf[#buf + 1] = "\\t"
			elseif c == '\r' then
				buf[#buf + 1] = "\\r"
			elseif c == '\a' then
				buf[#buf + 1] = "\\a"
			elseif c == '\b' then
				buf[#buf + 1] = "\\b"
			elseif c == '\\' then
				buf[#buf + 1] = "\\\\"
			elseif c == '\"' then
				buf[#buf + 1] = "\\\""
			elseif c == '\'' then
				buf[#buf + 1] = "\\\'"
			elseif c == '\v' then
				buf[#buf + 1] = "\\\v"
			elseif c == '\f' then
				buf[#buf + 1] = "\\\f"
			else
				buf[#buf + 1] = c
			end
		end
	)
	buf[#buf + 1] = "\""
	return table.concat( buf, "" )
end

local DefaultVisitor = {
	recursive = true,
	iVisit = function( i, v, curPath )
		print( string.format( "%s[%d] = %s", curPath, i, tostring( v ) ) )
		return true
	end,
	nVisit = function( n, v, curPath )
		print( string.format( "%s[%g] = %s", curPath, n, tostring( v ) ) )
		return true
	end,
	sVisit = function( s, v, curPath )
		local _v = tostring( v )
		print( #curPath > 0 and curPath.."."..s.." = ".._v or s.." = ".._v )
		return true
	end,
	xVisit = function( k, v, curPath )
		local sk = tostring( k )
		local sv = tostring( v )
		print( #curPath > 0 and curPath.."."..sk.." = "..sv or sk.." = "..sv )
		return true
	end
}

local function WalkDataset( t, visitor, parent )
	if not parent then
		parent = ""
	end
	-- all integer key
	local continue = true
	if visitor.iVisit then
		for i, v in ipairs( t ) do
			local _t = type( v )
			if _t == "table" and visitor.recursive then
				continue = WalkDataset( v, visitor, string.format( "%s[%g]", parent, i ) )
			elseif _t == "string" or _t == "number" then
				continue = visitor.iVisit( i, v, parent )
			else
				-- not support value type
				if visitor.xVisit then
					continue = visitor.xVisit( i, v, parent )
				end
			end
			if not continue then
				return continue
			end
		end
	end

	local len = #t
	local keys = {}
	local idict = {}
	for k, v in pairs( t ) do
		local _t = type( k )
		if _t == "number" then
			local intKey = k == math.floor( k );
			if k > len or k <= 0 or not intKey then
				idict[k] = v
			end
		elseif _t == "string" then
			keys[#keys + 1] = k
		else
			--table, function, ...
			--not support data type for key
			if visitor.xVisit then
				continue = visitor.xVisit( k, v, parent )
			end
		end
		if not continue then
			return continue
		end
	end
	-- for all number keys those are not in array part
	-- key must be number
	for k, v in pairs( idict ) do
		local intKey = k == math.floor( k );
		local _t = type( v )
		if _t ~= "table" then
			if _t == "number" or _t == "string" then
				if intKey then
					if visitor.iVisit then
						continue = visitor.iVisit( k, v, parent )
					end
				else
					if visitor.nVisit then
						continue = visitor.nVisit( k, v, parent )
					end
				end
			else
				-- not support value data type
				if visitor.xVisit then
					continue = visitor.xVisit( k, v, parent )
				end
			end
		elseif visitor.recursive then
			if intKey then
				continue = WalkDataset( v, visitor, string.format( "%s[%d]", parent, k ) )
			else
				continue = WalkDataset( v, visitor, string.format( "%s[%g]", parent, k ) )
			end
		end
		if not continue then
			return continue
		end
	end
	-- sort all string keys
	table.sort( keys )
	-- for all none-table value
	local tableValue
	for k, v in pairs( keys ) do
		local value = t[v]
		local _t = type( value )
		if _t == "number" or _t == "string" then
			-- print all number or string value here
			if visitor.sVisit then
				continue = visitor.sVisit( v, value, parent )
			end
		elseif _t == "table" then
			-- for table value
			if not tableValue then
				tableValue = {}
			end
			tableValue[ k ] = v
		else
			if visitor.xVisit then
				continue = visitor.xVisit( v, value, parent )
			end
		end
		if not continue then
			return continue
		end
	end
	if visitor.recursive then
		-- for all table value
		if tableValue then
			for k, v in pairs( tableValue ) do
				local value = t[v]
				continue = WalkDataset( value, visitor, #parent > 0 and parent.."."..v or v )
				if not continue then
					return continue
				end
			end
		end
	end
	return continue
end


local function PrintDataset( t, parent )
	if not parent then
		parent = ""
	end
	-- all integer key
	for i, v in ipairs( t ) do
		local _t = type( v )
		if _t == "table" then
			PrintDataset( v, string.format( "%s[%g]", parent, i ) )
		elseif _t == "string" or _t == "number" then
			print( string.format( "%s[%d] = %s", parent, i, tostring( v ) ) )
		else
			-- not support value type
		end
	end
	local len = #t
	local keys = {}
	local idict = {}
	for k, v in pairs( t ) do
		local _t = type( k )
		if _t == "number" then
			if k > len or k <= 0 then
				idict[k] = v
			end
		elseif _t == "string" then
			keys[#keys + 1] = k
		else
			--table, function, ...
			--not support data type for key
		end
	end
	-- for all number keys those are not in array part
	-- key must be number
	for k, v in pairs( idict ) do
		local intKey = k == math.floor( k )
		local _t = type( v )
		if _t ~= "table" then
			if _t == "number" or _t == "string" then
				if intKey then
					print( string.format( "%s[%d] = %s", parent, k, tostring( v ) ) )
				else
					print( string.format( "%s[%g] = %s", parent, k, tostring( v ) ) )
				end
			else
				-- not support value data type
			end
		else
			if intKey then
				PrintDataset( v, string.format( "%s[%d]", parent, k ) )
			else
				PrintDataset( v, string.format( "%s[%g]", parent, k ) )
			end
		end
	end
	-- sort all string keys
	table.sort( keys )
	-- for all none-table value
	local tableValue
	for k, v in pairs( keys ) do
		local value = t[v]
		local _t = type( value )
		if _t ~= "table" then
			-- print all number or string value here
			local _value = tostring( value )
			print( #parent > 0 and parent.."."..v.." = ".._value or v.." = ".._value )
		else
			-- for table value
			if not tableValue then
				tableValue = {}
			end
			tableValue[ k ] = v
		end
	end
	-- for all table value
	if tableValue then
		for k, v in pairs( tableValue ) do
			local value = t[v]
			PrintDataset( value, #parent > 0 and parent.."."..v or v )
		end
	end
end

local function StringBuilder()
	local sb = {}
	local f = function( str )
		if str then
			sb[ #sb + 1 ] = str
		end
		return f, sb
	end
	return f
end

local function DeserializeTable( val )
	local loader = loadstring or load -- lua5.2 compat
	local chunk = loader( "return "..val )
	local ok, ret = pcall( chunk )
	if not ok then
		ret = nil
		print( "DeserializeTable failed!"..val )
	end
	return ret
end

local function _SerializeTable( val, name, skipnewlines, campact, depth, tableRef )
	local valt = type( val )
    depth = depth or 0
	campact = campact or false
	local append = StringBuilder()
	local eqSign = " = "
	local tmp = ""
	if not campact then
		append( string.rep( "\t", depth ) )
		skipnewlines = skipnewlines or false
	else
		skipnewlines = true
		eqSign = "="
	end
    if name then
		local nt = type( name )
		if nt == "string" then
			if name ~= "" then
				if string.match( name,'^%d+' ) then
					append( "[\"" )
					append( name )
					append( "\"]" )
				else
					append( name )
				end
			else
				append( "[\"\"]" )
			end
			append( eqSign )
		elseif nt == "number" then
			append( string.format( "[%s]", tostring( name ) ) )
			append( eqSign )
		else
			tmp = tmp .. "\"[inserializeable datatype for key:" ..  nt .. "]\""
		end
	end
	local ending = not skipnewlines and "\n" or ""
	if tableRef then
		local refName = tableRef[ val ]
		if refName then
			valt = "ref"
			val = refName
		end
	end
    if valt == "table" then
        append( "{" ) append( ending )
		local array_part = {}
		local count = 0
        for k, v in ipairs( val ) do
			if type( val ) ~= "function" then
				array_part[k] = true
				if count > 0 then
					append( "," )
					append( ending )
				end
				append( _SerializeTable( v, nil, skipnewlines, campact, depth + 1, tableRef ) )
				count = count + 1
			end
        end
		local sortedK = {}
		for k, v in pairs( val ) do
			if type( v ) ~= "function" then
				if not array_part[k] then
					sortedK[#sortedK + 1] = k
				end
			end
		end
		table.sort( sortedK )
		for i, k in ipairs( sortedK ) do
			local v = val[k]
			if count > 0 then
				append( "," )
				append( ending )
			end
			append( _SerializeTable( v, k, skipnewlines, campact, depth + 1, tableRef ) )
			count = count + 1
        end
		if count >= 1 then
			append( ending )
		end
		if not campact then
			append( string.rep( "\t", depth ) )
		end
		append( "}" )
    elseif valt == "number" then
		if DefaultNumberSerializedFormat == NumberSerializedFormat or math.floor( val ) == val then
			append( tostring( val ) )
		else
			append( string.format( NumberSerializedFormat, val ) )
		end
    elseif valt == "string" then
        append( EncodeEscapeString( val ) )
    elseif valt == "boolean" then
        append( val and "true" or "false" )
	elseif valt == "ref" then
		append( val or "nil" )
    else
        tmp = tmp .. "\"[inserializeable datatype:" .. valt .. "]\""
    end
	local _, slist = append()
    return table.concat( slist, "" )
end

local function _SerializeTableToPythonDict( val, name, skipnewlines, campact, depth )
    depth = depth or 0
	campact = campact or false
	local append = StringBuilder()
	local eqSign = " : "
	if not campact then
		append( string.rep( "    ", depth ) )
		skipnewlines = skipnewlines or false
	else
		skipnewlines = true
		eqSign = ":"
	end
    if name then
		local nt = type( name )
		if nt == "string" then
			append( "\'"..name.."\'" )
			append( eqSign )
		elseif nt == "number" then
			append( string.format( "%g", name ) )
			append( eqSign )
		else
			tmp = tmp .. "\"[inserializeable datatype for key:" ..  nt .. "]\""
		end
	end
	local valt = type( val )
	local ending = not skipnewlines and "\n" or ""
    if valt == "table" then
        append( "{" ) append( ending )
		local array_part = {}
        for k, v in ipairs( val ) do
			if type( v ) ~= "function" then
				array_part[k] = true
				append( _SerializeTableToPythonDict( v, nil, skipnewlines, campact, depth + 1 ) )
				append( "," )
				append( ending )
			end
        end
		for k, v in pairs( val ) do
			if not array_part[k] and type( v ) ~= "function" then
				append( _SerializeTableToPythonDict( v, k, skipnewlines, campact, depth + 1 ) )
				append( "," )
				append( ending )
			end
        end
		if not campact then
			append( string.rep( "    ", depth ) )
		end
		append( "}" )
    elseif valt == "number" then
        append( tostring( val ) )
    elseif valt == "string" then
        append( string.format( "\'%s\'", val ) )
    elseif valt == "boolean" then
        append( val and "True" or "False" )
    else
        tmp = tmp .. "\"[inserializeable datatype:" .. valt .. "]\""
    end
	local _, slist = append()
    return table.concat( slist, "" )
end

local function SerializeTable( val, skipnewlines, campact, tableRef, depth )
	getmetatable( "" ).__lt = function( a, b ) return tostring( a ):lower() < tostring( b ):lower() end
	local ret = _SerializeTable( val, nil, skipnewlines, campact, depth or 0, tableRef )
	getmetatable( "" ).__lt = nil
	return ret
end

local function SerializeTableToPythonDict( val, skipnewlines, campact )
	return _SerializeTableToPythonDict( val, nil, skipnewlines, campact, 0 )
end


--split a string to word list
local SplitNameToWords = function( str, split_char )
	split_char = split_char or "_"
	local sub_str_tab = {}
	while true do
		local pos = string.find( str, split_char )
		if not pos then
			sub_str_tab[ #sub_str_tab + 1 ] = str
			break
		end
		local sub_str = string.sub( str, 1, pos - 1 )
		sub_str_tab[ #sub_str_tab + 1 ] = sub_str
		str = string.sub( str, pos + 1, #str )
	end
	return sub_str_tab
end

local function TrimDataset( dataset, excludeKeys )
	local startswith = function( str, substr )
		if str == nil or substr == nil then
			return nil, "the string or the sub-stirng parameter is nil"
		end
		if string.find( str, substr ) ~= 1 then
			return false
		else
			return true
		end
	end

	if excludeKeys == nil or type( excludeKeys ) ~= "table" then
		return dataset
	end
	local ret = {}
	local xstr = require "std.xstr"
	for k, v in pairs( dataset ) do
		if type( v ) == "table" then
			local row = {}
			local localized = false
			for c, val in pairs( v ) do
				local exclude = false
				for _, x in ipairs( excludeKeys ) do
					if startswith( x, LanguageLeadingTag ) then
						localized = true
						local partten = string.sub( x, 2 ) -- remove language leading tag
						partten = xstr.lower( partten )
						local _c = xstr.lower( c )
						local s, e, f = string.find( _c, partten )
						if f then
							exclude = true
						end
					elseif x == c then
						exclude = true
						break
					end
				end
				if not exclude then
					row[c] = val
				end
			end
			if localized then
				local replace = {}
				for c, v in pairs( row ) do
					local is_locale_field = false
					local _, _, locale = string.find( c, "%a+.*_(%a+)$" )
					if locale and AllSupportedLanguages[locale] then
						local _, _, _c = string.find( c, "(%a+.*)_%a+$" )
						if _c then
							-- remove default language field
							replace[_c] = row[c]
							is_locale_field = true
						end
					end
					if not is_locale_field and replace[c] == nil then
						replace[c] = v
					end
				end
				row = replace
			end
			ret[k] = row
		end
	end
	return ret
end

-- make a word leading with a uppercase character
local MakeWord = function( str )
	local leading = str:sub( 1, 1 )
	leading = leading:upper()
	local remaining = str:sub( 2 )
	return leading..remaining
end

local function CreateFileWriter( fileName, mode )
	local file = nil
	local indent = 0
	if mode and fileName then
		local _file, err = io.open( fileName )
		if _file ~= nil then
			--print( "remove file "..fileName )
			os.remove( fileName )
		end
		file = io.open( fileName, mode )
	end
	local ret = nil
	if file then
		ret = {
			write = function( ... )
				if indent > 0 then
					for i = 0, indent - 1 do
						file:write( "\t" )
					end
				end
				return file:write( ... )
			end,
			close = function( ... )
				return file:close()
			end
		}
	else
		ret = {
			write = function( ... )
				for i = 0, indent - 1 do
					io.write( "\t" )
				end
				return io.write( ... )
			end,
			close = function( ... )
			end
		}
	end

	ret.indent = function( count )
		count = count or 1
		indent = indent + count or 1
	end

	ret.outdent = function( count )
		count = count or 1
		if indent >= count then
			indent = indent - count
		end
	end

	return ret
end

local function GetValueTypeNameCS( value )
	local t = type( value )
	if t == "string" then
		return "string"
	elseif t == "number" then
		if value == math.floor( value ) then
			return "int"
		else
			return "float"
		end
	elseif t == "boolean" then
		return "bool"
	elseif t == "table" then
		return "table"
	else
		return "void"
	end
end

local function TrimDatasetFile( dataset, excludeKeys, tofile, tableRef )
	if tofile then
		outFile = CreateFileWriter( dataset.__sourcefile, "w" )
	else
		outFile = CreateFileWriter()
	end
	local ptr2ref = nil
	if tableRef and tableRef.ptr2ref then
		ptr2ref = tableRef.ptr2ref
	end
	if tableRef and tableRef.name2value then
		local name2table = tableRef.name2value
		local tables = tableRef.tables
		local tableIds = tableRef.tableIds
		local ptr2ref = tableRef.ptr2ref
		local refcounter = tableRef.refcounter
		local maxLocalVariableNum = tableRef.maxLocalVariableNum or MaxLocalVariableNum
		local refTableName = tableRef.refTableName or "__rt"
		local tableNum = table.maxn( tableIds )
		for id, hash in ipairs( tableIds ) do
			local table = tables[ hash ]
			if table and id <= maxLocalVariableNum then
				local refname = ptr2ref[ table ]
				-- temp comment out top level ref
				ptr2ref[ table ] = nil
				local refcount = refcounter[ table ]
				outFile.write(
					string.format(
						"%slocal %s = %s\n",
						PrintTableRefCount and string.format( "--ref:%d\n", refcount ) or "",
						refname,
						SerializeTable( table, false, false, ptr2ref )
					)
				)
				ptr2ref[ table ] = refname
			else
				break
			end
		end
		if tableNum > maxLocalVariableNum then
			local maxCount = tableNum - maxLocalVariableNum
			outFile.write( string.format( "local %s = createtable and createtable( %d, 0 ) or {}\n", refTableName, maxCount ) )

			for id = maxLocalVariableNum + 1, tableNum do
				local offset = id - maxLocalVariableNum
				local hash = tableIds[ id ]
				local table = tables[ hash ]
				local refname = ptr2ref[ table ]
				-- temp comment out top level ref
				ptr2ref[ table ] = nil
				local refcount = refcounter[ table ]
				outFile.write(
					string.format(
						"%s%s[%d] = %s\n",
						PrintTableRefCount and string.format( "-- %s, ref:%d\n", refname, refcount ) or "",
						refTableName, offset,
						SerializeTable( table, false, false, ptr2ref )
					)
				)
				ptr2ref[ table ] = refname
			end

		end
	end
	local datasetName = dataset.__name
	outFile.write( string.format( "local %s = \n", datasetName ) )
	if excludeKeys then
		dataset = TrimDataset( dataset, excludeKeys )
		ptr2ref = nil
	else
		local removed = nil
		for k, v in pairs( dataset ) do
			if type( v ) ~= "table" then
				removed = removed or {}
				removed[#removed + 1] = k
			end
		end
		if removed then
			for _, k in ipairs( removed ) do
				dataset[ k ] = nil
			end
		end
	end
	outFile.write( SerializeTable( dataset, false, false, ptr2ref ) )
	outFile.write( "\n" )
	if tableRef and tableRef.postOutput then
		tableRef.postOutput( outFile )
	end
	outFile.write( string.format( "\nreturn %s\n", datasetName ) )
	outFile.close()
end
-- dataset
-- dataset rename
-- containId
-- true or false to enable cache
-- a name for inverse cache
-- save to file if true
-- use gc cache, not support two caches
-- sweepInterval in second
local function GenCSharpDefine( dataset, datasetName, containId, needCache, nameKey, tofile, gcCache, sweepInterval )
	for _, v in ipairs( DatasetCSNames ) do
		if v == datasetName then
			return
		end
	end

	if needCache and tofile then
		DatasetCSNames[#DatasetCSNames + 1] = datasetName
	end
	if dataset == nil then
		return
	end
	gcCache = needCache and gcCache
	if gcCache and nameKey then
		print( "go cache not support two cache" )
		gcCache = false
		sweepInterval = ""
	end
	if gcCache then
		sweepInterval = tostring( tonumber( sweepInterval ) or "" )
		if sweepInterval ~= "" then
			sweepInterval = " "..sweepInterval.." ";
		end
	end
	-- make a new dataset name if not specified
	local dataName = datasetName
	local dbName = dataset.__name
	local DatasetFieldNameBank = DatasetFieldNameBank or {}
	if datasetName == nil then
		datasetName = dataset.__name
		dataName = datasetName
		if datasetName then
			local words = SplitNameToWords( datasetName )
			local newName = ""
			for _, v in ipairs( words ) do
				newName = newName..MakeWord( v )
			end
			datasetName = newName
		end
	end
	if tofile then
		outFile = CreateFileWriter( string.format( "%s/%s.cs", DatabaseCodeRoot, datasetName ), "w" )
	else
		outFile = CreateFileWriter()
	end
	-- walk table
	local flag = false
	local ids = {}
	local idType = nil
	local isIntegerKey = true
	local hasEx = false
	for k, v in pairs( dataset ) do
		local _sk = tostring( k )
		if _sk ~= "__name" and _sk ~= "__sourcefile" then
			if not idType then
				--print( "table key type is: "..type( k ) )
				idType = type( k )
			end
			-- check type
			if idType == type( k ) then
				ids[#ids + 1] = k
				if idType == "number" then
					if isIntegerKey then
						isIntegerKey = k == math.floor( k );
					end
				end
			end
		end
	end
	isIntegerKey = isIntegerKey and idType ~= "string"
	if idType ~= "string" and idType ~= "number" then
		print( "invalid table: key of this table must be string or number" )
		return
	end
	local idTypeName = nil
	local keysType = nil
	if idType == "string" then
		idTypeName = "string"
		keysType = "SKeys"
		isIntegerKey = false
		containId = false
		nameKey = nil
		print( "inverse cache not support for string-key-table" )
	elseif idType == "number" then
		idTypeName = isIntegerKey and "int" or "double"
		keysType = isIntegerKey and "IKeys" or "NKeys"
		if not isIntegerKey then
			print( "key is not string or int, failed!" )
			return
		end
	else
		return
	end

	table.sort( ids )

	local checkIfNeedUtf8 = function( key )
		for _, row in pairs( dataset ) do
			local v = row[ key ]
			if v ~= nil and type( v ) == "string" then
				for i = 1, #v do
					local c = string.byte( string.sub( v, i, i ), 1 )
					if c < 0 or c > 127 then
						return true
					end
				end
			end
		end
		return false
	end
	do
		-- find bigest table to generate fields
		local majorItem = 1
		local f = 0
		for k, v in pairs( dataset ) do
			if type( v ) == "table" then
				local num = 0
				for _, _ in pairs( v ) do
					num = num + 1
				end
				if num > f then
					f = num
					majorItem = k
				end
			end
		end

		local v = dataset[ majorItem ]
		if type( v ) == "table" then
			local names = {}
			for name, value in pairs( v ) do
				if type( name ) == "string" and name == "id" then
					print( "this table already has a field named 'id'" )
				end
				if type( name ) == "string" then
					names[ #names + 1 ] = name
				end
			end
			table.sort( names, function( a, b ) return a:lower() < b:lower() end )
			-- choose cs data type
			-- for all fields in a record
			local typeNameTable = {}
			for i, field in ipairs( names ) do
				-- for all record/row
				for r, t in ipairs( ids ) do
					local record = dataset[ t ]
					if record[field] then
						local v = record[field]
						local curType = GetValueTypeNameCS( v )
						if not typeNameTable[field] then
							typeNameTable[field] = curType
						elseif typeNameTable[field] == "int" and curType == "float" then
							-- overwrite int to float
							typeNameTable[field] = curType
						elseif curType == "table" then
							-- overwrite to table
							typeNameTable[field] = curType
						end
					end
				end
			end

			outFile.write( "//=============================================================================\n" );
			outFile.write( "// DO NOT MODIFY THIS FILE MANUALLY!!\n" );
			outFile.write( "// THIS FILE IS GENERATED BY LUA DATABASE TOOL.\n" );
			outFile.write( "// IF YOU HAVE ANY QUESTIONS PLEASE CONTACT LUJIAN.\n" );
			outFile.write( "//=============================================================================\n\n" );
			outFile.write( "using System;\n" )
			outFile.write( "using System.Collections.Generic;\n" )
			outFile.write( "using Common;\n" )
			outFile.write( "#if USE_NATIVE_LUA\n" )
			outFile.write( "using NLuaState = NativeLua.NLuaState;\n" )
			outFile.write( "using LuaType = NativeLua.LuaDLL;\n" )
			outFile.write( "using LuaTinker = NativeLua.LuaTinker;\n" )
			outFile.write( "using LuaDatabase = NativeLua.LuaDatabase;\n" )
			outFile.write( "using LuaTableHandle = System.Int64;\n" )
			outFile.write( "using LuaStateHandle = System.IntPtr;\n" )
			outFile.write( "#else\n" )
			outFile.write( "using NLuaState = UniLua.ILuaState;\n" )
			outFile.write( "using LuaType = UniLua.LuaType;\n" )
			outFile.write( "using LuaTinker = UniLuax.LuaTinker;\n" )
			outFile.write( "using LuaDatabase = UniLuax.LuaDatabase;\n" )
			outFile.write( "using LuaTableHandle = System.Object;\n" )
			outFile.write( "using LuaStateHandle = UniLua.ILuaState;\n" )
			outFile.write( "#endif\n" )
			outFile.write( "\n" )
			outFile.write( "namespace Database {\n" )
			outFile.write( string.format( "\tpublic partial class %s {\n", datasetName ) )
			outFile.write( string.format( "\t\tconst string DBName = \"%s\";\n", dbName ) )

			outFile.write( "\t\t#region members\n" )
			local nameCache = false
			local _nameKey
			if nameKey then
				_nameKey = string.lower( nameKey )
			end
			if containId then
				if idTypeName == "int" then
					outFile.write( "\t\tprivate int m_id = 0;\n" )
				elseif idTypeName == "string" then
					containId = false
					nameCache = false
					outFile.write( "\t\tprivate string m_name = 0;\n" )
				else
					containId = false
					nameCache = false
				end
			end

			for i, key in ipairs( names ) do
				local value = v[ key ]
				if value and type( value ) ~= "table" then
					local typename = typeNameTable[key]
					local n = string.lower( key )
					if n == _nameKey and typename == "string" then
						nameCache = true
					end
					outFile.write( string.format( "\t\tprivate %s m_%s = %s;\n", typename, key, typename == "string" and "String.Empty" or "0" ) )
				end
				if not hasEx and type( value ) == "table" then
					hasEx = true
				end
			end
			outFile.write( "\t\t#endregion\n" )
			local cacheTypeName = "Common.Collections.Generic.Lit.Dictionary"
			if gcCache then
				cacheTypeName = "DataCacheLit"
			end
			if needCache then
				outFile.write( "\t\t#region caches\n" )
				outFile.write( string.format( "\t\tprivate static %s m_ids = null;\n", keysType ) )
				outFile.write( string.format( "\t\tprivate static %s<%s, %s> m_idCache = new %s<%s, %s>(%s);\n", cacheTypeName, idTypeName, datasetName, cacheTypeName, idTypeName, datasetName, sweepInterval or "" ) )
				if nameCache then
					outFile.write( string.format( "\t\tprivate static %s<String, %s> m_nameCache = new %s<String, %s>(%s);\n", cacheTypeName, datasetName, cacheTypeName, datasetName, sweepInterval or "" ) )
				end
				outFile.write( "\t\t#endregion\n" )
			end

			outFile.write( "\t\t#region properties\n" )
			if containId then
				outFile.write( string.format( "\t\tpublic %s id { get { return m_id; } }\n", idTypeName ) )
			end
			local hasField = #names > 0
			for k, v1 in ipairs( names ) do
				local value = v[ v1 ]
				local tp = type( value )
				if tp ~= "table" then
					local typename = typeNameTable[v1]
					outFile.write( string.format( "\t\tpublic %s %s { get { return m_%s; } }\n", typename, v1, v1 ) )
				end
			end

			outFile.write( "\t\t#endregion\n" )

			outFile.write( "\t\t#region method\n" )
			outFile.write( "\t\tstatic LuaTableHandle __this = default( LuaTableHandle );\n" )
			outFile.write( string.format( "\t\tstatic %s __default = null;\n", datasetName ) )
			outFile.write( "\t\tstatic int __hash = 0;\n" )
			outFile.write( "\t\tstatic bool __masked = false;\n\n" )

			outFile.write( string.format( "\t\tstatic %s() {\n", datasetName ) )
			outFile.write( "\t\t\tLuaDatabase.datasetUnloadEvent += OnUnload;\n" )
			outFile.write( "\t\t\tif ( Load() ) {\n" )
			outFile.write( string.format( "\t\t\t\tDBLoadedItems.MarkAutoLoaded( DBName, typeof( %s ) );\n", datasetName ) )
			outFile.write( "\t\t\t}\n" )
			outFile.write( "\t\t}\n\n" )

			outFile.write( "\t\tpublic static String DbName {\n" )
			outFile.write( "\t\t\tget { return DBName; }\n" )
			outFile.write( "\t\t}\n\n" )

			if needCache then
				outFile.write( string.format( "\t\tpublic static %s<%s, %s> idCacheData {\n", cacheTypeName, idTypeName, datasetName ) )
				outFile.write( "\t\t\tget { return m_idCache; }\n" )
				outFile.write( "\t\t}\n\n" )
			end

			outFile.write( "\t\tpublic static void Touch() {\n" )
			outFile.write( "\t\t}\n\n" )

			outFile.write( "\t\tpublic static bool EnsureLoaded() {\n" )
			outFile.write( "\t\t\treturn Load();\n" )
			outFile.write( "\t\t}\n\n" )


			outFile.write( "\t\tstatic void ReadDefault() {\n" )
			outFile.write( "\t\t\tvar db = LuaDatabase.sharedInstance;\n" )
			outFile.write( "\t\t\tvar L = db.GetLuaState();\n" )
			outFile.write( "\t\t\tvar top = db.GetLuaTop();\n" )
			outFile.write( "\t\t\ttry {\n" )
			outFile.write( "\t\t\t\tdb.PushDataset( DBName );\n" )
			outFile.write( "\t\t\t\tif ( L.IsTable( -1 ) ) {\n" )
			outFile.write( "\t\t\t\t\tL.GetMetaTable( -1 );\n" )
			outFile.write( "\t\t\t\t\tif ( L.IsTable( -1 ) ) {\n" )
			outFile.write( "\t\t\t\t\t\t__this = ( LuaTableHandle )L.ToObject( -1 );\n" )
			outFile.write( "\t\t\t\t\t\tvar table = new LuaTinker.Table( L, -1 );\n" )
			outFile.write( "\t\t\t\t\t\tvar subTable = table.GetSubTable( \"__default\" );\n" )
			outFile.write( "\t\t\t\t\t\t__masked = table.Get<bool>( \"__masked\", false );\n" )
			outFile.write( "\t\t\t\t\t\t__hash = table.Get<int>( \"__hash\", 0 );\n" )
			outFile.write( "\t\t\t\t\t\tif ( subTable != LuaTinker.Table.Empty && __hash == VersionHash ) {\n" )
			outFile.write( "\t\t\t\t\t\t\tusing ( var q = db.CreateQuery( subTable.index ) ) {\n" )
			outFile.write( string.format( "\t\t\t\t\t\t\t\t__default = ReadOne( q, default( %s ) );\n", idTypeName ) )
			outFile.write( "\t\t\t\t\t\t\t}\n" )
			outFile.write( "\t\t\t\t\t\t} else {\n" )
			outFile.write( "\t\t\t\t\t\t\tif ( __hash != 0 ) {\n" )
			outFile.write( "\t\t\t\t\t\t\t\tULogFile.sharedInstance.LogError( \"Database {0} version mismatch, reader = 0x{1:x8}, data = 0x{2:x8}, masked = {3} \", DBName, VersionHash, __hash, __masked );\n" )
			outFile.write( "\t\t\t\t\t\t\t}\n" )
			outFile.write( "\t\t\t\t\t\t\t__masked = false;\n" )
			outFile.write( "\t\t\t\t\t\t}\n" )
			outFile.write( "\t\t\t\t\t}\n" )
			outFile.write( "\t\t\t\t}\n" )
			outFile.write( "\t\t\t} finally {\n" )
			outFile.write( "\t\t\t\tdb.SetLuaTop( top );\n" )
			outFile.write( "\t\t\t}\n" )
			outFile.write( "\t\t}\n\n" )

			outFile.write( "\t\tpublic static bool Load() {\n" )
			outFile.write( "\t\t\tbool alreadyLoaded;\n" )
            outFile.write( "\t\t\tvar r = LuaDatabase.sharedInstance.Load( DBName, out alreadyLoaded );\n" )
            outFile.write( "\t\t\tif ( r && !alreadyLoaded ) {\n" )
            outFile.write( "\t\t\t\tReadDefault();\n" )
            outFile.write( "\t\t\t}\n" )
            outFile.write( "\t\t\treturn r;\n" )
			outFile.write( "\t\t}\n\n" )

			outFile.write( "\t\tpublic static bool IsLoaded() {\n" )
			outFile.write( "\t\t\treturn LuaDatabase.sharedInstance.IsLoaded( DBName );\n" )
			outFile.write( "\t\t}\n\n" )

			outFile.write( "\t\tpublic static bool Unload() {\n" )
			outFile.write( "\t\t\treturn LuaDatabase.sharedInstance.Unload( DBName );\n" )
			outFile.write( "\t\t}\n\n" )

			outFile.write( "\t\tpublic static bool Reload() {\n" )
			outFile.write( "\t\t\tbool ret = LuaDatabase.sharedInstance.Reload( DBName );\n" )
			outFile.write( "\t\t\tReadDefault();\n" )
			if needCache then
				outFile.write( "\t\t\tClearCache();\n" )
			end
			outFile.write( "\t\t\treturn ret;\n" )
			outFile.write( "\t\t}\n\n" )

			outFile.write( "\t\tstatic void OnUnload( LuaStateHandle L, LuaTableHandle tablePtr, String name ) {\n" )
			outFile.write( "\t\t\tif ( name == DBName && tablePtr == __this ) {\n" )
            outFile.write( "\t\t\t\t__this = default( LuaTableHandle );\n" )
            outFile.write( "\t\t\t\t__default = null;\n" )
            outFile.write( "\t\t\t\t__hash = 0;\n" )
            outFile.write( "\t\t\t\t__masked = false;\n" )
            outFile.write( "\t\t\t}\n" )
			outFile.write( "\t\t}\n\n" )

			if needCache then
				outFile.write( "\t\tpublic static int CacheAll() {\n" );
				outFile.write( "\t\t\tClearCache();\n" )
				outFile.write( "\t\t\tvar db = LuaDatabase.sharedInstance;\n" )
				outFile.write( "\t\t\tvar L = db.GetLuaState();\n" )
				outFile.write( "\t\t\tvar top = db.GetLuaTop();\n" )
				outFile.write( "\t\t\ttry {\n" )
				outFile.write( "\t\t\t\tdb.PushDataset( DBName );\n" )
				outFile.write( string.format( "\t\t\t\tusing ( var gbuff = Common.GlobalBuffer<%s>.Get() ) {\n" , idTypeName) )
				if idTypeName == "int" then
					outFile.write( "\t\t\t\t\tLuaDatabase.LuaTable_iForEach( L,\n" )
				elseif idTypeName == "string"  then
					outFile.write( "\t\t\t\t\tLuaDatabase.LuaTable_sForEach( L,\n" )
				else
					outFile.write( "\t\t\t\t\tLuaDatabase.LuaTable_dForEach( L,\n" )
				end
				outFile.write( "\t\t\t\t\t	( _L, id ) => {\n" )
				outFile.write( "\t\t\t\t\t		using ( var q = db.CreateQuery( -1, DBName ) ) {\n" )
				outFile.write( "\t\t\t\t\t			var value = ReadOne( q, id );\n" )
				outFile.write( "\t\t\t\t\t			if ( value != null ) {\n" )
				outFile.write( "\t\t\t\t\t				m_idCache.Add( id, value );\n" )
				outFile.write( "\t\t\t\t\t				gbuff.Add( id );\n" )
				outFile.write( "\t\t\t\t\t			}\n" )
				outFile.write( "\t\t\t\t\t		}\n" )
				outFile.write( "\t\t\t\t\t	}\n" )
				outFile.write( "\t\t\t\t\t);\n" )
				outFile.write( "\t\t\t\t\tgbuff.Sort();\n" )
				outFile.write( string.format( "\t\t\t\t\tm_ids = new %s( gbuff.ToList() );\n", keysType ) )
				outFile.write( "\t\t\t\t};\n" )
				outFile.write( "\t\t\t} finally {\n" )
				outFile.write( "\t\t\t	db.SetLuaTop( top );\n" )
				outFile.write( "\t\t\t}\n" )
				outFile.write( "\t\t\treturn m_idCache.Count;\n" )
				outFile.write( "\t\t}\n\n" )

				outFile.write( "\t\tpublic static void ClearCache() {\n" )
				outFile.write( "\t\t\tm_idCache.Clear();\n" )
				outFile.write( "\t\t\tm_ids = null;\n" )
				if nameCache then
					outFile.write( "\t\t\tm_nameCache.Clear();\n" )
				end
				outFile.write( "\t\t}\n\n" )
			else
				outFile.write( "\t\tpublic static int CacheAll() {\n" );
				outFile.write( "\t\t\treturn 0;\n" )
				outFile.write( "\t\t}\n\n" )

				outFile.write( "\t\tpublic static void ClearCache() {\n" )
				outFile.write( "\t\t}\n\n" )
			end

			outFile.write( "\t\tpublic static int Sweep( bool force = false ) {\n" )
			if gcCache then
				outFile.write( "\t\t\treturn m_idCache.Sweep( force );\n" )
			else
				outFile.write( "\t\t\treturn 0;\n" )
			end
			outFile.write( "\t\t}\n\n" )

			outFile.write( string.format( "\t\tpublic static %s GetKeys( Comparison<%s> pred = null ) {\n", keysType, idTypeName ) )
			if needCache then
				outFile.write( "\t\t\tif ( m_ids == null ) {\n" )
				if idTypeName == "int" then
					outFile.write( string.format( "\t\t\t\tm_ids = new %s( LuaDatabase.sharedInstance.GetDatasetIKeys( DBName, true, pred ) );\n", keysType ) )
				elseif idTypeName == "string" then
					outFile.write( string.format( "\t\t\t\tm_ids = new %s( LuaDatabase.sharedInstance.GetDatasetSKeys( DBName, true, pred, true ) );\n", keysType ) )
				elseif idTypeName == "double" then
					outFile.write( string.format( "\t\t\t\tm_ids = new %s( LuaDatabase.sharedInstance.GetDatasetNKeys( DBName, true, pred ) );\n", keysType ) )
				end
				outFile.write( "\t\t\t}\n" )
				outFile.write( "\t\t\tvar ids = m_ids;\n" )
				outFile.write( "\t\t\tif ( pred != null ) {\n" )
				outFile.write( "\t\t\t\tint count = m_ids.Count;\n" )
				outFile.write( string.format( "\t\t\t\tvar _ids = new List<%s>( count );\n", idTypeName ) )
				outFile.write( "\t\t\t\tfor ( int i = 0; i < count; ++i ) {\n" )
				outFile.write( "\t\t\t\t\t_ids.Add( m_ids[i] );\n" )
				outFile.write( "\t\t\t\t}\n" )
				outFile.write( "\t\t\t\t_ids.Sort( pred );\n" )
				outFile.write( string.format( "\t\t\t\tids = new %s( _ids );\n", keysType ) )
				outFile.write( "\t\t\t}\n" )
				outFile.write( "\t\t\treturn ids;\n" )
			else
				if idTypeName == "int" then
					outFile.write( string.format( "\t\t\treturn new %s( LuaDatabase.sharedInstance.GetDatasetIKeys( DBName, true, pred ) );\n", keysType ) )
				elseif idTypeName == "string" then
					outFile.write( string.format( "\t\t\treturn = new %s( LuaDatabase.sharedInstance.GetDatasetSKeys( DBName, true, pred, true ) );\n", keysType ) )
				elseif idTypeName == "double" then
					outFile.write( string.format( "\t\t\treturn = new %s( LuaDatabase.sharedInstance.GetDatasetNKeys( DBName, true, pred ) );\n", keysType ) )
				end
			end
			outFile.write( "\t\t}\n\n" )

			outFile.write( string.format( "\t\tstatic %s ReadOne( LuaDatabase.Query q, %s id ) {\n", datasetName, idTypeName ) )
			outFile.write( "\t\t\tif ( q.IsTable() ) {\n" )
			outFile.write( string.format( "\t\t\t\tvar temp = new %s();\n", datasetName ) )
			if hasField then
				outFile.write( "\t\t\t\tvar __mask = DBCache.LoadCurrentFieldMask( q, __masked );\n" )
			end
			if containId then
				outFile.write( "\t\t\t\ttemp.m_id = id;\n" )
			end
			local complexFields = {}
			local sortedNames = {}
			local fieldIdMap = {}

			for i, key in ipairs( names ) do
				local value = v[ key ]
				fieldIdMap[ key ] = i
				local fkey, keyIDRef, keyIDLen = FixDatasetFieldName( key )
				if value and type( value ) ~= "table" then
					sortedNames[ #sortedNames + 1 ] = key
					local fieldId = i - 1
					local ttt = typeNameTable[key]
					if 	ttt == "string" then
						if checkIfNeedUtf8( key ) or string.sub( value, 1, 1 ) == LanguageLeadingTag then
							outFile.write( string.format( "\t\t\t\ttemp.m_%s = __mask[ %d ] ? Dataset.DecodeToLocalizedString( q, %s, %s ) : __default.m_%s;\n", key, fieldId, keyIDRef, keyIDLen, key ) )
						else
							outFile.write( string.format( "\t\t\t\ttemp.m_%s = __mask[ %d ] ? Dataset.DecodeToDatabaseString( q, %s, %s ) : __default.m_%s;\n", key, fieldId, keyIDRef, keyIDLen, key ) )
						end
					elseif ttt == "int" then
						outFile.write( string.format( "\t\t\t\ttemp.m_%s = __mask[ %d ] ? q.GetInt( %s, %s ) : __default.m_%s;\n", key, fieldId, keyIDRef, keyIDLen, key ) )
					elseif ttt == "float" then
						outFile.write( string.format( "\t\t\t\ttemp.m_%s = __mask[ %d ] ? q.GetFloat( %s, %s ) : __default.m_%s;\n", key, fieldId, keyIDRef, keyIDLen, key ) )
					end
				end
				if type( value ) == "table" and hasEx then
					complexFields[ #complexFields + 1 ] = { key, value }
				end
			end
			for _, _v in ipairs( complexFields ) do
				local k = _v[1]
				local fieldId = fieldIdMap[ k ] - 1
				outFile.write( string.format( "\t\t\t\t%sEx.IsValid_%s = __mask[ %d ];\n", datasetName, k, fieldId ) )
			end
			for _, _v in ipairs( complexFields ) do
				local k = _v[1]
				sortedNames[ #sortedNames + 1 ] = k
				outFile.write( string.format( "\t\t\t\tif ( %sEx.onLoadComplexField_%s != null ) {\n", datasetName, k ) )
				outFile.write( string.format( "\t\t\t\t\t%sEx.onLoadComplexField_%s( temp, q );\n", datasetName, k ) )
				outFile.write( "\t\t\t\t}\n" )
			end
			outFile.write( "\t\t\t\treturn temp;\n" )
			outFile.write( "\t\t\t}\n" )
			outFile.write( "\t\t\treturn null;\n" )
			outFile.write( "\t\t}\n\n" )

			if needCache and nameCache then
				outFile.write( string.format(" \t\tpublic static %s Get( String name ) {\n", datasetName ) )
				outFile.write( string.format( "\t\t\t%s ret = null;\n", datasetName ) )
				outFile.write( "\t\t\tif ( m_nameCache.TryGetValue( name, out ret ) ) {\n" )
				outFile.write( "\t\t\t\treturn ret;\n" )
				outFile.write( "\t\t\t}\n" )
				outFile.write( "\t\t\treturn ret;\n" )
				outFile.write( "\t\t}\n\n" )
			end

			outFile.write( string.format(" \t\tpublic static %s Get( %s id ) {\n", datasetName, idTypeName ) )
			if idTypeName ~= "string" and dataset[0] == nil then
				outFile.write( "\t\t\tif ( id == 0 ) {\n" )
				outFile.write( "\t\t\t\treturn null;\n" )
				outFile.write( "\t\t\t}\n" )
			end
			if needCache then
				outFile.write( string.format( "\t\t\t%s ret = null;\n", datasetName ) )
				outFile.write( "\t\t\tif ( m_idCache.TryGetValue( id, out ret ) ) {\n" )
				outFile.write( "\t\t\t\treturn ret;\n" )
				outFile.write( "\t\t\t}\n" )
			end
			outFile.write( "\t\t\tvar db = LuaDatabase.sharedInstance;\n" )
			outFile.write( "\t\t\tint tableIndex = db.PushDatasetValue( DBName, id );\n" )
			outFile.write( "\t\t\tvar L = db.GetLuaState();\n" )
            outFile.write( "\t\t\tif ( L.IsTable( tableIndex ) == false ) {\n" )
			outFile.write( "\t\t\t    L.Remove( tableIndex );\n" )
			outFile.write( "\t\t\t    Common.UDebug.LogError( \"{0}[{1}] is nil\", DBName, id );\n" )
            outFile.write( "\t\t\t    return null;\n" )
            outFile.write( "\t\t\t}\n" )

			outFile.write( string.format( "\t\t\tusing ( var q = db.CreateQuery( tableIndex, DBName ) ) {\n" ) )
			outFile.write( "\t\t\t\tvar temp = ReadOne( q, id );\n" )
			outFile.write( "\t\t\t\tif ( temp != null ) {\n" )
			if needCache then
				outFile.write( "\t\t\t\t\tm_idCache.Add( id, temp );\n" )
				if nameKey then
					outFile.indent( 5 )
					outFile.write( string.format( "if ( !String.IsNullOrEmpty( temp.m_%s ) ) {\n", nameKey ) )
					outFile.indent()
					outFile.write( string.format( "%s t = null;\n", datasetName ) )
					outFile.write( string.format( "if ( !m_nameCache.TryGetValue( temp.m_%s, out t ) ) {\n", nameKey ) )
					outFile.indent()
					outFile.write( string.format( "m_nameCache.Add( temp.m_%s, temp );\n", nameKey ) )
					outFile.outdent()
					outFile.write( "} else {\n" )
					outFile.indent()
					outFile.write( string.format( "UDebug.LogWarning( \"Database.%s: Name key {0} already exists!\", temp.m_%s );\n", datasetName, nameKey ) )
					outFile.outdent()
					outFile.write( "}\n" )
					outFile.outdent()
					outFile.write( "}\n" )
					outFile.outdent( 5 )
				end
			end
			outFile.write( "\t\t\t\t\treturn temp;\n" )
			outFile.write( "\t\t\t\t}\n" )
			outFile.write( "\t\t\t}\n" )
			outFile.write( "\t\t\treturn null;\n" )
			outFile.write( "\t\t}\n\n" )

			--fields hash
			local fieldsHashs = table.concat( sortedNames )
			local fieldsHash = HashString( fieldsHashs )
			outFile.write( string.format( "\t\tconst int VersionHash = 0x%08x;\n", fieldsHash ) )

			outFile.write( "\t\t#endregion\n" )
			outFile.write( "\t}\n" )

			if hasEx then
				outFile.write( "\n" )
				outFile.write( string.format( "\tpublic partial class %sEx {\n", datasetName ) )
					outFile.write( string.format( "\t\tpublic delegate void LoadComplexField( %s data, LuaDatabase.Query q );\n", datasetName ) )
					for _, _v in ipairs( complexFields ) do
						local k = _v[1]
						local v = _v[2]
						outFile.write( string.format( "\t\tinternal static bool IsValid_%s = true;\n", k ) )
						outFile.write( string.format( "\t\tstatic LoadComplexField OnLoadComplexField_%s = null;\n", k ) )
						outFile.write( string.format( "\t\tpublic static LoadComplexField onLoadComplexField_%s {\n", k ) )
							outFile.write( "\t\t\tget {\n" )
								outFile.write( string.format( "\t\t\t\treturn OnLoadComplexField_%s;\n", k ) )
							outFile.write( "\t\t\t}\n" )
						outFile.write( "\t\t}\n" )
					end
				outFile.write( "\t}\n" )
			end

			outFile.write( "}\n" )


			outFile.write( "//EOF\n" )
			flag = true
		end
	end
	if flag == false then
		print( string.format( "write %s.cs file failed", datasetName ) )
	end
end


--[[
local test = {
	[1] = "a",
	[2.5] = "b",
	[100.5] = "1_key",
	[0] = "0_key",
	name = "xixi",
	age = 32,
	internal = {
		[1] = "a",
		[2.5] = "b",
		[100.5] = "1_key",
		[0] = "0_key",
		name = "xixi",
		age = 32,
	},
	WalkDataset_Default = function( t, visitor )
		local _visitor = visitor or {}
		if type( _visitor ) == "table" then
			setmetatable( _visitor, { __index = DefaultVisitor } )
			WalkDataset( t, _visitor )
		end
	end,
}
--]]

local _WalkDataset_Default = function( t, visitor )
	local _visitor = visitor or {}
	if type( _visitor ) == "table" then
		setmetatable( _visitor, { __index = DefaultVisitor } )
		return WalkDataset( t, _visitor )
	end
	return false
end

local _WalkDataset = function( t, visitor )
	if visitor then
		return WalkDataset( t, visitor )
	else
		return WalkDataset( t, DefaultVisitor )
	end
	return false
end

local _DefaultUnload = function( name )
	if Database and Database.loaded then
		if Database.loaded[ name ] ~= nil then
			--print( "unload dataset: "..name )
			Database.loaded[ name ] = nil
		end
	end
end

local _DefaultUnloadAll = function()
	Database = nil
end

local _DefaultLoad = function( name )
	if not Database then
		_G["Database"] = {}
		Database.loaded = {}
	end
	local loader = function( name )
		local r = Database.loaded[name]
		if r then
			return r
		end
		local pname = string.gsub( name, "%.", "/" )
		local split = function( s, p )
			local rt= {}
			string.gsub( s, '[^'..p..']+', function( w ) table.insert( rt, w ) end )
			return rt
		end

		local curName = pname..".lua"
		local fileName = DatabaseRoot.."/"..curName
		print("Load:"..fileName)
		local xstr = require "std.xstr"
		local checkFileName = function( path, name )
			path, _ = path:gsub( "/", "\\" )
			local _name = xstr.lower( name )
			for dir in io.popen( string.format( "dir \"%s\" /s/b", path ) ):lines() do
				local s, e, f = dir:find( ".+\\(.+%.lua)$" )
				if f then
					local _f = xstr.lower( f )
					if _name == _f then
						return name == f, f -- not match, real name
					end
				end
			end
		end

		local m, real = checkFileName( DatabaseRoot, curName )
		if not m and real then
			local msg = string.format( "filename must be matched by case! realname: \"%s\", you pass: \"%s\"", real, curName )
			print( msg )
			os.execute( "pause" )
		end

		local chunk = loadfile( fileName )
		if not chunk then
			fileName = LuaRoot.."/"..pname..".lua"
			chunk, err = loadfile( fileName )
			if err then
				print( "\n\n" )
				print( "----------------------------------" )
				print( "Load lua failed: "..fileName )
				print( "Error:" )
				print( "\t"..err )
				print( "----------------------------------" )
				print( "\n\n" )
			end
		end
		assert( chunk )
		if not chunk then
			os.execute( "pause" )
		end
		local rval = chunk()
		if rval.__name ~= nil then
			os.execute( "pause table's key must not be '__name' which is the reserved keyword." )
		end
		if rval.__sourcefile ~= nil then
			os.execute( "pause table's key must not be '__sourcefile' which is the reserved keyword." )
		end
		rval.__name = name
		rval.__sourcefile = fileName

		local namespace = Database
		local ns = split( pname, '/' )
		local xname = ns[#ns] -- last one
		if #ns > 1 then
			for i = 1, #ns - 1 do
				local n = ns[i];
				if namespace[n] == nil then
					namespace[n] = {}
				end
				namespace = namespace[n]
			end
		end
		namespace[xname] = rval
		Database.loaded[name] = rval
		return rval
	end
	return loader( name )
end

local function SetNumberSerializedFormat( f )
	NumberSerializedFormat = f or DefaultNumberSerializedFormat
	if NumberSerializedFormat == "" then
		NumberSerializedFormat = DefaultNumberSerializedFormat
	end
	print( "set NumberSerializedFormat: ".. NumberSerializedFormat )
end

local _Load = DBLib and DBLib.Load or _DefaultLoad
local _Unload = DBLib and DBLib.Unload or _DefaultUnload

return {
	ImpType = DBLib and "C#" or "Lua",
	DatabaseCodeRoot = DatabaseCodeRoot,
	DatabaseRoot = DatabaseRoot,
  SetDatabaseRoot = function( root ) DatabaseRoot = root end,
	LuaRoot = LuaRoot,
	DatasetCSNames = DatasetCSNames,
	DatasetFieldNameBank = DatasetFieldNameBank,
	GenCSharpDefine = DBLib and nil or GenCSharpDefine,
	CreateFileWriter = CreateFileWriter,
	PrintDataset = PrintDataset,
	TrimDataset = TrimDataset,
	TrimDatasetFile = TrimDatasetFile,
	WalkDataset_Default = _WalkDataset_Default,
	WalkDataset = _WalkDataset,
	SerializeTable = SerializeTable,
	SerializeTableToPythonDict = SerializeTableToPythonDict,
	DeserializeTable = DeserializeTable,
	SetNumberSerializedFormat = SetNumberSerializedFormat,
	HashString = HashString,
	Load = _Load,
	Unload = _Unload,
	Reload = function( name )
		_Unload( name )
		_Load( name )
	end,
	UnloadAll = DBLib and DBLib.UnloadAll or _DefaultUnloadAll,
}

