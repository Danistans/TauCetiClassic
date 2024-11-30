/datum/job/assistant
	title = "Рядовой"
	flag = ASSISTANT
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	salary = 0
	idtype = /obj/item/weapon/card/id/key/soldier
	outfit = /datum/outfit/job/assistant
	skillsets = list("Security Officer" = /datum/skillset/officer)
	flags = JOB_FLAG_SECURITY

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
