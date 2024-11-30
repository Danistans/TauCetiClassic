/datum/job/hos
	title = "Полковник"
	flag = HOS
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the captain"
	selection_color = "#ffdddd"
	idtype = /obj/item/weapon/card/id/key/officer
	req_admin_notify = 1
	is_head = TRUE
	access = list(
		access_security, access_sec_doors, access_brig, access_armory,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_research, access_mining, access_medical, access_construction,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_detective
	)
	salary = 250
	minimal_player_age = 14
	minimal_player_ingame_minutes = 2400
	outfit = /datum/outfit/job/hos
	skillsets = list("Head of Security" = /datum/skillset/hos)
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND SAVEFILE_VERSION_SPECIES_JOBS
		~Luduk
	*/
	restricted_species = list(SKRELL, UNATHI, TAJARAN, DIONA, VOX, IPC , PLUVIAN)
	flags = JOB_FLAG_SECURITY|JOB_FLAG_COMMAND|JOB_FLAG_HEAD_OF_STAFF|JOB_FLAG_BLUESHIELD_PROTEC

/datum/job/warden
	title = "Поручик"
	flag = WARDEN
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/key/officer
	access = list(access_security, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_hos)
	salary = 190
	minimal_player_age = 5
	minimal_player_ingame_minutes = 1800
	outfit = /datum/outfit/job/warden
	skillsets = list("Warden" = /datum/skillset/warden)
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND SAVEFILE_VERSION_SPECIES_JOBS
		~Luduk
	*/
	restricted_species = list(TAJARAN, DIONA, VOX, IPC, PLUVIAN)
	flags = JOB_FLAG_SECURITY

/datum/job/detective
	title = "Унтер-офицер"
	flag = DETECTIVE
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/key/officer
	access = list(access_security, access_sec_doors, access_detective, access_maint_tunnels, access_hos)
	salary = 180
	minimal_player_age = 3
	minimal_player_ingame_minutes = 1560
	outfit = /datum/outfit/job/detective
	skillsets = list("Detective" = /datum/skillset/detective)
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND SAVEFILE_VERSION_SPECIES_JOBS
		~Luduk
	*/
	restricted_species = list(DIONA, IPC, PLUVIAN)
	flags = JOB_FLAG_SECURITY

/datum/job/officer
	title = "Офицер охранки"
	flag = OFFICER
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the head of security and warden"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/key/officer
	access = list(access_security, access_sec_doors, access_brig, access_maint_tunnels)
	salary = 130
	minimal_player_age = 3
	minimal_player_ingame_minutes = 1560
	outfit = /datum/outfit/job/officer
	skillsets = list("Security Officer" = /datum/skillset/officer)
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND SAVEFILE_VERSION_SPECIES_JOBS
		~Luduk
	*/
	restricted_species = list(DIONA, TAJARAN, VOX, IPC, PLUVIAN)
	flags = JOB_FLAG_SECURITY

/datum/job/forensic
	title = "Фельдфебель"
	flag = FORENSIC
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/key/officer
	access = list(access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_hos)
	salary = 150
	minimal_player_age = 3
	minimal_player_ingame_minutes = 1560
	outfit = /datum/outfit/job/forensic
	skillsets = list("Forensic Technician" = /datum/skillset/forensic)
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND SAVEFILE_VERSION_SPECIES_JOBS
		~Luduk
	*/
	restricted_species = list(UNATHI, DIONA, PLUVIAN)
	flags = JOB_FLAG_SECURITY

/datum/job/cadet
	title = "Ефрейтор"
	flag = CADET
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/key/soldier
	access = list(access_sec_doors, access_maint_tunnels)
	salary = 50
	minimal_player_age = 2
	minimal_player_ingame_minutes = 520
	outfit = /datum/outfit/job/cadet
	skillsets = list("Security Cadet" = /datum/skillset/cadet)
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND SAVEFILE_VERSION_SPECIES_JOBS
		~Luduk
	*/
	restricted_species = list(DIONA, TAJARAN, VOX, IPC, PLUVIAN)
	flags = JOB_FLAG_SECURITY
