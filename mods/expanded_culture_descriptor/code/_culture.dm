/singleton/cultural_info
	var/nickname

/singleton/cultural_info/proc/get_nickname()
	var/V = name
	if(nickname)
		V = nickname
	return V
