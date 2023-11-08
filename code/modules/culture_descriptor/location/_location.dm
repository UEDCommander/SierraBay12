/singleton/cultural_info/location
	desc_type = "Home System"
	category = TAG_HOMEWORLD
	var/distance = 0
	var/ruling_body = FACTION_SOL_CENTRAL
	var/capital

/singleton/cultural_info/location/get_text_details()
	. = list()
	if(!isnull(capital))
		. += "<b>Столица:</b> [capital]." // [SIERRA-EDIT] - EXPANDED_CULTURE_DESCRIPTOR - Перевод
		//. += "<b>Capital:</b> [capital]." // [SIERRA-EDIT] - ORIGINAL
	if(!isnull(ruling_body))
		. += "<b>Принадлежность:</b> [ruling_body]." // [SIERRA-EDIT] - EXPANDED_CULTURE_DESCRIPTOR - Перевод
		//. += "<b>Territory:</b> [ruling_body]." // [SIERRA-EDIT] - ORIGINAL
	if(!isnull(distance))
		. += "<b>Расстояние от Солнца:</b> [distance]." // [SIERRA-EDIT] - EXPANDED_CULTURE_DESCRIPTOR - Перевод
		//. += "<b>Distance from Sol:</b> [distance]." // [SIERRA-EDIT] - ORIGINAL
	. += ..()
