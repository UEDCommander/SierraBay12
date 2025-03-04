LEGACY_RECORD_STRUCTURE(virus_records, virus_record)

#define DISEASE_SPREAD_AIRBORNE "Airborne"
#define DISEASE_SPREAD_CONTACT "Contact"
#define DISEASE_SPREAD_BLOOD "Blood"

/datum/disease2/disease
	var/infectionchance = 60
	var/speed = 1
	var/spreadtype = DISEASE_SPREAD_CONTACT // Can also be "Airborne"
	var/stage = 1
	var/dead = 0
	var/clicks = 0
	var/uniqueID = 0
	var/list/datum/disease2/effect/effects = list()
	var/antigen = list() //A list of characters that represent antigens that cure this virus.
	var/max_stage = 4
	var/list/affected_species = list(SPECIES_HUMAN,SPECIES_UNATHI,SPECIES_SKRELL)
	var/list/spread_types = list(DISEASE_SPREAD_AIRBORNE = 2, DISEASE_SPREAD_CONTACT = 2, DISEASE_SPREAD_BLOOD = 6)

/datum/disease2/disease/New()
	uniqueID = rand(0,10000)
	..()

/datum/disease2/disease/proc/makerandom(severity=2)
	var/list/excludetypes = list()
	for(var/i=1 ; i <= max_stage ; i++ )
		var/datum/disease2/effect/E = get_random_virus2_effect(i, severity, excludetypes)
		E.stage = i
		if(!E.allow_multiple)
			excludetypes += E.type
		effects += E
	uniqueID = rand(0,10000)
	switch(severity)
		if(1,2)
			infectionchance = rand(10,20)
		else
			infectionchance = rand(60,90)

	antigen = list(pick(ALL_ANTIGENS))
	antigen |= pick(ALL_ANTIGENS)
	spreadtype = prob(70) ? DISEASE_SPREAD_AIRBORNE : DISEASE_SPREAD_CONTACT

	if(LAZYLEN(GLOB.species_by_name))
		affected_species = get_infectable_species()

/proc/get_infectable_species()
	var/list/meat = list()
	var/list/res = list()
	for (var/specie in GLOB.species_by_name)
		var/singleton/species/S = GLOB.species_by_name[specie]
		if((S.spawn_flags & SPECIES_CAN_JOIN) && !S.get_virus_immune() && !S.greater_form)
			meat += S
	if(LAZYLEN(meat))
		var/num = rand(1,LAZYLEN(meat))
		for(var/i=0,i<num,i++)
			var/singleton/species/picked = pick_n_take(meat)
			res |= picked.name
			if(picked.primitive_form)
				res |= picked.primitive_form
	return res

/datum/disease2/disease/proc/process(mob/living/carbon/human/mob)
	if(dead)
		cure(mob)
		return

	if(mob.stat == DEAD)
		return

	if(stage <= 1 && clicks == 0) 	// with a certain chance, the mob may become immune to the disease before it starts properly
		if(prob(mob.virus_immunity() * 0.05))
			cure(mob, 1)
			return

	// Some species are flat out immune to organic viruses.
	if(mob.species.get_virus_immune(mob))
		cure(mob)
		return

	if(mob.radiation > 70)
		if((mob.species.name == SPECIES_DIONA) && prob(mob.radiation/25))
			cure(mob)
		else if(prob(1))
			majormutate()

	if(prob(mob.virus_immunity()) && prob(stage)) // Increasing chance of curing as the virus progresses
		cure(mob,1)
	//Waiting out the disease the old way
	if(stage == max_stage && clicks > max(stage*100, 300))
		if(prob(mob.virus_immunity() * 0.05 + 100-infectionchance))
			cure(mob, 1)

	var/top_badness = 1
	for(var/datum/disease2/effect/e in effects)
		if(e.stage == stage)
			top_badness = max(top_badness, e.badness)

	//Space antibiotics might stop disease completely
	if(mob.chem_effects[CE_ANTIVIRAL] > top_badness)
		if(stage == 1 && prob(20))
			cure(mob)
		return

	clicks += speed
	//Virus food speeds up disease progress
	if(mob.reagents.has_reagent(/datum/reagent/nutriment/virus_food))
		mob.reagents.remove_reagent(/datum/reagent/nutriment/virus_food, REM)
		clicks += 10

	//Moving to the next stage
	if(clicks > max(stage*100, 300))
		if(stage < max_stage && prob(10))
			stage++
			clicks = 0

	//Do nasty effects
	for(var/datum/disease2/effect/e in effects)
		e.fire(mob,stage)

	//fever
	if(!mob.chem_effects[CE_ANTIVIRAL])
		mob.bodytemperature = max(mob.bodytemperature, min(310+5*min(stage,max_stage) ,mob.bodytemperature+5*min(stage,max_stage)))

/datum/disease2/disease/proc/cure(mob/living/carbon/mob, mob_gains_antigens)
	for(var/datum/disease2/effect/e in effects)
		e.deactivate(mob)

	mob.virus2.Remove("[uniqueID]")

	//Tries to remove the virus also from the bloodstream (only for human-like lifeforms).
	if(istype(mob, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = mob
		H.cure_virus(uniqueID)
		H.immunity = min(H.immunity + 25, H.immunity_norm)
		// On virus cure, give a small boost to immunity to help prevent instant reinfection with another virus

	if (mob_gains_antigens)
		mob.antibodies |= antigen

	SET_BIT(mob.hud_updateflag, STATUS_HUD)

/datum/disease2/disease/proc/minormutate()
	var/datum/disease2/effect/E = pick(effects)
	E.minormutate()

/datum/disease2/disease/proc/majormutate(badness = VIRUS_ENGINEERED)
	uniqueID = rand(0,10000)
	var/datum/disease2/effect/E = pick(effects)
	var/list/exclude = list()
	for(var/datum/disease2/effect/D in effects)
		if(D != E)
			exclude += D.type

	var/effect_stage = E.stage
	E.deactivate()
	effects -= E
	qdel(E)

	effects += get_random_virus2_effect(effect_stage, badness, exclude)

	antigen = list(pick(ALL_ANTIGENS))
	antigen |= pick(ALL_ANTIGENS)

	if (prob(5) && LAZYLEN(GLOB.species_by_name))
		affected_species = get_infectable_species()

/datum/disease2/disease/proc/getcopy()
	var/datum/disease2/disease/disease = new /datum/disease2/disease
	disease.infectionchance = infectionchance
	disease.spreadtype = spreadtype
	disease.speed = speed
	disease.antigen   = antigen
	disease.uniqueID = uniqueID
	disease.affected_species = affected_species.Copy()
	for(var/datum/disease2/effect/effect in effects)
		var/datum/disease2/effect/neweffect = new effect.type
		neweffect.generate(effect.data)
		neweffect.chance = effect.chance
		neweffect.multiplier = effect.multiplier
		neweffect.oneshot = effect.oneshot
		neweffect.stage = effect.stage
		disease.effects += neweffect
	return disease

/datum/disease2/disease/proc/issame(datum/disease2/disease/disease)
	. = 1

	var/list/types = list()
	for(var/datum/disease2/effect/d in effects)
		types += d.type
	for(var/datum/disease2/effect/d in disease.effects)
		if(!(d.type in types))
			return 0

	if (antigen != disease.antigen)
		return 0

/proc/virus_copylist(list/datum/disease2/disease/viruses)
	var/list/res = list()
	for (var/ID in viruses)
		var/datum/disease2/disease/V = viruses[ID]
		res["[V.uniqueID]"] = V.getcopy()
	return res


var/global/list/virusDB = list()
/datum/disease2/disease/proc/add_zero(t, u)
	return pad_left(t, u, "0")

/datum/disease2/disease/proc/name()
	.= "strain #[add_zero("[uniqueID]", 4)]"
	if ("[uniqueID]" in virusDB)
		var/datum/computer_file/data/virus_record/V = virusDB["[uniqueID]"]
		.= V.fields["name"]

/datum/disease2/disease/proc/get_info(skill = HAS_PERK, verbose = 1, given_effects)
	if(!given_effects)
		given_effects = effects
	var/r = list()
	if(verbose)
		r += "<small>Analysis determined the existence of a GNAv2-based viral lifeform.</small><br>"
		r += "<u>Designation:</u> [name()]<br>"
		r += "<u>Antigen:</u> [antigens2string(antigen)]<br>"
		r += "<u>Transmitted By:</u> [spreadtype]<br>"
	else
		r = "[name()]"

	var/list/dat = list()
	if(skill >= HAS_PERK)
		if(verbose)
			r += "<u>Rate of Progression:</u> [speed * 100]%<br>"
			var/species = affected_species.Copy()
			r += "<u>Species Affected:</u> [jointext(species, ", ")]<br>"
			r += "<u>Symptoms:</u><br>"

		for(var/datum/disease2/effect/E in given_effects)
			dat += E.get_effect_info(verbose)

	. = verbose ? JOINTEXT(r + dat) : "[r] ([jointext(dat, ", ")])"


/datum/disease2/disease/proc/addToDB()
	if ("[uniqueID]" in virusDB)
		return 0
	var/datum/computer_file/data/virus_record/v = new()
	v.fields["id"] = uniqueID
	v.fields["name"] = name()
	v.fields["description"] = get_info()
	v.fields["antigen"] = antigens2string(antigen)
	v.fields["spread type"] = spreadtype
	virusDB["[uniqueID]"] = v
	return 1


/proc/virology_letterhead(report_name)
	return {"
		<center><h1><b>[report_name]</b></h1></center>
		<center><small><i>[station_name()] Virology Lab</i></small></center>
		<hr>
"}

/datum/disease2/disease/proc/can_add_symptom(type)
	for(var/datum/disease2/effect/H in effects)
		if(H.type == type && !H.allow_multiple)
			return 0

	return 1
