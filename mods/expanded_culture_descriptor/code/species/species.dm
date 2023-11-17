/datum/species
	var/list/extended_cultural_info = list()


/datum/species/New()
	. = ..()
	for(var/token in ALL_CULTURAL_TAGS)
		
		var/force_val = force_cultural_info[token]
		if(force_val)
			default_cultural_info[token] = force_val
			available_cultural_info[token] = list(force_val)

		else if(additional_available_cultural_info[token])
			if(!available_cultural_info[token])
				available_cultural_info[token] = list()
			available_cultural_info[token] |= additional_available_cultural_info[token]

		else if(!LAZYLEN(available_cultural_info[token]))
			var/list/map_systems = GLOB.using_map.available_cultural_info[token]
			available_cultural_info[token] = map_systems.Copy()
			
		if(extended_cultural_info[token])
			available_cultural_info[token] |= extended_cultural_info[token]

		if(LAZYLEN(available_cultural_info[token]) && !default_cultural_info[token])
			var/list/avail_systems = available_cultural_info[token]
			default_cultural_info[token] = avail_systems[1]

		if(!default_cultural_info[token])
			default_cultural_info[token] = GLOB.using_map.default_cultural_info[token]
