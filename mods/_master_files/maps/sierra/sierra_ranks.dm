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
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)


/datum/mil_branch/employee
	name = "Employee"
	name_short = "empl"
	email_domain = "mail.nanotrasen.net"

	rank_types = list(
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/nt,
		/datum/mil_rank/civ/offduty,
		/datum/mil_rank/civ/synthetic
	)
