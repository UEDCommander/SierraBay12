/*
	Research subsystem. Manages the static part of R&D, aka designs, technology nodes and such.
	Does NOT handle tech trees since they're supposed to be instantiated per console, to track user's progress.
	It holds instantiated designs, instantiated technologies (nodes) and tech tree types.
	It sets research datums' designs and creates a new tree for each datum.
*/

SUBSYSTEM_DEF(research)
	name = "Research"
	flags = SS_NO_FIRE
	init_order = SS_INIT_EARLY

	var/list/all_designs = list()	// All design datums
	var/list/starting_designs = list() // List of designs starts_unlocked = TRUE
	var/list/statting_technologies = list() // List of technologies that have no cost and no unlock requirements
	var/list/list/all_tech_trees = list() // All tech tree typepaths (keys) associated to a list of their tech node instances (list(values))
	var/list/all_tech_nodes = list() // All tech nodes
	var/list/design_categories_autolathe = list()

	var/research_initialized = FALSE

	// If a research holder or a design file is created before SS is initialized, put it here and initialize it later.
	var/list/design_files_to_init = list()
	var/list/research_files_to_init = list()

/datum/controller/subsystem/research/Initialize()
	for(var/R in subtypesof(/datum/design))
		var/datum/design/design = new R
		design.AssembleDesignInfo()
		if(!design.build_path)
			continue

		all_designs += design
		if(design.starts_unlocked)
			starting_designs += design

		var/datum/computer_file/binary/design/design_file = new
		design_file.design = design
		design_file.on_design_set()
		design.file = design_file

	for(var/T in subtypesof(/datum/tech))
		all_tech_trees[T] = list()

	for(var/T in subtypesof(/datum/technology))
		var/datum/technology/tech = new T
		all_tech_nodes += tech

		if(!tech.cost && !length(tech.required_technologies) && !length(tech.required_tech_levels))
			statting_technologies += tech

		if(tech.tech_type in all_tech_trees)
			all_tech_trees[tech.tech_type] += tech
		else
			WARNING("Unknown tech_type '[tech.tech_type]' in technology '[tech.name]'")

	research_initialized = TRUE
	for(var/i in research_files_to_init)
		initialize_research_datum(i)
	// Initialize design files that were created before
	for(var/file in design_files_to_init)
		initialize_design_file(file)
	design_files_to_init = list()

	AddAutolatheCategory()
	return ..()


/datum/controller/subsystem/research/proc/initialize_design_file(datum/computer_file/binary/design/design_file)
	// If designs are already generated, initialized right away.
	// If not, add them to the list to be initialized later.
	if(research_initialized)
		design_file.design = SSresearch.get_design(design_file.design)
		design_file.on_design_set()
	else
		design_files_to_init += design_file

/datum/controller/subsystem/research/proc/initialize_research_datum(datum/research/R)
	if(!research_initialized)
		research_files_to_init += R
		return
	for(var/i in all_tech_trees)
		var/datum/tech/T = new i
		T.maxlevel = LAZYLEN(all_tech_trees[i])
		R.researched_tech[T] = list()

	for(var/tech in statting_technologies)
		R.UnlockTechology(tech, initial = TRUE)

	for(var/design in starting_designs)
		R.AddDesign2Known(design)

/datum/controller/subsystem/research/proc/get_design(id)
	for(var/_design in all_designs)
		var/datum/design/design = _design
		if(design.id == id)
			return design

	error("Incorrect design ID or path: [id]")

/datum/controller/subsystem/research/proc/get_autolathe_design_by_build_path(build_path)
	for(var/datum/design/autolathe/design in all_designs)
		if("[design.build_path]" == build_path || design.build_path == build_path)
			return design

	error("Incorrect design ID or path: [build_path]")

/datum/controller/subsystem/research/proc/AddAutolatheCategory()
	for(var/datum/design/autolathe/D in SSresearch.all_designs)
		if(D.category in design_categories_autolathe)
			continue
		if(D.build_type)
			if(D.category)
				design_categories_autolathe |= D.category
