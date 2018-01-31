local function decodeEscapeString( s )
	if type( s ) == "string" then
		local ofs = string.find( s, '\\' )
		if not ofs then
			return s
		end
		local substr = string.sub
		local buf = {}
		local last = 0
		local c = ''
		local i = 1
		local step = 2
		local len = #s
		while i <= len do
			c = substr( s, i, i + 1 )
			step = 2
			if c == '\\n' then
				buf[#buf + 1] = "\n"
			elseif c == '\\t' then
				buf[#buf + 1] = "\t"
			elseif c == '\\r' then
				buf[#buf + 1] = "\r"
			elseif c == '\\a' then
				buf[#buf + 1] = "\a"
			elseif c == '\\b' then
				buf[#buf + 1] = "\b"
			elseif c == '\\v' then
				buf[#buf + 1] = "\v"
			elseif c == '\\f' then
				buf[#buf + 1] = "\f"
			else
				last = i
				step = 1
				buf[#buf + 1] = substr( c, 1, 1 )
			end
			i = i + step
		end
		s = table.concat( buf, "" )
	end
	return s
end

local function escapeCSV( s )
	if type( s ) == "string" then
		if string.find( s, '[,"]' ) then
			s = '"' .. string.gsub( s, '"', '""' ) .. '"'
		end
		local buf = {}
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
				elseif c == '\v' then
					buf[#buf + 1] = "\\v"
				elseif c == '\f' then
					buf[#buf + 1] = "\\f"
				else
					buf[#buf + 1] = c
				end
			end
		)
		local r = table.concat( buf, "" )
		if #r == 0 then
			return '""'
		else
			return r
		end
	end
	return s
end

-- Convert from CSV string to table (converts a single line of a CSV file)
local function fromCSV( s )
	s = s .. ',' -- ending comma
	local t = {} -- table to collect fields
	local fieldstart = 1
	local slen = string.len( s )
	local sfind = string.find
	local ssub = string.sub
	local tinsert = table.insert
	local sgsub = string.gsub
	repeat
		-- next field is quoted? (start with `"'?)
		if sfind( s, '^"', fieldstart ) then
			local a, c
			local i  = fieldstart
			repeat
				-- find closing quote
				a, i, c = sfind( s, '"("?)', i + 1 )
			until c ~= '"'    -- quote not followed by quote?
			if not i then error( 'unmatched "' ) end
			local f = ssub( s, fieldstart + 1, i - 1 )
			local value = ( sgsub( f, '""', '"' ) )
			local _value = decodeEscapeString( value )
			tinsert( t, tonumber( _value ) or _value )
			fieldstart = sfind( s, ',', i ) + 1
		else
			-- unquoted; find next comma
			local nexti = sfind( s, ',', fieldstart )
			local value = ssub( s, fieldstart, nexti - 1 )
			local _value = decodeEscapeString( value )
			tinsert( t, tonumber( _value ) or _value )
			fieldstart = nexti + 1
		end
	until fieldstart > slen
	return t
end

local function toCSV( tt )
	local s = ""
	for _, p in ipairs( tt ) do
		local n = escapeCSV( p )
		local t = type( n )
		if t == "string" or t == "number" then
			s = s .. "," .. n
		end
	end
	return string.sub( s, 2 ) -- remove first comma
end

local function load( fn, utf8 )
	local f = io.open( fn, "rb" )
	local r = {}
	if f then
		local size = f:seek( "end" )
		if utf8 and size >= 3 then
			f:seek( "set", 0 )
			local _1 = string.byte( f:read( 1 ) )
			local _2 = string.byte( f:read( 1 ) )
			local _3 = string.byte( f:read( 1 ) )
			if _1 ~= 0xef or _2 ~= 0xbb or _3 ~= 0xbf then
				f:close()
				error( "not a valid uf8 file!" )
				return
			end
		end
		if size >= 3 then
			if utf8 then
				f:seek( "set", 3 )
			end
			local index = 1
			local gsub = string.gsub
			for v in f:lines() do
				if #v == 0 then break end
				if #( gsub( v, "[%s]", "" ) ) == 0 then
					break
				end
				r[index] = fromCSV( v )
				index = index + 1
			end
		end
	end
	return r
end

local function save( fn, t, utf8 )
	local f = io.open( fn, "wb" )
	if utf8 then
		f:write( string.char( 0xef ) )
		f:write( string.char( 0xbb ) )
		f:write( string.char( 0xbf ) )
	end
	if f then
		local count = 0
		for r, c in ipairs( t ) do
			if count > 0 then
				f:write( "\n" )
			end
			f:write( toCSV( c ) )
			count = count + 1
		end
		f:close()
	end
end

return {
	load = load,
	save = save,
}
