/mob/living/bot/medbot
	name = "Medibot"
	desc = "A little medical robot. He looks somewhat underwhelmed."
	icon = 'icons/mob/bot/medibot.dmi'
	icon_state = "medibot0"
	req_access = list(list(access_medical, access_robotics))
	botcard_access = list(access_medical, access_morgue, access_surgery, access_chemistry, access_virology)
	var/skin = null //Set to "tox", "ointment" or "o2" for the other two firstaid kits.

	//AI vars
	var/last_newpatient_speak = 0
	var/vocal = 1

	//Healing vars
	var/obj/item/reagent_containers/glass/reagent_glass = null //Can be set to draw from this for reagents.
	var/injection_amount = 15 //How much reagent do we inject at a time?
	var/heal_threshold = 10 //Start healing when they have this much damage in a category
	var/use_beaker = 0 //Use reagents in beaker instead of default treatment agents.
	var/treatment_brute = /datum/reagent/tricordrazine
	var/treatment_oxy = /datum/reagent/tricordrazine
	var/treatment_fire = /datum/reagent/tricordrazine
	var/treatment_tox = /datum/reagent/tricordrazine
	var/treatment_virus = /datum/reagent/spaceacillin
	var/treatment_emag = /datum/reagent/toxin
	var/declare_treatment = 0 //When attempting to treat a patient, should it notify everyone wearing medhuds?

/mob/living/bot/medbot/handleIdle()
	if(vocal && prob(1))
		var/message = pick("Radar, put a mask on!", "There's always a catch, and it's the best there is.", "I knew it, I should've been a plastic surgeon.", "What kind of infirmary is this? Everyone's dropping like dead flies.", "Delicious!")
		say(message)

/mob/living/bot/medbot/handleAdjacentTarget()
	UnarmedAttack(target)

/mob/living/bot/medbot/lookForTargets()
	for(var/mob/living/carbon/human/H in view(7, src)) // Time to find a patient!
		if(confirmTarget(H))
			target = H
			if(last_newpatient_speak + 300 < world.time)
				var/message = pick("Hey, [H.name]! Hold on, I'm coming.", "Wait [H.name]! I want to help!", "[H.name], you appear to be injured!")
				say(message)
				custom_emote(1, "points at [H.name].")
				last_newpatient_speak = world.time
			break

/mob/living/bot/medbot/UnarmedAttack(mob/living/carbon/human/H, proximity)
	if(!..())
		return

	if(!on)
		return

	if(!istype(H))
		return

	if(busy)
		return

	if(H.stat == DEAD)
		var/death_message = pick("No! NO!", "Live, damnit! LIVE!", "I... I've never lost a patient before. Not today, I mean.")
		say(death_message)
		target = null
		return

	var/t = confirmTarget(H)
	if(!t)
		var/message = pick("All patched up!", "An apple a day keeps me away.", "Feel better soon!")
		say(message)
		target = null
		return

	icon_state = "medibots"
	visible_message(SPAN_WARNING("[src] is trying to inject [H]!"))
	if(declare_treatment)
		var/area/location = get_area(src)
		broadcast_medical_hud_message("[src] is treating <b>[H]</b> in <b>[location]</b>", src)
	busy = 1
	update_icons()
	if(do_after(src, 3 SECONDS, H, DO_DEFAULT | DO_USER_UNIQUE_ACT | DO_PUBLIC_PROGRESS))
		if(t == 1)
			reagent_glass.reagents.trans_to_mob(H, injection_amount, CHEM_BLOOD)
		else
			H.reagents.add_reagent(t, injection_amount)
		visible_message(SPAN_WARNING("[src] injects [H] with the syringe!"))
	busy = 0
	update_icons()

/mob/living/bot/medbot/update_icons()
	ClearOverlays()
	if(skin)
		AddOverlays(image('icons/mob/bot/medibot_skins.dmi', "medskin_[skin]"))
	if(busy)
		icon_state = "medibots"
	else
		icon_state = "medibot[on]"


/mob/living/bot/medbot/get_construction_info()
	return list(
		"Add a robotic <b>Left Arm</b> or <b>Right Arm</b> to a <b>First-Aid Kit</b>.",
		"Add a <b>Health Analyzer</b>.",
		"Add a <b>Proximity Sensor</b> to complete the medbot."
	)


/mob/living/bot/medbot/get_interactions_info()
	. = ..()
	.["Beaker"] = "<p>Installs the beaker into \the [initial(name)]. If installed, it will use the contents of the beaker for injections instead of tricordrazine. Only one beaker can be installed at a time. The access panel must be unlocked.</p>"


/mob/living/bot/medbot/get_antag_interactions_info()
	. = ..()
	.[CODEX_INTERACTION_EMAG] += "<p>Causes \the [initial(name)] to synthesize and inject toxins instead of tricordrazine. It will also try to inject any mob in sight except the one who emagged it, regardless of injury state.</p>"


/mob/living/bot/medbot/use_tool(obj/item/tool, mob/user, list/click_params)
	// Beaker - Inserts a beaker
	if (istype(tool, /obj/item/reagent_containers/glass))
		if (locked)
			USE_FEEDBACK_FAILURE("\The [src]'s access panel must be open before you can insert a beaker.")
			return TRUE
		if (reagent_glass)
			USE_FEEDBACK_FAILURE("\The [src] already has \a [reagent_glass] installed.")
			return TRUE
		if (!user.unEquip(tool, src))
			FEEDBACK_UNEQUIP_FAILURE(user, tool)
			return TRUE
		reagent_glass = tool
		user.visible_message(
			SPAN_NOTICE("\The [user] installs \a [tool] into \the [src]."),
			SPAN_NOTICE("You install \the [tool] into \the [src].")
		)
		return TRUE

	return ..()


/mob/living/bot/medbot/GetInteractTitle()
	. = "<head><title>Medibot v1.0 controls</title></head>"
	. += "<b>Automatic Medical Unit v1.0</b>"

/mob/living/bot/medbot/GetInteractStatus()
	. = ..()
	. += "<br>Beaker: "
	if(reagent_glass)
		. += "<A href='?src=\ref[src];command=eject'>Loaded \[[reagent_glass.reagents.total_volume]/[reagent_glass.reagents.maximum_volume]\]</a>"
	else
		. += "None loaded"

/mob/living/bot/medbot/GetInteractPanel()
	. = "Healing threshold: "
	. += "<a href='?src=\ref[src];command=adj_threshold;amount=-10'>--</a> "
	. += "<a href='?src=\ref[src];command=adj_threshold;amount=-5'>-</a> "
	. += "[heal_threshold] "
	. += "<a href='?src=\ref[src];command=adj_threshold;amount=5'>+</a> "
	. += "<a href='?src=\ref[src];command=adj_threshold;amount=10'>++</a>"

	. += "<br>Injection level: "
	. += "<a href='?src=\ref[src];command=adj_inject;amount=-5'>-</a> "
	. += "[injection_amount] "
	. += "<a href='?src=\ref[src];command=adj_inject;amount=5'>+</a> "

	. += "<br>Reagent source: <a href='?src=\ref[src];command=use_beaker'>[use_beaker ? "Loaded Beaker (When available)" : "Internal Synthesizer"]</a>"
	. += "<br>Treatment report is [declare_treatment ? "on" : "off"]. <a href='?src=\ref[src];command=declaretreatment'>Toggle</a>"
	. += "<br>The speaker switch is [vocal ? "on" : "off"]. <a href='?src=\ref[src];command=togglevoice'>Toggle</a>"

/mob/living/bot/medbot/GetInteractMaintenance()
	. = "Injection mode: "
	switch(emagged)
		if(0)
			. += "<a href='?src=\ref[src];command=emag'>Treatment</a>"
		if(1)
			. += "<a href='?src=\ref[src];command=emag'>Random (DANGER)</a>"
		if(2)
			. += "ERROROROROROR-----"

/mob/living/bot/medbot/ProcessCommand(mob/user, command, href_list)
	..()
	if(CanAccessPanel(user))
		switch(command)
			if("adj_threshold")
				if(!locked || issilicon(user))
					var/adjust_num = text2num(href_list["amount"])
					heal_threshold = clamp(heal_threshold + adjust_num, 5, 75)
			if("adj_inject")
				if(!locked || issilicon(user))
					var/adjust_num = text2num(href_list["amount"])
					injection_amount = clamp(injection_amount + adjust_num, 5, 15)
			if("use_beaker")
				if(!locked || issilicon(user))
					use_beaker = !use_beaker
			if("eject")
				if(reagent_glass)
					if(!locked)
						reagent_glass.dropInto(src.loc)
						reagent_glass = null
					else
						to_chat(user, SPAN_NOTICE("You cannot eject the beaker because the panel is locked."))
			if("togglevoice")
				if(!locked || issilicon(user))
					vocal = !vocal
			if("declaretreatment")
				if(!locked || issilicon(user))
					declare_treatment = !declare_treatment

	if(CanAccessMaintenance(user))
		switch(command)
			if("emag")
				if(emagged < 2)
					emagged = !emagged

/mob/living/bot/medbot/emag_act(remaining_uses, mob/user)
	. = ..()
	if(!emagged)
		if(user)
			to_chat(user, SPAN_WARNING("You short out [src]'s reagent synthesis circuits."))
			ignore_list |= user
		visible_message(SPAN_WARNING("[src] buzzes oddly!"))
		flick("medibot_spark", src)
		target = null
		busy = 0
		emagged = TRUE
		on = 1
		update_icons()
		. = 1

/mob/living/bot/medbot/explode()
	on = 0
	visible_message(SPAN_DANGER("[src] blows apart!"))
	var/turf/Tsec = get_turf(src)

	new /obj/item/storage/firstaid/empty(Tsec)
	new /obj/item/device/assembly/prox_sensor(Tsec)
	new /obj/item/device/scanner/health(Tsec)
	if (prob(50))
		new /obj/item/robot_parts/l_arm(Tsec)

	if(reagent_glass)
		reagent_glass.forceMove(Tsec)
		reagent_glass = null

	var/datum/effect/spark_spread/s = new /datum/effect/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/bot/medbot/confirmTarget(mob/living/carbon/human/H)
	if(!..())
		return 0

	if(H.stat == DEAD) // He's dead, Jim
		return 0

	if(emagged)
		return treatment_emag

	// If they're injured, we're using a beaker, and they don't have on of the chems in the beaker
	if(reagent_glass && use_beaker && ((H.getBruteLoss() >= heal_threshold) || (H.getToxLoss() >= heal_threshold) || (H.getToxLoss() >= heal_threshold) || (H.getOxyLoss() >= (heal_threshold + 15))))
		for(var/datum/reagent/R in reagent_glass.reagents.reagent_list)
			if(!H.reagents.has_reagent(R))
				return 1
			continue

	if((H.getBruteLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_brute)))
		return treatment_brute //If they're already medicated don't bother!

	if((H.getOxyLoss() >= (15 + heal_threshold)) && (!H.reagents.has_reagent(treatment_oxy)))
		return treatment_oxy

	if((H.getFireLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_fire)))
		return treatment_fire

	if((H.getToxLoss() >= heal_threshold) && (!H.reagents.has_reagent(treatment_tox)))
		return treatment_tox
