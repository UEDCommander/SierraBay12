/datum/reagent/toxin/yeosvenom
	name = "Esh Hashaar Haashane"
	description = "A non-lethal toxin produced by Yeosa'Unathi"
	taste_description = "absolutely vile"
	color = "#91d895"
	target_organ = BP_LIVER
	strength = 1

/datum/reagent/toxin/yeosvenom/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(volume*10))
		M.confused = max(M.confused, 10)
	..()
