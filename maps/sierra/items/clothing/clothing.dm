//Try to keep this limited. I don't want unique solgov or NT items in here, it should only be things that require the sierra map datums like access.

/obj/item/rig/hazard/guard
	name = "hazard hardsuit control module"

/obj/item/clothing/head/helmet/space/rig/hazard/guard
	camera = /obj/machinery/camera/network/research

/obj/item/rig/hazard/guard

	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/mounted/energy/taser
		)

/obj/item/clothing/suit/space/void/sapper
	name = "\improper sapper voidsuit"
	desc = "A specially produced heavy suit for sapper units on space facilities. Usually, uses as emergency spacesuit."
	icon_state = "rig-secTG"
	item_state = "rig-secTG"
	icon = 'maps/sierra/icons/mob/onmob/onmob_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'maps/sierra/icons/mob/onmob/onmob_suit.dmi')
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_SHIELDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	flags_inv = HIDESHOES|HIDEJUMPSUIT|HIDEGLOVES
	siemens_coefficient = 0

/obj/item/clothing/suit/space/void/sapper/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 2

/obj/item/clothing/head/helmet/space/void/sapper
	name = "sapper voidsuit helmet"
	desc = "A specially produced heavy helmet for sapper units on space facilities."
	icon_state = "rig0-secTG"
	item_state = "rig0-secTG"
	item_icons = list(slot_head_str = 'maps/sierra/icons/mob/onmob/onmob_head.dmi')
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_SHIELDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
	)
	item_state_slots = list(
		slot_l_hand_str = "sec_helm",
		slot_r_hand_str = "sec_helm",
		)
	siemens_coefficient = 0
	light_overlay = "helmet_light_dual"

/obj/item/clothing/accessory/cloak/colorable/black
	color = "#222222"

/obj/item/clothing/accessory/cloak/colorable/get_mob_overlay(mob/user_mob, slot) //Colorable cloak stuff for voidsuits that dont exist in core code
	. = ..()

	if(istype(loc, /obj/item/clothing/suit/space/void/exploration) || istype(loc, /obj/item/clothing/suit/space/void/atmos/alt))
		return overlay_image(accessory_icons[slot], "colorcloak_fat", color, RESET_COLOR)

/obj/item/clothing/suit/space/void/exploration/helldiver
	name = "helldiver combat voidsuit"
	icon = 'maps/sierra/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'maps/sierra/icons/mob/onmob/onmob_suit.dmi')
	desc = "This armor is the Super Earth Standard Issue, made from the same titanium alloy as the Superdestroyer's hull."
	icon_state = "void_helldiver"
	item_state = "void_helldiver"
	sprite_sheets = list(
		SPECIES_UNATHI = 'maps/torch/icons/mob/unathi/onmob_suit_spacesuits_solgov_unathi.dmi'
		)
	sprite_sheets_obj = list(
		SPECIES_UNATHI = 'maps/torch/icons/obj/unathi/obj_suit_solgov_unathi.dmi'
		)
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/stack/flag,/obj/item/device/scanner/health,/obj/item/device/gps,/obj/item/pinpointer/radio,/obj/item/material/hatchet/machete,/obj/item/shovel)

/obj/item/clothing/suit/space/void/exploration/helldiver/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/helldiver
	boots = /obj/item/clothing/shoes/magboots
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_INVALID_FOR_CHAMELEON

/obj/item/clothing/head/helmet/space/void/exploration/helldiver
	name = "helldiver combat voidsuit helmet"
	desc = "This armor is the Super Earth Standard Issue, made from the same titanium alloy as the Superdestroyer's hull."
	icon = 'maps/sierra/icons/obj/clothing/obj_head.dmi'
	item_icons = list(slot_head_str = 'maps/sierra/icons/mob/onmob/onmob_head.dmi')
	icon_state = "void_helldiver"
	item_state = "void_helldiver"
	sprite_sheets = list(
		SPECIES_UNATHI = 'maps/torch/icons/mob/unathi/onmob_head_spacesuits_solgov_unathi.dmi'
		)
	sprite_sheets_obj = list(
		SPECIES_UNATHI = 'maps/torch/icons/obj/unathi/obj_head_solgov_unathi.dmi'
		)
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	light_overlay = "helmet_light_dual"
	tinted = FALSE
	valid_accessory_slots = null
	restricted_accessory_slots = null

/obj/item/rig/exploration/helldiver
	name = "Hell Commander HCM"
	suit_type = "Hell Commander hardsuit"
	icon = 'maps/sierra/icons/obj/clothing/uniques.dmi'
	item_icons = list(slot_back_str = 'maps/sierra/icons/mob/onmob/onmob_back.dmi')
	desc = "Helldiver Corps' Assault Armored Unit, A-Unit for short. Crafted to deliver Justice to the darkest crevices of the galaxy."
	icon_state = "rig_helldiver"
	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	offline_vision_restriction = TINT_HEAVY

	chest_type = /obj/item/clothing/suit/space/rig/combat/helldiver
	helm_type = /obj/item/clothing/head/helmet/space/rig/combat/helldiver
	boot_type = /obj/item/clothing/shoes/magboots/rig/combat/helldiver
	glove_type = /obj/item/clothing/gloves/rig/combat/helldiver

	offline_vision_restriction = TINT_BLIND

	req_access = list()

/obj/item/clothing/head/helmet/space/rig/combat/helldiver
	light_overlay = "helmet_light_dual_green"
	species_restricted = list(SPECIES_HUMAN, SPECIES_IPC)
	icon = 'maps/sierra/icons/obj/clothing/obj_head.dmi'
	item_icons = list(slot_head_str = 'maps/sierra/icons/mob/onmob/onmob_head.dmi')

/obj/item/clothing/suit/space/rig/combat/helldiver
	species_restricted = list(SPECIES_HUMAN,SPECIES_IPC)
	icon = 'maps/sierra/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'maps/sierra/icons/mob/onmob/onmob_suit.dmi')
	allowed = list(
		/obj/item/device/flashlight,
		/obj/item/tank,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/handcuffs,
		/obj/item/device/t_scanner,
		/obj/item/rcd,
		/obj/item/rpd,
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/device/multitool,
		/obj/item/device/radio,
		/obj/item/device/scanner/gas,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/melee/baton,
		/obj/item/gun,
		/obj/item/storage/firstaid,
		/obj/item/reagent_containers/hypospray,
		/obj/item/roller_bed,
		/obj/item/device/suit_cooling_unit
	)

/obj/item/clothing/shoes/magboots/rig/combat/helldiver
	species_restricted = list(SPECIES_HUMAN,SPECIES_IPC)
	icon = 'maps/sierra/icons/obj/clothing/obj_feet.dmi'
	item_icons = list(slot_shoes_str = 'maps/sierra/icons/mob/onmob/onmob_feet.dmi')

/obj/item/clothing/gloves/rig/combat/helldiver
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_NOCUFFS
	species_restricted = list(SPECIES_HUMAN,SPECIES_IPC)
	icon = 'maps/sierra/icons/obj/clothing/obj_hands.dmi'
	item_icons = list(slot_gloves_str = 'maps/sierra/icons/mob/onmob/onmob_hands.dmi')

/obj/item/rig/exploration/helldiver/equipped
	initial_modules = list(
		/obj/item/rig_module/mounted/energy/egun,
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/combat,
		/obj/item/rig_module/cooling_unit
		)


//SEAF Ranks

/obj/item/clothing/accessory/solgov/rank/seaf
	name = "SEAF ranks"
	desc = "Insignia denoting a rank of some kind. These appear blank."
	icon_state = "fleetrank"

/obj/item/clothing/accessory/solgov/rank/seaf/enlisted
	name = "ranks (E-1 cadet)"
	desc = "Insignia denoting the rank of Cadet. Glory to Super Earth!"
	icon_state = "fleetrank_e1"

/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e2
	name = "ranks (E-2 space cadet)"
	desc = "Insignia denoting the rank of Space Cadet. Glory to Super Earth!"
	icon_state = "fleetrank_e2"

/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e3
	name = "ranks (E-3 crewman)"
	desc = "Insignia denoting the rank of Crewman. Glory to Super Earth!"
	icon_state = "fleetrank_e3"

/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e4
	name = "ranks (E-4 space crewman)"
	desc = "Insignia denoting the rank of Space Crewman. Glory to Super Earth!"
	icon_state = "fleetrank_e4"

/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e5
	name = "ranks (E-5 sergeant)"
	desc = "Insignia denoting the rank of Sergeant. Glory to Super Earth!"
	icon_state = "fleetrank_e5"

/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e6
	name = "ranks (E-6 master sergeant)"
	desc = "Insignia denoting the rank of Master Sergeant. Glory to Super Earth!"
	icon_state = "fleetrank_e6"

/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e7
	name = "ranks (E-7 space chief)"
	desc = "Insignia denoting the rank of Space Chief. Glory to Super Earth!"
	icon_state = "fleetrank_e7"

/obj/item/clothing/accessory/solgov/rank/seaf/enlisted/e8
	name = "ranks (E-8 space chief prime)"
	desc = "Insignia denoting the rank of Space Chief Prime. Glory to Super Earth!"
	icon_state = "fleetrank_e8"

/obj/item/clothing/accessory/solgov/rank/seaf/officer
	name = "ranks (O-1 ensign)"
	desc = "Insignia denoting the rank of Ensign. Glory to Super Earth!"
	icon_state = "fleetrank_o1"

/obj/item/clothing/accessory/solgov/rank/seaf/officer/wo1_monkey
	name = "makeshift ranks (WO-1 warrant officer 1)"
	desc = "Insignia denoting the mythical rank of Warrant Officer. Too bad it's obviously fake. Still, glory to Super Earth!"
	icon_state = "fleetrank_o1"

/obj/item/clothing/accessory/solgov/rank/seaf/officer/o2
	name = "ranks (O-2 sub-lieutenant)"
	desc = "Insignia denoting the rank of Sub-lieutenant. Glory to Super Earth!"
	icon_state = "fleetrank_o2"

/obj/item/clothing/accessory/solgov/rank/seaf/officer/o3
	name = "ranks (O-3 lieutenant)"
	desc = "Insignia denoting the rank of Lieutenant. Glory to Super Earth!"
	icon_state = "fleetrank_o3"

/obj/item/clothing/accessory/solgov/rank/seaf/officer/o4
	name = "ranks (O-4 lieutenant commander)"
	desc = "Insignia denoting the rank of Lieutenant Commander. Glory to Super Earth!"
	icon_state = "fleetrank_o4"

/obj/item/clothing/accessory/solgov/rank/seaf/officer/o5
	name = "ranks (O-5 commander)"
	desc = "Insignia denoting the rank of Commander. Glory to Super Earth!"
	icon_state = "fleetrank_o5"

/obj/item/clothing/accessory/solgov/rank/seaf/officer/o6
	name = "ranks (O-6 death captain)"
	desc = "Insignia denoting the rank of Death Captain. Glory to Super Earth!"
	icon_state = "fleetrank_o6"

/obj/item/clothing/accessory/solgov/rank/seaf/flag
	name = "ranks (O-7 commodore)"
	desc = "Insignia denoting the rank of Commodore. Glory to Super Earth!"
	icon_state = "fleetrank_o7"

/obj/item/clothing/accessory/solgov/rank/seaf/flag/o8
	name = "ranks (O-8 rear admiral)"
	desc = "Insignia denoting the rank of Rear Admiral. Glory to Super Earth!"
	icon_state = "fleetrank_o8"

/obj/item/clothing/accessory/solgov/rank/seaf/flag/o9
	name = "ranks (O-9 admiral)"
	desc = "Insignia denoting the rank of Admiral. Glory to Super Earth!"
	icon_state = "fleetrank_o9"

/obj/item/clothing/accessory/solgov/rank/seaf/flag/o10
	name = "ranks (O-10 skull admiral)"
	desc = "Insignia denoting the rank of Skull Admiral. Glory to Super Earth!"
	icon_state = "fleetrank_o10"

/obj/item/clothing/accessory/solgov/rank/seaf/flag/o10_alt
	name = "ranks (O-10 admirable admiral)"
	desc = "Insignia denoting the rank of Admirable Admiral. Glory to Super Earth!"
	icon_state = "fleetrank_o10"
