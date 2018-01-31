local Root = "L:/Client"

if io and io.popen and not LuaTinker then
	local cd = io.popen( "cd" ):read( '*l' )
	--print( "cd: "..cd )
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
package.path = package.path..';'..DatabaseRoot..'/?.lua'..';'.. LuaRoot..'/?.lua'

local DatabaseLocalTextName = "_LocaleText"
local StringBankOutput = DatabaseRoot.."/"..DatabaseLocalTextName..".lua"
local StringBankCSVOutput = DatabaseRoot.."/"..DatabaseLocalTextName..".csv"
local StringInCodeSourcePath = DatabaseRoot.."/../../Code/Localization/TextDef.cs"
local StringHelpSourcePath = Root.."/Assets/ToolOutput/Help"
local StringHelpFlsPath = Root.."/Assets/StreamingAssets/FileRoot/Help.fls"
local MaxStringBankBinSize = 524288
local LanguageLeadingTag = '@'
local StringInCode = "strings"
local DatabaseTool = require "DatabaseTool"
local MaxLocalVariableNum = 190 -- lparser.c #define MAXVARS 200
local RefTableName = "__rt"
local MaskFieldName = "__mask"
local DefaultValueTableName = "__default_values"
local EnableDatasetOptimize = true
local EnableDefaultValueOptimize = true

local SerializeTable = DatabaseTool.SerializeTable
local DHashString = DatabaseTool.HashString
local floor = math.floor
local fmod = math.mod or math.fmod
local gmatch = string.gmatch
local pow = math.pow
local string_sub = string.sub
local table_concat = table.concat
local Base64_table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local FileExcludes = {
	[DatabaseLocalTextName] = true,
	Chinese = true,
	Korean = true,
	English = true,
	Traditional = true,
	offstringlogin = true,
	offstringingame = true,
	modelInfo = true,
	RoleAnimEventBank = true,
}

local AllLocalizeFiles = {
	[StringInCode] = true
}

--table-addr == tostring( table )
local UniquifyTables = {} -- hash -> table
local UniquifyTablesIds = {} -- id -> hash
local UniquifyTablesInvIds = {} -- table -> id
local UniquifyTablesRefCounter = {} -- table -> refcount

local function toUniqueTableRefName( id )
	--MaxLocalVariableNum
	if id <= MaxLocalVariableNum then
		return string.format( RefTableName.."_%d", id )
	else
		return string.format( RefTableName.."[%d]", id - MaxLocalVariableNum )
	end
end

local function ordererFor( _table, _func )
	if type( _table ) == "table" then
		local kv = {}
		for k, v in pairs( _table ) do
			kv[#kv + 1] = { k, v }
		end
		table.sort( kv,
			function( _l, _r )
				local l = _l[1]
				local r = _r[1]
				if type( l ) == type( r ) then
					return l < r
				else
					return tostring( l ) < tostring( r )
				end
			end
		)
		for _, _v in ipairs( kv ) do
			local k = _v[1]
			local v = _v[2]
			_func( k, v )
		end
	end
end

local function ordererValueFor( _table, _func )
	if type( _table ) == "table" then
		local kv = {}
		for k, v in pairs( _table ) do
			kv[#kv + 1] = { k, v }
		end
		table.sort( kv,
			function( _l, _r )
				local l = _l[2]
				local r = _r[2]
				if type( l ) == type( r ) then
					return l < r
				else
					return tostring( l ) < tostring( r )
				end
			end
		)
		for _, _v in ipairs( kv ) do
			local k = _v[1]
			local v = _v[2]
			_func( k, v )
		end
	end
end

local function uniquifyTable( t )
	if t == nil or type( t ) ~= "table" then
		return nil
	end
	local hash = SerializeTable( t, true, true )
	local ref = UniquifyTables[ hash ]
	if ref then
		local refcount = UniquifyTablesRefCounter[ ref ] or 1
		UniquifyTablesRefCounter[ ref ] = refcount + 1
		return ref
	end

	local overwrites = nil
	for k, v in pairs( t ) do
		overwrites = overwrites or {}
		if type( v ) == "table" then
			overwrites[ k ] = uniquifyTable( v )
		end
	end
	if overwrites then
		for k, v in pairs( overwrites ) do
			t[ k ] = overwrites[ k ]
		end
	end
	local id = #UniquifyTablesIds + 1
	UniquifyTablesIds[ id ] = hash
	UniquifyTables[ hash ] = t
	UniquifyTablesInvIds[ t ] = id
	UniquifyTablesRefCounter[ t ] = 1
	return t
end

local function scanAllFileNames( path )
	path, _ = path:gsub( "/", "\\" )
	local ret = {}
	for dir in io.popen( string.format( "dir \"%s\" /S/b", path ) ):lines() do
		local s, e, f = dir:find( ".+\\(.+)%.lua$" )
		if f then
			table.insert( ret, f )
		end
	end
	table.sort( ret )
	return ret
end

local function scanAllTxtFileNames( path )
	path, _ = path:gsub( "/", "\\" )
	local ret = {}
	for dir in io.popen( string.format( "dir \"%s\" /S/b", path ) ):lines() do
		local s, e, f =dir:find("(.+)%.txt$")
		if f then
			table.insert( ret, dir )
		end
	end
	return ret
end

local function hashString( v )
	local val = 0
	local fmod = fmod
	local byte = string.byte
	local MaxStringBankBinSize = MaxStringBankBinSize
	local c
	for _c in gmatch( v, "." ) do
		c = byte( _c )
		val = val + c * 193951
		val = fmod( val, MaxStringBankBinSize )
		val = val * 399283
		val = fmod( val, MaxStringBankBinSize )
	end
	return val
end

local function EncodeSBinMask( v )
	local c = 0
	local num = 0
	local ret = {}
	local index_table = Base64_table
	for _c in gmatch( v, "." ) do
		c = c + ( _c - '0' ) * pow( 2, num )
		num = num + 1
		if num == 6 then
			ret[ #ret + 1 ] = string_sub( index_table, c + 1, c + 1 )
			num = 0
			c = 0
		end
	end
	if num ~= 0 then
		ret[ #ret + 1 ] = string_sub( index_table, c + 1, c + 1 )
	end
	return table_concat( ret )
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

local function addStringToBank( stringBank, str )
	local meta = getmetatable( stringBank )
	local reversed = nil
	local counter = nil
	if not meta then
		meta = { __counter = { used = {} }, __reversed = {} }
		reversed = meta.__reversed
		counter = meta.__counter
		setmetatable( stringBank, meta )
		local remove = {}
		for h, s in pairs( stringBank ) do
			local _h = reversed[ s ]
			assert( _h == nil )
			reversed[ s ] = h
		end
	end
	reversed = reversed or meta.__reversed
	counter = counter or meta.__counter
	local hash = reversed[ str ]
	if hash then
		counter.used[ hash ] = true
		return hash
	end
	hash = hashString( str )
	local _v = stringBank[ hash ]
	while _v do
		hash = hash + 1
		hash = fmod( hash, MaxStringBankBinSize )
		_v = stringBank[ hash ]
	end
	assert( not reversed[ str ], "hash conflicted: "..str )
	stringBank[ hash ] = str
	reversed[ str ] = hash
	counter.used[ hash ] = true
	return hash
end

local function dumpStringBank( stringBank )
	print( 'dump database local string bank begin...' )
	for k, v in pairs( stringBank ) do
		print( string.format( "\t[%g] = %s", k, v ) )
	end
	print( 'dump database local string bank end.' )
end

local function saveStringBank( stringBank, tofile )
	if tofile then
		local fileName = StringBankOutput
		print ("Save str to : "..fileName)
		local _file, err = io.open( fileName )
		if _file ~= nil then
			_file:close()
			os.remove( fileName )
		end
		file = io.open( fileName, "w" )
		file:write( string.format( "local %s = {\n", DatabaseLocalTextName ) )
		for k, v in pairs( stringBank ) do
			file:write( string.format( "\t[%g] = %s,\n", k, EncodeEscapeString( v ) ) )
		end
		file:write( "}\n" )
		file:write( string.format( "return %s\n--EOF", DatabaseLocalTextName ) )
		file:close()
	else
		dumpStringBank( stringBank )
	end
end

local function saveStringBankCSV( stringBank, tofile )
	local _sss = {}
	for k, v in pairs( stringBank ) do
		assert( not _sss[v] )
		_sss[v] = k
	end
	if tofile then
		local csv = require "std.csv"
		local fileName = StringBankCSVOutput
		print ("Save to csv: "..fileName)
		local _file, err = io.open( fileName )
		if _file ~= nil then
			_file:close()
			os.remove( fileName )
		end
		local t = {}
		local count = 1
		for k, v in pairs( stringBank ) do
			t[count] = { k, v }
			count = count + 1
		end
		table.sort( t,
			function( a, b )
				return a[1] < b[1]
			end
		)
		csv.save( fileName, t, true )
	else
		dumpStringBank( stringBank )
	end
end

local function loadStringBankCSV()
	local stringBank = {}
	local csv = require "std.csv"
	local fileName = StringBankCSVOutput
	local file, err = io.open( fileName )
	print ("load str from : "..fileName)
	if file then
		--print( "load string bank: "..fileName )
		file:close()
		local b = csv.load( fileName, true )
		local allstr = {}
		for i = 1, #b do
			local key = b[i][1]
			local value = b[i][2]
			local oldHash = allstr[ value ]
			if not oldHash then
				stringBank[ key ] = value
				allstr[ value ] = key
			else
				--print( string.format( "\"%s\" already exists in StringBank with hash %d", value, oldHash ) )
			end
		end
	end
	return stringBank
end

local function createStringBank( info )
	local stringBank = {}
	setmetatable( stringBank, {} )
	local chunk = loadfile( StringBankOutput )
	if chunk then
		--print( 'load string bank: '..StringBankOutput )
		local last = chunk()
		if last and type( last ) == "table" then
			for k, v in pairs( last ) do
				stringBank[k] = v
			end
		end
	end
	return stringBank
end

local function checkIfNeedUtf8( v )
	if v ~= nil and type( v ) == "string" then
		for i = 1, #v do
			local c = string.byte( string.sub( v, i, i ), 1 )
			if c < 0 or c > 127 then
				utf8 = true
				return true
			end
		end
	end
	return false
end

local function LocalizeDatabase( locale, tofile )
	if locale and type( locale ) == "string" and #locale > 1 then
		local xstr = require "std.xstr"
		locale = xstr.lower( locale )
		local valid = true
		local excludes = {}
		if not valid then
			print( "invalid language type: "..locale )
			return
		end

		print( "current language: "..locale )
		local partten = string.format( "@%%a+.*_(%s)$", locale )
		local files = scanAllFileNames( DatabaseRoot )
		for _, v in ipairs( files ) do
			if not FileExcludes[v] then
				DatabaseTool.Reload( v )
				local t = Database[v]
				if t then
					DatabaseTool.TrimDatasetFile(
						t, excludes,
						tofile
					)
				end
			end
		end
	end
end

local function AddStringIdToHelpTxt( path, strBank, tofile )
	local file = io.open( path )
	assert( file )
	local data = file:read( "*a" )
	file:close()

	local id = addStringToBank( strBank,  data )
	if tofile then
		local fn = path:gsub( "ToolOutput" , "StreamingAssets" )
		local file = io.open( fn, "w" )
		if not file then
			local a, b, c = fn:find( "(.+)\\.+.txt" )
			if c then
				os.execute( string.format( "mkdir \"%s\"", c ) )
				file = assert( io.open(  fn, "w" ) )
			end
		end
		if file then
			file:write( id )
			file:close()
		end
	else
		print( string.format( "help: %s -> %d", path, id ) )
	end
end

local function localizeRecord( id, record, genCode, StringBank, isForceAdd )
	local localized_fields = nil
	local subTable = nil
	for k, v in pairs( record ) do
		local vt = type( v )
		if vt == "string" then
			if isForceAdd or checkIfNeedUtf8( v ) then
				if #v > 0 and string.sub( v, 1, 1 ) == LanguageLeadingTag then
					print( string.format( "invalid leading character for localized text! key, value: %s, %s", k, v ) )
					os.execute( "pause" )
				end
				if not localized_fields then
					localized_fields = {}
				end
				-- build localized id string with tag
				local sid = addStringToBank( StringBank, v )
				localized_fields[k] = string.format( "%s%g", LanguageLeadingTag, sid )
				if genCode then
					genCode[#genCode + 1] = {
						id,
						sid,
						v
					}
				end
			end
		elseif vt == "table" then
			if not subTable then
				subTable = {}
			end
			subTable[#subTable + 1] = v
		end
	end
	local localized = false
	if localized_fields then
		-- override localized string with tag
		localized = true
		for k, v in pairs( localized_fields ) do
			record[k] = localized_fields[k]
		end
	end
	if subTable then
		for _, sub in ipairs( subTable ) do
			localized = localizeRecord( 0, sub, genCode, StringBank ) or localized
		end
	end
	return localized
end

local function GetValueTypeNameCS( value )
	local t = type( value )
	if t == "string" then
		return "string"
	elseif t == "number" then
		if value == floor( value ) then
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

local function OptimizeDataset( dataset )
	local ids = {}
	local names = {}
	local idType = nil
	-- choose cs data type
	-- for all fields in a record
	local typeNameTable = {}
	for k, v in pairs( dataset ) do
		local _sk = tostring( k )
		if _sk ~= "__name" and _sk ~= "__sourcefile" then
			if not idType then
				idType = type( k )
			end
			if idType == type( k ) then
				ids[ #ids + 1 ] = k
			end
		end
	end
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
		for name, value in pairs( v ) do
			local nt = type( name )
			if nt == "string" and name == "id" then
				print( "this table already has a field named 'id'" )
			end
			if nt == "string" then
				names[ #names + 1 ] = name
			end
		end
		table.sort( names, function( a, b ) return a:lower() < b:lower() end )
		for i, field in ipairs( names ) do
			-- for all record/row
			for r, t in ipairs( ids ) do
				local record = dataset[ t ]
				if record[ field ] then
					local v = record[ field ]
					local curType = GetValueTypeNameCS( v )
					if not typeNameTable[ field ] then
						typeNameTable[ field ] = curType
					elseif typeNameTable[ field ] == "int" and curType == "float" then
						-- overwrite int to float
						typeNameTable[ field ] = curType
					elseif curType == "table" then
						-- overwrite to table
						typeNameTable[ field ] = curType
					end
				end
			end
			-- patching miss fields with default values
			local curType = typeNameTable[ field ]
			for r, t in ipairs( ids ) do
				local record = dataset[ t ]
				local v = record[ field ]
				if not v then
					local ft = typeNameTable[ field ]
					if ft == "string" then
						v = ""
					elseif ft == "number" or ft == "int" or ft == "float" then
						v = 0
					elseif ft == "table" then
						v = {}
					elseif ft == "bool" then
						v = false
					end
					record[ field ] = v
				end
			end
		end
	end

	ids = {}
	idType = nil
	UniquifyTables = {}
	UniquifyTablesIds = {}
	UniquifyTablesInvIds = {}
	UniquifyTablesRefCounter = {}

	local isIntegerKey = true
	local overwrites = nil
	ordererFor(
		dataset,
		function( k, v )
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
							isIntegerKey = k == floor( k )
						end
					end
				end
				if type( v ) == "table" then
					overwrites = overwrites or {}
					overwrites[ k ] = uniquifyTable( v )
				end
			end
		end
	)
	if overwrites then
		for k, v in pairs( overwrites ) do
			dataset[ k ] = overwrites[ k ]
		end
	end
	local returnVal = nil
	if EnableDefaultValueOptimize then
		local defaultValues = {}
		for i, field in ipairs( names ) do
			local curType = typeNameTable[ field ]
			-- for all record/row
			local defaultValueStat = {
			}
			for r, t in ipairs( ids ) do
				local record = dataset[ t ]
				local v = record[ field ]
				if v then
					local vcount = defaultValueStat[ v ] or 0
					defaultValueStat[ v ] = vcount + 1
				else
					assert( "default value missing!" )
				end
			end
			-- find the mostest used as a default value
			local max = -1
			local defaultValue = nil
			local _defaultValue = "{}"
			ordererValueFor(
				defaultValueStat,
				function( value, count )
					if count >= max then
						if count > max then
							max = count
							defaultValue = value
							_defaultValue = SerializeTable( defaultValue, true, true )
						else
							if curType == "table" then
								local _value = SerializeTable( value, true, true )
								if _value < _defaultValue then
									defaultValue = value
									_defaultValue = SerializeTable( defaultValue, true, true )
								end
							else
								if value < defaultValue then
									defaultValue = value
									_defaultValue = SerializeTable( defaultValue, true, true )
								end
							end
						end
					end
				end
			)
			if defaultValue then
				defaultValues[ field ] = defaultValue
			end
		end
		returnVal = defaultValues
	end

	-- remove tables whose's ref is 1 and re-mapping id
	local newid = 1
	local newIds = {}
	local newInvIds = {}

	ordererFor(
		UniquifyTablesIds,
		function( id, hash )
			local table = UniquifyTables[ hash ]
			local refcount = UniquifyTablesRefCounter[ table ]
			if refcount == 1 then
				UniquifyTables[ hash ] = nil
			else
				newIds[ newid ] = hash
				newInvIds[ table ] = newid
				newid = newid + 1
			end
		end
	)

	UniquifyTablesIds = newIds
	UniquifyTablesInvIds = newInvIds
	return returnVal
end

local function ExportDatabaseLocalText( tofile, new )
	print( DatabaseRoot )
	print( LuaRoot )
	print( DatabaseLocalTextName )
	print( StringBankOutput )
	print( StringBankCSVOutput)
	print( StringInCodeSourcePath )
	local StringBank = nil
	if new then
		StringBank = createStringBank()
	else
		StringBank = loadStringBankCSV()
	end
	local localized_dirty = false
	local files = scanAllFileNames( DatabaseRoot )
	for _, v in ipairs( files ) do
		if not FileExcludes[v] then
			local genCode = nil
			if StringInCode == v then
				genCode = {}
			end
			--print( "DatabaseTool.Load :"..v )
			DatabaseTool.Reload( v )
			local t = Database[ v ]
			local localized = false
			local fieldsHash = 0
			local maskOptimized = false
			if t then
				local datasetName = t.__name
				ordererFor(
					t,
					function( id, record )
						if type( record ) == "table" then
							localized = localizeRecord( id, record, genCode, StringBank, genCode ~= nil ) or localized
						end
					end
				)
				local tableRef = nil
				local defaultValues = nil
				if EnableDatasetOptimize then
					defaultValues = OptimizeDataset( t )
					if defaultValues then
						local allFields = {}
						local fieldNames = {}
						local fieldIdMap = {}
						for k, v in pairs( defaultValues ) do
							allFields[ #allFields + 1 ] = { k, v }
						end
						table.sort( allFields, function( a, b ) return a[1]:lower() < b[1]:lower() end )
						for id, v in ipairs( allFields ) do
							fieldIdMap[ v[1] ] = id
							if type( v[2] ) ~= "table" then
								fieldNames[ #fieldNames + 1 ] = v[1]
							end
						end
						for _, v in ipairs( allFields ) do
							if type( v[2] ) == "table" then
								fieldNames[ #fieldNames + 1 ] = v[1]
							end
						end
						local fieldsHashs = table.concat( fieldNames )
						fieldsHash = DHashString( fieldsHashs )
						local totalValidFieldNum = 0
						local maskRecordMap = {}
						local removeDefaultValues = function( record )
							local removes = nil
							local adds = nil
							local fieldIdMask = {}
							maskRecordMap[ record ] = fieldIdMask
							for field, defaultVal in pairs( defaultValues ) do
								local fieldId = fieldIdMap[ field ]
								local value = record[ field ]
								local hasValue = true
								if not value then
									assert( false, "should not be here!" )
									local ft = type( defaultVal )
									if ft == "string" then
										value = ""
									elseif ft == "number" or ft == "int" or ft == "float" then
										value = 0
									elseif ft == "table" then
										value = uniquifyTable( {} )
									end
									hasValue = false
								end
								if value == defaultVal and hasValue then
									removes = removes or {}
									removes[ #removes + 1 ] = field
									fieldIdMask[ fieldId ] = false
								else
									adds = adds or {}
									adds[ field ] = value
									fieldIdMask[ fieldId ] = true
									totalValidFieldNum = totalValidFieldNum + 1
								end
							end
							if removes then
								for _, f in ipairs( removes ) do
									record[ f ] = nil
								end
							end
							if adds then
								for f, v in pairs( adds ) do
									record[ f ] = v
								end
							end
						end
						local removed = {}
						local recordNum = 0
						for _, record in pairs( t ) do
							if type( record ) == "table" then
								if not removed[ record ] then
									removeDefaultValues( record )
									removed[ record ] = true
									recordNum = recordNum + 1
								end
							end
						end
						-- before: full_fields_num * record_count
						local maxTotalFieldNum = #fieldNames * recordNum
						-- mask_fields = record_count
						-- after: masked_fields_num + mask_fields + record_count
						local maskedTotalFieldNum = totalValidFieldNum + recordNum * 2
						if maskedTotalFieldNum < maxTotalFieldNum then
							--add mask field
							maskOptimized = true
							for _, record in pairs( t ) do
								if type( record ) == "table" then
									local fieldIdMask = maskRecordMap[ record ]
									local bits = {}
									for _, name in ipairs( fieldNames ) do
										local id = fieldIdMap[ name ]
										local mask = fieldIdMask[ id ]
										bits[ id ] = mask and "1" or "0"
									end
									bits = table.concat( bits )
									record[ MaskFieldName ] = EncodeSBinMask( bits )
								end
							end
						end
					end
					local reftables = nil
					local ptr2ref = nil
					-- create ref table: table -> refname
					for _, hash in pairs( UniquifyTablesIds ) do
						local t = UniquifyTables[ hash ]
						if t then
							local refName = toUniqueTableRefName( UniquifyTablesInvIds[ t ] )
							reftables = reftables or {}
							ptr2ref = ptr2ref or {}
							reftables[ refName ] = t
							ptr2ref[ t ] = refName
						end
					end
					tableRef = {
						name2value = reftables,
						tables = UniquifyTables, -- hash -> table
						tableIds = UniquifyTablesIds, -- id -> hash
						ptr2ref = ptr2ref, -- table -> refname
						refcounter = UniquifyTablesRefCounter, -- table -> refcount
						maxLocalVariableNum = MaxLocalVariableNum,
						refTableName = RefTableName,
						postOutput = function( ostream )
							if defaultValues then
								outFile.write(
									string.format(
										"local %s = %s\n",
										DefaultValueTableName,
										DatabaseTool.SerializeTable( defaultValues, false, false, ptr2ref )
									)
								)
								outFile.write( "do\n" )
								outFile.write( string.format( "\tlocal base = { __index = %s, __newindex = function() error( \"Attempt to modify read-only table\" ) end }\n", DefaultValueTableName ) )
								outFile.write( string.format( "\tfor k, v in pairs( %s ) do\n", datasetName ) )
								outFile.write( "\t\tsetmetatable( v, base )\n" )
								outFile.write( "\tend\n" )
								outFile.write( "\tbase.__metatable = false\n" )
								outFile.write( string.format( "\tsetmetatable( %s, { __default = __default_values, __hash = 0x%08x, __masked = %s } )\n", datasetName, fieldsHash, ( maskOptimized and "true" or "false" ) ) )
								outFile.write( "end\n" )
							end
						end
					}
				end

				localized_dirty = localized_dirty or localized
				DatabaseTool.TrimDatasetFile(
					Database[v], nil,
					tofile,
					tableRef
				)
			end
			if genCode and localized then
				if not tofile then
					print( "dump string in code:" )
					print( "-----------------------------------------------------" )
					for _, v in ipairs( genCode ) do
						print( string.format( "%s, %d, %s", v[1], v[2], v[3] ) )
					end
					print( "-----------------------------------------------------" )
				else
					local fn = StringInCodeSourcePath
					local _f = io.open( fn, "rb" )
					if _f then
						_f:close()
						os.remove( fn )
					end
					local f = io.open( fn, "wb" )
					f:write( string.char( 0xef ) )
					f:write( string.char( 0xbb ) )
					f:write( string.char( 0xbf ) )
					f:write( "//This file generated by LocalizeDatabase.lua, if you have any questions please contant to lujian.\n" )
					f:write( "namespace Locale {\n" )
					f:write( "\tpublic enum TextDef {\n" )
					for _, v in ipairs( genCode ) do
						f:write( string.format( "\t\t%s = %d,//%s\n", v[1], v[2], EncodeEscapeString( v[3] ) ) )
					end
					f:write( "\t}\n" )
					f:write( "}\n" )
					f:close()
				end
			end
		end
	end

	local helpFiles = scanAllTxtFileNames( StringHelpSourcePath )
	local flsResult = "100, 100000"
	local helpRootLength = string.len( StringHelpSourcePath ) + 2
	for _, v in ipairs( helpFiles ) do
		AddStringIdToHelpTxt( v, StringBank, tofile )
		local helpFls = string.sub( v, helpRootLength, -1 ):gsub( "\\", "/" )
		flsResult = flsResult.."\n"..helpFls
	end
	local file = io.open( StringHelpFlsPath, "w"  )
	file:write( flsResult )

	-- remove useless hash entries
	local stringBank = StringBank
	local meta = getmetatable( stringBank )
	if meta then
		local counter = meta.__counter
		if counter then
			local used = counter.used
			if used then
				local count = 0
				for hash, str in pairs( stringBank ) do
					count = count + 1
				end
				local unused = {}
				for hash, str in pairs( stringBank ) do
					if not used[ hash ] then
						unused[#unused + 1] = hash
					end
				end
				if #unused > 100 then
					for _, h in ipairs( unused ) do
						stringBank[ h ] = nil
					end
				end
			end
		end
	end
	if localized_dirty then
		saveStringBankCSV( StringBank, tofile )
	else
		print( "\nThere is no locale text be created.\n" )
	end
	print( "ExportDatabaseLocalText done." )
end

return {
	LocalizeDatabase = LocalizeDatabase,
	ExportDatabaseLocalText = ExportDatabaseLocalText,
	SetArea = function( area )
		print("set area: "..area)
		if area then
			DatabaseRoot = DatabaseRoot..'/'..area
			LuaRoot = Root.."/Assets/StreamingAssets/LuaRoot"
			package.path = package.path..';'..DatabaseRoot..'/?.lua'..';'.. LuaRoot..'/?.lua'
			StringBankOutput = DatabaseRoot.."/"..DatabaseLocalTextName..".lua"
			StringBankCSVOutput = DatabaseRoot.."/"..DatabaseLocalTextName..".csv"
			StringInCodeSourcePath = DatabaseRoot.."/../../../Code/Localization/TextDef.cs"
			print( '----------->')
			print( DatabaseRoot )
			print( LuaRoot )
			print( DatabaseLocalTextName )
			print( StringBankOutput )
			print( StringBankCSVOutput)
			print( StringInCodeSourcePath )
			print( '----------->')
		end
	end,
}


