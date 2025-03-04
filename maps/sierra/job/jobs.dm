#define VAGABONDS_JOBS /datum/job/vagabond
/datum/map/sierra
	species_to_job_whitelist = list(
		/singleton/species/adherent = list(ADHERENT_JOBS),
		/singleton/species/nabber = list(NABBER_JOBS),
		/singleton/species/vox = list(SILICON_JOBS, VAGABONDS_JOBS),
		/singleton/species/human/mule = list(SILICON_JOBS, VAGABONDS_JOBS)
	)

	species_to_job_blacklist = list(
		/singleton/species/unathi = list(HUMAN_ONLY_JOBS),
		/singleton/species/unathi/yeosa = list(HUMAN_ONLY_JOBS),
		/singleton/species/tajaran = list(HUMAN_ONLY_JOBS),
		/singleton/species/skrell = list(SKRELL_BLACKLISTED_JOBS),
		/singleton/species/machine = list(MACHINE_BLACKLISTED_JOBS),
		/singleton/species/diona = list(
			HUMAN_ONLY_JOBS, /datum/job/exploration_leader, /datum/job/explorer_pilot,
			/datum/job/officer, /datum/job/warden, /datum/job/detective,
			/datum/job/qm, /datum/job/explorer_medic,
			/datum/job/senior_engineer, /datum/job/senior_doctor,
			/datum/job/senior_scientist, /datum/job/security_assistant
		),
		/singleton/species/resomi = list(
	 		HUMAN_ONLY_JOBS, /datum/job/officer, /datum/job/exploration_leader,
	 		/datum/job/warden, /datum/job/chief_engineer, /datum/job/rd,
	 		/datum/job/iaa, /datum/job/security_assistant
 		)
	)

	allowed_jobs = list(
		/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos,
		/datum/job/iaa, /datum/job/iso, /datum/job/adjutant,
		/datum/job/exploration_leader, /datum/job/explorer, /datum/job/explorer_pilot, /datum/job/explorer_medic, /datum/job/explorer_engineer,
		/datum/job/senior_engineer, /datum/job/engineer, /datum/job/infsys, /datum/job/engineer_trainee,
		/datum/job/warden, /datum/job/detective, /datum/job/officer, /datum/job/security_assistant,
		/datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee, /datum/job/chemist, /datum/job/psychiatrist,
		/datum/job/qm, /datum/job/cargo_tech,  /datum/job/cargo_assistant, /datum/job/mining,
		/datum/job/chief_steward, /datum/job/janitor, /datum/job/cook, /datum/job/bartender, /datum/job/steward, /datum/job/chaplain, /datum/job/actor,
		/datum/job/senior_scientist, /datum/job/scientist, /datum/job/roboticist, /datum/job/scientist_assistant,
		/datum/job/ai, /datum/job/cyborg,
		/datum/job/assistant, /datum/job/vagabond
	)

	access_modify_region = list(
		ACCESS_REGION_SECURITY = list(access_hos, access_change_ids),
		ACCESS_REGION_MEDBAY = list(access_cmo, access_change_ids),
		ACCESS_REGION_RESEARCH = list(access_rd, access_change_ids),
		ACCESS_REGION_ENGINEERING = list(access_ce, access_change_ids),
		ACCESS_REGION_COMMAND = list(access_change_ids),
		ACCESS_REGION_GENERAL = list(access_hop, access_change_ids),
		ACCESS_REGION_SUPPLY = list(access_qm, access_change_ids),
	)

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ GAS JOBS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// GRADE C
/singleton/cultural_info/culture/nabber
	valid_jobs = list(/datum/job/janitor)  // THIS IS GRADE C- TRUST ME ~ SidVeld


/singleton/cultural_info/culture/nabber/c
	valid_jobs = list(/datum/job/janitor, /datum/job/cargo_assistant)


/singleton/cultural_info/culture/nabber/c/plus
	valid_jobs = list(/datum/job/janitor,    /datum/job/cargo_assistant,
					  /datum/job/scientist_assistant)


// GRADE B
/singleton/cultural_info/culture/nabber/b/minus
	valid_jobs = list(/datum/job/janitor)


/singleton/cultural_info/culture/nabber/b
	valid_jobs = list(/datum/job/janitor,    /datum/job/cargo_assistant,
					  /datum/job/bartender,  /datum/job/cook, /datum/job/steward,
					  /datum/job/scientist_assistant)


/singleton/cultural_info/culture/nabber/b/plus
	valid_jobs = list(/datum/job/janitor,    /datum/job/cargo_assistant,
					  /datum/job/bartender,  /datum/job/cook, /datum/job/steward,
					  /datum/job/scientist_assistant)


// GRADE A
/singleton/cultural_info/culture/nabber/a/minus
	valid_jobs = list(/datum/job/scientist_assistant)


/singleton/cultural_info/culture/nabber/a
	valid_jobs = list(/datum/job/cargo_assistant,
					  /datum/job/bartender,  /datum/job/cook, /datum/job/steward,
					  /datum/job/chemist,    /datum/job/doctor_trainee,
					  /datum/job/roboticist, /datum/job/engineer_trainee,
					  /datum/job/scientist_assistant)



/singleton/cultural_info/culture/nabber/a/plus
	valid_jobs = list(/datum/job/cargo_assistant,
					  /datum/job/bartender,  /datum/job/cook, /datum/job/steward,
					  /datum/job/chemist,    /datum/job/doctor_trainee,
					  /datum/job/roboticist, /datum/job/engineer_trainee,
					  /datum/job/scientist_assistant)


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


//[SIERRA-ADD] - [IPC-MODS]
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ IPC JOBS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/singleton/cultural_info/culture/ipc
	valid_jobs = list(/datum/job/engineer_trainee, /datum/job/doctor_trainee, /datum/job/cargo_tech, /datum/job/cargo_assistant, /datum/job/mining,
	/datum/job/janitor, /datum/job/cook, /datum/job/scientist_assistant, /datum/job/assistant, /datum/job/steward, /datum/job/ai, /datum/job/cyborg)

/singleton/cultural_info/culture/ipc/gen2
	valid_jobs = list(/datum/job/adjutant,
		/datum/job/exploration_leader, /datum/job/explorer, /datum/job/explorer_pilot, /datum/job/explorer_medic, /datum/job/explorer_engineer,
		/datum/job/senior_engineer, /datum/job/engineer, /datum/job/infsys, /datum/job/engineer_trainee,
		/datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee, /datum/job/chemist, /datum/job/chaplain,
		/datum/job/qm, /datum/job/cargo_tech,  /datum/job/cargo_assistant, /datum/job/mining,
		/datum/job/janitor, /datum/job/cook, /datum/job/bartender, /datum/job/steward, /datum/job/chief_steward,
		/datum/job/senior_scientist, /datum/job/scientist, /datum/job/roboticist, /datum/job/scientist_assistant,
		/datum/job/ai, /datum/job/cyborg, /datum/job/assistant,
		/datum/job/submap/bearcat_captain, /datum/job/submap/bearcat_crewman,
		/datum/job/submap/scavver_pilot, /datum/job/submap/scavver_doctor, /datum/job/submap/scavver_engineer
		)

/singleton/cultural_info/culture/ipc/gen3
	valid_jobs = list(/datum/job/hop, /datum/job/rd, /datum/job/cmo, /datum/job/chief_engineer,
		/datum/job/iaa, /datum/job/iso, /datum/job/adjutant,
		/datum/job/exploration_leader, /datum/job/explorer, /datum/job/explorer_pilot, /datum/job/explorer_medic, /datum/job/explorer_engineer,
		/datum/job/senior_engineer, /datum/job/engineer, /datum/job/infsys, /datum/job/engineer_trainee,
		/datum/job/warden, /datum/job/detective, /datum/job/officer,
		/datum/job/senior_doctor, /datum/job/doctor, /datum/job/doctor_trainee, /datum/job/chemist,
		/datum/job/qm, /datum/job/cargo_tech,  /datum/job/cargo_assistant, /datum/job/mining,
		/datum/job/janitor, /datum/job/cook, /datum/job/bartender, /datum/job/steward, /datum/job/chief_steward,
		/datum/job/senior_scientist, /datum/job/scientist, /datum/job/roboticist, /datum/job/scientist_assistant,
		/datum/job/ai, /datum/job/cyborg, /datum/job/assistant
)
//[/SIERRA-ADD] - [IPC-MODS]
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ADHERENT  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/singleton/cultural_info/faction/adherent/

	var/list/valid_jobs = list(/datum/job/ai, /datum/job/cyborg, /datum/job/assistant, /datum/job/janitor, /datum/job/engineer_trainee, /datum/job/cook, /datum/job/cargo_tech, /datum/job/scientist_assistant, /datum/job/doctor_trainee, /datum/job/engineer, /datum/job/mining, /datum/job/cargo_assistant, /datum/job/roboticist, /datum/job/chemist, /datum/job/bartender, /datum/job/steward, /datum/job/explorer_engineer)

/singleton/cultural_info/faction/adherent/loyalists
	valid_jobs = list(ADHERENT_JOBS)

/singleton/species/adherent/check_background(datum/job/job, datum/preferences/prefs)
	var/singleton/cultural_info/faction/adherent/faction = SSculture.get_culture(prefs.cultural_info[TAG_FACTION])
	. = istype(faction) ? (job.type in faction.valid_jobs) : ..()
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/datum/job
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	required_language = LANGUAGE_HUMAN_EURO
	psi_latency_chance = 8
	give_psionic_implant_on_join = FALSE
	var/requires_head

/datum/job/is_position_available()
	. = ..()
	if(. && requires_head)
		for(var/mob/M in GLOB.player_list)
			if(!M.client || !M.mind || !M.mind.assigned_job)
				continue
			if(M.mind.assigned_job.title == requires_head)
				return TRUE
		return FALSE

/datum/map/sierra
	default_assistant_title = "Crewman"

#undef HUMAN_ONLY_JOBS
#undef SILICON_JOBS
#undef ADHERENT_JOBS
#undef NABBER_JOBS
#undef SKRELL_BLACKLISTED_JOBS
#undef MACHINE_BLACKLISTED_JOBS
#undef VAGABONDS_JOBS
