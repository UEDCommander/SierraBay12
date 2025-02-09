/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank = /datum/mil_rank/civ/civ
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)

/datum/map/sierra
	branch_types = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/contractor,
		/datum/mil_branch/seaf,
		/datum/mil_branch/ministry,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/iccgn,
		/datum/mil_branch/css,
		/datum/mil_branch/fleet,
		/datum/mil_branch/scga
	)

	spawn_branch_types = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/contractor,
		/datum/mil_branch/seaf,
		/datum/mil_branch/ministry,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/iccgn,
		/datum/mil_branch/css,
		/datum/mil_branch/fleet,
		/datum/mil_branch/scga
	)

/*
 * Species restricts
 * =================
 */

	species_to_branch_blacklist = list(
		/datum/species/human    = list(
			/datum/mil_branch/alien,
			/datum/mil_branch/skrell_fleet),
		/datum/species/machine  = list(
			/datum/mil_branch/alien,
			/datum/mil_branch/skrell_fleet),
		/datum/species/adherent = list(
			/datum/mil_branch/contractor,
			/datum/mil_branch/alien,
			/datum/mil_branch/skrell_fleet),
		/datum/species/unathi   = list(
			/datum/mil_branch/alien,
			/datum/mil_branch/skrell_fleet),
		/datum/species/skrell   = list(
			/datum/mil_branch/alien),
		/datum/species/nabber   = list(
			/datum/mil_branch/civilian,
			/datum/mil_branch/seaf,
			/datum/mil_branch/alien,
			/datum/mil_branch/skrell_fleet),
		/datum/species/diona    = list(
			/datum/mil_branch/contractor,
			/datum/mil_branch/alien,
			/datum/mil_branch/skrell_fleet),
		/datum/species/vox      = list(
			/datum/mil_branch/contractor,
			/datum/mil_branch/seaf,
			/datum/mil_branch/skrell_fleet
		)
	)

	species_to_branch_whitelist = list(
		/datum/species/diona      = list(/datum/mil_branch/civilian,
		 								 /datum/mil_branch/seaf),
		/datum/species/nabber     = list(/datum/mil_branch/contractor),
		/datum/species/skrell     = list(/datum/mil_branch/civilian,
		 								 /datum/mil_branch/seaf,
		 								 /datum/mil_branch/contractor,
		 								 /datum/mil_branch/skrell_fleet),
		/datum/species/unathi     = list(/datum/mil_branch/civilian,
										 /datum/mil_branch/seaf,
										 /datum/mil_branch/contractor),
		/datum/species/adherent   = list(/datum/mil_branch/civilian,
										 /datum/mil_branch/seaf),
		/datum/species/vox        = list(/datum/mil_branch/alien,
										 /datum/mil_branch/civilian)
	)

	species_to_rank_whitelist = list(
		/datum/species/vox = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		)
	)


/*
 *  Branches
 *  ========
 */

/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "civ"
	email_domain = "freemail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	assistant_job = "Passenger"

/datum/mil_branch/contractor
	name = "Contractor"
	name_short = "contr"
	email_domain = "freemail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)


/datum/mil_branch/seaf
	name = "Super Earth Armed Forces"
	name_short = "SEAF"
	email_domain = "mail.seaf.net"

	rank_types = list(
		/datum/mil_rank/seaf/e1,
		/datum/mil_rank/seaf/e2,
		/datum/mil_rank/seaf/e3,
		/datum/mil_rank/seaf/e4,
		/datum/mil_rank/seaf/e5,
		/datum/mil_rank/seaf/e6,
		/datum/mil_rank/seaf/e7,
		/datum/mil_rank/seaf/e8,
		/datum/mil_rank/seaf/o1,
		/datum/mil_rank/seaf/o2,
		/datum/mil_rank/seaf/o3,
		/datum/mil_rank/seaf/o4,
		/datum/mil_rank/seaf/o5,
		/datum/mil_rank/seaf/o6,
		/datum/mil_rank/seaf/o7,
		/datum/mil_rank/seaf/o8,
		/datum/mil_rank/seaf/o9,
		/datum/mil_rank/seaf/o10,
		/datum/mil_rank/seaf/o10_alt
	)

	spawn_rank_types = list(
		/datum/mil_rank/seaf/e1,
		/datum/mil_rank/seaf/e2,
		/datum/mil_rank/seaf/e3,
		/datum/mil_rank/seaf/e4,
		/datum/mil_rank/seaf/e5,
		/datum/mil_rank/seaf/e6,
		/datum/mil_rank/seaf/e7,
		/datum/mil_rank/seaf/e8,
		/datum/mil_rank/seaf/o1,
		/datum/mil_rank/seaf/o2,
		/datum/mil_rank/seaf/o3,
		/datum/mil_rank/seaf/o4,
		/datum/mil_rank/seaf/o5,
		/datum/mil_rank/seaf/o6
	)

/datum/mil_branch/ministry
	name = "Ministry of Truth"
	name_short = "gov"
	email_domain = "secg.net"

	rank_types = list(
		/datum/mil_rank/civ/gov
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/gov
	)

/datum/mil_rank/grade()
	. = ..()
	if(!sort_order)
		return ""
	if(sort_order <= 10)
		return "E[sort_order]"
	return "O[sort_order - 10]"

// Within the scope of the Torch, this is the only necessary differentiation.
/datum/mil_rank/rank_category()
	. = ..()
	if(!sort_order)
		return null
	if(sort_order <= 10)
		return GET_SINGLETON(/singleton/rank_category/enlisted)
	else
		return GET_SINGLETON(/singleton/rank_category/commissioned)

/singleton/rank_category/enlisted
	name = "Enlisted"

/singleton/rank_category/commissioned
	name = "Commissioned"

/*
 *  Fleet
 *  =====
 */

/datum/mil_rank/seaf/e1
	name = "Cadet"
	name_short = "CA"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 1

/datum/mil_rank/seaf/e2
	name = "Space Cadet"
	name_short = "SCA"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e2, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 2

/datum/mil_rank/seaf/e3
	name = "Crewman"
	name_short = "CN"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e3, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 3

/datum/mil_rank/seaf/e4
	name = "Space Crewman"
	name_short = "SCN"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e4, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 4

/datum/mil_rank/seaf/e5
	name = "Sergeant"
	name_short = "SGT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e5, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 5

/datum/mil_rank/seaf/e6
	name = "Master Sergeant"
	name_short = "MSGT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e6, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 6

/datum/mil_rank/seaf/e7
	name = "Space Chief"
	name_short = "SCF"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e7, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 7

/datum/mil_rank/seaf/e8
	name = "Space Chief Prime"
	name_short = "SCP"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e8, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 8

/datum/mil_rank/seaf/o1
	name = "Ensign"
	name_short = "ENS"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/officer, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 11

/datum/mil_rank/seaf/o2
	name = "Sub-lieutenant"
	name_short = "SLT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/officer/o2, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 12

/datum/mil_rank/seaf/o3
	name = "Lieutenant"
	name_short = "LT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/officer/o3, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 13

/datum/mil_rank/seaf/o4
	name = "Lieutenant Commander"
	name_short = "LCDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/officer/o4, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 14

/datum/mil_rank/seaf/o5
	name = "Commander"
	name_short = "CDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/officer/o5, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 15

/datum/mil_rank/seaf/o6
	name = "Death Captain"
	name_short = "DCAP"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/officer/o6, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 16

/datum/mil_rank/seaf/o7
	name = "Commodore"
	name_short = "CDRE"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/flag, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 17

/datum/mil_rank/seaf/o8
	name = "Rear Admiral"
	name_short = "RADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/flag/o8, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 18

/datum/mil_rank/seaf/o9
	name = "Admiral"
	name_short = "ADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/flag/o9, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 19

/datum/mil_rank/seaf/o10
	name = "Skull Admiral"
	name_short = "SADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/flag/o10, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 20

/datum/mil_rank/seaf/o10_alt
	name = "Admirable Admiral"
	name_short = "AADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/seaf/flag/o10_alt, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 20

/*
 *  Civilians
 *  =========
 */

/datum/mil_rank/civ/civ
	name = "Civilian"

/datum/mil_rank/civ/nt
	name = "NanoTrasen Employee"

/datum/mil_rank/civ/gov
	name = "Government Employee"

/datum/mil_rank/civ/contractor
	name = "Civilian Contractor"

/datum/mil_rank/civ/offduty
	name = "Off-Duty Personnel"

/datum/mil_rank/civ/synthetic
	name = "Synthetic"

/*
 * Vox/foreign alien branch
 * ========================
 */

/datum/mil_branch/alien
	name = "Alien"
	name_short = "Alien"
	rank_types = list(/datum/mil_rank/alien)
	spawn_rank_types = list(/datum/mil_rank/alien)

/datum/mil_rank/alien
	name = "Alien"
