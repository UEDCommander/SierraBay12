/obj/machinery/r_n_d/server
	name = "\improper R&D server"
	icon = 'icons/obj/machines/research/server.dmi'
	icon_state = "server"
	base_type = /obj/machinery/r_n_d/server
	construct_state = /singleton/machine_construction/default/panel_closed
	machine_name = "\improper R&D server"
	machine_desc = "A powerful piece of hardware used as the hub of a research matrix, containing every byte of data gleaned from an experiment."
	var/datum/research/files
	var/health = 100
	var/list/id_with_upload = list()	//List of R&D consoles with upload to server access.
	var/list/id_with_download = list()	//List of R&D consoles with download from server access.
	var/id_with_upload_string = ""		//String versions for easy editing in map editor.
	var/id_with_download_string = ""
	var/server_id = 0
	var/produces_heat = 1
	idle_power_usage = 800
	var/delay = 10
	req_access = list(access_rd) //Only the R&D can change server settings.


/obj/machinery/r_n_d/server/Destroy()
	//[SIERRA-ADD] - MODPACK_RND
	rnd_server_list -= src
	//[/SIERRA-ADD] - MODPACK_RND

	QDEL_NULL(files)
	return ..()


/obj/machinery/r_n_d/server/Initialize()
	. = ..()
	//[SIERRA-ADD] - MODPACK_RND
	rnd_server_list += src
	//[/SIERRA-ADD] - MODPACK_RND

	if(!files)
		files = new /datum/research(src)
	var/list/temp_list
	if(!length(id_with_upload))
		temp_list = list()
		temp_list = splittext(id_with_upload_string, ";")
		for(var/N in temp_list)
			id_with_upload += text2num(N)
	if(!length(id_with_download))
		temp_list = list()
		temp_list = splittext(id_with_download_string, ";")
		for(var/N in temp_list)
			id_with_download += text2num(N)
	update_icon()


/obj/machinery/r_n_d/server/operable()
	return !inoperable(MACHINE_STAT_EMPED)


/obj/machinery/r_n_d/server/on_update_icon()
	ClearOverlays()
	if (operable())
		AddOverlays(list(
			"server_on",
			"server_lights_on",
			emissive_appearance(icon, "server_lights_on"),
		))
	else
		AddOverlays(list(
			"server_lights_off",
			emissive_appearance(icon, "server_lights_off")
		))
	if (panel_open)
		AddOverlays("server_panel")


/obj/machinery/r_n_d/server/RefreshParts()
	var/tot_rating = 0
	for(var/obj/item/stock_parts/SP in src)
		tot_rating += SP.rating
	change_power_consumption(initial(idle_power_usage)/max(1, tot_rating), POWER_USE_IDLE)


/obj/machinery/r_n_d/server/Process()
	..()
	var/datum/gas_mixture/environment = loc.return_air()
	switch(environment.temperature)
		if(0 to T0C)
			health = min(100, health + 1)
		if(T0C to (T20C + 20))
			health = clamp(health, 0, 100)
		if((T20C + 20) to (T0C + 70))
			health = max(0, health - 1)
	if(health <= 0)
	//[SIERRA-EDIT] - MODPACK_RND
		files.forget_random_technology()
	//[/SIERRA-EDIT] - MODPACK_RND
	if(delay)
		delay--
	else
		produce_heat()
		delay = initial(delay)
	update_icon()

/obj/machinery/r_n_d/server/proc/produce_heat()
	if(!produces_heat)
		return

	if(!use_power)
		return

	if(operable()) //Blatently stolen from telecoms
		var/turf/simulated/L = loc
		if(istype(L))
			var/datum/gas_mixture/env = L.return_air()

			var/transfer_moles = 0.25 * env.total_moles

			var/datum/gas_mixture/removed = env.remove(transfer_moles)

			if(removed)
				var/heat_produced = idle_power_usage	//obviously can't produce more heat than the machine draws from it's power source

				removed.add_thermal_energy(heat_produced)

			env.merge(removed)

/obj/machinery/r_n_d/server/centcom
	name = "central R&D database"
	server_id = -1

/obj/machinery/r_n_d/server/centcom/proc/update_connections()
	var/list/no_id_servers = list()
	var/list/server_ids = list()
	for(var/obj/machinery/r_n_d/server/S as anything in SSmachines.get_machinery_of_type(/obj/machinery/r_n_d/server))
		switch(S.server_id)
			if(-1)
				continue
			if(0)
				no_id_servers += S
			else
				server_ids += S.server_id

	for(var/obj/machinery/r_n_d/server/S in no_id_servers)
		var/num = 1
		while(!S.server_id)
			if(num in server_ids)
				num++
			else
				S.server_id = num
				server_ids += num
		no_id_servers -= S

/obj/machinery/r_n_d/server/centcom/Process()
	return PROCESS_KILL //don't need process()

/obj/machinery/computer/rdservercontrol
	name = "\improper R&D server controller"
	icon_keyboard = "rd_key"
	icon_screen = "rdcomp"
	light_color = "#a97faa"
	machine_name = "\improper R&D server control console"
	machine_desc = "If an R&D server is the heart of a research setup, this is the brain. Any kind of data manipulation on the server happens from this console."
	var/screen = 0
	var/obj/machinery/r_n_d/server/temp_server
	var/list/servers = list()
	var/list/consoles = list()
	var/badmin = 0

/obj/machinery/computer/rdservercontrol/CanUseTopic(user)
	if(!allowed(user) && !emagged)
		to_chat(user, SPAN_WARNING("You do not have the required access level"))
		return STATUS_CLOSE
	return ..()

/obj/machinery/computer/rdservercontrol/OnTopic(user, href_list, state)
	if(href_list["main"])
		screen = 0
		. = TOPIC_REFRESH

	else if(href_list["access"] || href_list["data"] || href_list["transfer"])
		temp_server = null
		consoles = list()
		servers = list()
		for(var/obj/machinery/r_n_d/server/S as anything in SSmachines.get_machinery_of_type(/obj/machinery/r_n_d/server))
			if(S.server_id == text2num(href_list["access"]) || S.server_id == text2num(href_list["data"]) || S.server_id == text2num(href_list["transfer"]))
				temp_server = S
				break
		if(href_list["access"])
			screen = 1
			for(var/obj/machinery/computer/rdconsole/C as anything in SSmachines.get_machinery_of_type(/obj/machinery/computer/rdconsole))
				if(C.sync)
					consoles += C
		else if(href_list["data"])
			screen = 2
		else if(href_list["transfer"])
			screen = 3
			for(var/obj/machinery/r_n_d/server/S as anything in SSmachines.get_machinery_of_type(/obj/machinery/r_n_d/server))
				if(S == src)
					continue
				servers += S
		. = TOPIC_REFRESH

	else if(href_list["upload_toggle"])
		var/num = text2num(href_list["upload_toggle"])
		if(num in temp_server.id_with_upload)
			temp_server.id_with_upload -= num
		else
			temp_server.id_with_upload += num
		. = TOPIC_REFRESH

	else if(href_list["download_toggle"])
		var/num = text2num(href_list["download_toggle"])
		if(num in temp_server.id_with_download)
			temp_server.id_with_download -= num
		else
			temp_server.id_with_download += num
		. = TOPIC_REFRESH

//[SIERRA-EDIT] - MODPACK_RND
	else if(href_list["reset_tech"])
		var/choice = alert("Are you sure you want to reset this technology to its default data? Data lost cannot be recovered.", "Technology Data Reset", "Continue", "Cancel")
		if(choice == "Continue")
			temp_server.files.forget_all(href_list["reset_tech"])
		. = TOPIC_REFRESH

	else if(href_list["reset_technology"])
		var/choice = alert("Are you sure you want to delete this design? Data lost cannot be recovered.", "Techology Deletion", "Continue", "Cancel")
		var/techology = temp_server.files.researched_tech[href_list["reset_technology"]]
		if(choice == "Continue" && techology)
			temp_server.files.forget_techology(techology)
		. = TOPIC_REFRESH
//[/SIERRA-EDIT] - MODPACK_RND

/obj/machinery/computer/rdservercontrol/interface_interact(mob/user)
	interact(user)
	return TRUE

/obj/machinery/computer/rdservercontrol/interact(mob/user)
	user.set_machine(src)
	var/dat = ""

	switch(screen)
		if(0) //Main Menu
			dat += "Connected Servers:<BR><BR>"
			var/turf/T = get_turf(src)
			for(var/obj/machinery/r_n_d/server/S as anything in SSmachines.get_machinery_of_type(/obj/machinery/r_n_d/server))
				var/turf/ST = get_turf(S)
				if((istype(S, /obj/machinery/r_n_d/server/centcom) && !badmin) || (ST && !AreConnectedZLevels(ST.z, T.z)))
					continue
				dat += "[S.name] || "
				dat += "<A href='?src=\ref[src];access=[S.server_id]'> Access Rights</A> | "
				dat += "<A href='?src=\ref[src];data=[S.server_id]'>Data Management</A>"
				if(badmin) dat += " | <A href='?src=\ref[src];transfer=[S.server_id]'>Server-to-Server Transfer</A>"
				dat += "<BR>"

		if(1) //Access rights menu
			dat += "[temp_server.name] Access Rights<BR><BR>"
			dat += "Consoles with Upload Access<BR>"
			for(var/obj/machinery/computer/rdconsole/C in consoles)
				var/turf/console_turf = get_turf(C)
				dat += "* <A href='?src=\ref[src];upload_toggle=[C.id]'>[console_turf.loc]" //FYI, these are all numeric ids, eventually.
				if(C.id in temp_server.id_with_upload)
					dat += " (Remove)</A><BR>"
				else
					dat += " (Add)</A><BR>"
			dat += "Consoles with Download Access<BR>"
			for(var/obj/machinery/computer/rdconsole/C in consoles)
				var/turf/console_turf = get_turf(C)
				dat += "* <A href='?src=\ref[src];download_toggle=[C.id]'>[console_turf.loc]"
				if(C.id in temp_server.id_with_download)
					dat += " (Remove)</A><BR>"
				else
					dat += " (Add)</A><BR>"
			dat += "<HR><A href='?src=\ref[src];main=1'>Main Menu</A>"

//[SIERRA-EDIT] - MODPACK_RND
		if(2) //Data Management menu
			dat += "[temp_server.name] Data Management<BR><BR>"
			dat += "Known Tech Trees<BR>"
			for(var/datum/tech/T in temp_server.files.researched_tech)
				dat += "* [T.name] "
				dat += "<A href='?src=\ref[src];reset_tech=\ref[T]'>(Reset)</A><BR>"
			dat += "Known Technologies<BR>"
			for(var/t in temp_server.files.researched_nodes)
				var/datum/technology/T = t
				dat += "* [T.name] "
				dat += "<A href='?src=\ref[src];reset_techology=\ref[T]'>(Delete)</A><BR>"
			dat += "<HR><A href='?src=\ref[src];main=1'>Main Menu</A>"

//[/SIERRA-EDIT] - MODPACK_RND

		if(3) //Server Data Transfer
			dat += "[temp_server.name] Server to Server Transfer<BR><BR>"
			dat += "Send Data to what server?<BR>"
			for(var/obj/machinery/r_n_d/server/S in servers)
				dat += "[S.name] <A href='?src=\ref[src];send_to=[S.server_id]'> (Transfer)</A><BR>"
			dat += "<HR><A href='?src=\ref[src];main=1'>Main Menu</A>"
	show_browser(user, "<TITLE>R&D Server Control</TITLE><HR>[dat]", "window=server_control;size=575x400")
	onclose(user, "server_control")
	return

/obj/machinery/computer/rdservercontrol/emag_act(remaining_charges, mob/user)
	if(!emagged)
		playsound(src.loc, 'sound/effects/sparks4.ogg', 75, 1)
		emagged = TRUE
		req_access.Cut()
		to_chat(user, SPAN_NOTICE("You disable the security protocols."))
		src.updateUsrDialog()
		return 1

/obj/machinery/r_n_d/server/robotics
	name = "robotics R&D server"
	id_with_upload_string = "1;2;3"
	id_with_download_string = "1;2;3"
	server_id = 2

/obj/machinery/r_n_d/server/core
	name = "core R&D server"
	id_with_upload_string = "1;3"
	id_with_download_string = "1;3"
	server_id = 1
