#define JOB_MODIFICATION_MAP_NAME "Box Station"

/datum/job/assistant/New()
	..()
	MAP_JOB_CHECK
	access += list()
	skillsets = list("Security Officer" = /datum/skillset/officer)

/datum/job/hos/New()
	..()
	MAP_JOB_CHECK
	total_positions = 2
	spawn_positions = 2
	minimal_player_ingame_minutes = 0
	access += list()
	skillsets = list("Head of Security" = /datum/skillset/hos)

/datum/job/warden/New()
	..()
	MAP_JOB_CHECK
	total_positions = 4
	spawn_positions = 4
	minimal_player_ingame_minutes = 0
	access += list()
	skillsets = list("Warden" = /datum/skillset/warden)

/datum/job/officer/New()
	..()
	MAP_JOB_CHECK
	total_positions = 3
	spawn_positions = 3
	access += list()
	skillsets = list("Security Officer" = /datum/skillset/officer)

/datum/job/cadet/New()
	..()
	MAP_JOB_CHECK
	total_positions = 6
	spawn_positions = 6
	access += list()
	skillsets = list("Security Officer" = /datum/skillset/officer)

/datum/job/detective/New()
	..()
	MAP_JOB_CHECK
	total_positions = 3
	spawn_positions = 3
	access += list()
	skillsets = list("Security Officer" = /datum/skillset/officer)

/datum/job/forensic/New()
	..()
	MAP_JOB_CHECK
	total_positions = 2
	spawn_positions = 2
	access += list()
	skillsets = list("Security Officer" = /datum/skillset/officer)


MAP_REMOVE_JOB(clown)

MAP_REMOVE_JOB(bartender)

MAP_REMOVE_JOB(captain)

MAP_REMOVE_JOB(cyborg)

MAP_REMOVE_JOB(ai)

MAP_REMOVE_JOB(rd)

MAP_REMOVE_JOB(scientist)

MAP_REMOVE_JOB(research_assistant)

MAP_REMOVE_JOB(chief_engineer)

MAP_REMOVE_JOB(mining)

MAP_REMOVE_JOB(qm)

MAP_REMOVE_JOB(chaplain)

MAP_REMOVE_JOB(chef)

MAP_REMOVE_JOB(intern)

MAP_REMOVE_JOB(technical_assistant)

MAP_REMOVE_JOB(engineer)

MAP_REMOVE_JOB(hop)

MAP_REMOVE_JOB(recycler)

MAP_REMOVE_JOB(barber)

MAP_REMOVE_JOB(cargo_tech)

MAP_REMOVE_JOB(hydro)

MAP_REMOVE_JOB(janitor)

MAP_REMOVE_JOB(librarian)

MAP_REMOVE_JOB(lawyer)

MAP_REMOVE_JOB(mime)

MAP_REMOVE_JOB(paramedic)

MAP_REMOVE_JOB(chemist)

MAP_REMOVE_JOB(geneticist)

MAP_REMOVE_JOB(virologist)

MAP_REMOVE_JOB(psychiatrist)

MAP_REMOVE_JOB(xenoarchaeologist)

MAP_REMOVE_JOB(xenobiologist)

MAP_REMOVE_JOB(roboticist)

MAP_REMOVE_JOB(atmos)

MAP_REMOVE_JOB(blueshield)

#undef JOB_MODIFICATION_MAP_NAME
