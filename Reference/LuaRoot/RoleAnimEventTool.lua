local check_common = function( bank, animName )
	-- for each model
	print( "check animation events: "..animName )
	for k, v in pairs( bank.models ) do
		-- animation clip: run
		if v.animIds then
			local index = v.animIds[ animName ]
			if index then
				-- animation clip events list here:
				local events = bank.animationEvents[ index ]
				if events and table.maxn( events ) ~= 0 then
					print( bank.animationFiles[ index ] )
					-- list all event function name
					for i = 1, #events do
						print( "\t"..events[i].func )
					end
					-- clear it!!!
					bank.animationEvents[ index ] = {}
				end
			end
		else
			print( k.." has no animation clips!" )
		end
	end
	return bank
end

return {
	check_run = check_run,
	check = function( bank )
		bank = check_common( bank, "hit" )
		bank = check_common( bank, "run" )
		bank = check_common( bank, "idle" )
		return bank
	end
}
