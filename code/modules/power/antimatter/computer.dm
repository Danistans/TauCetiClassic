#define STATE_DEFAULT 1
#define STATE_INJECTOR  2
#define STATE_ENGINE 3


/obj/machinery/computer/am_engine
	name = "Antimatter Engine Console"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "comm_computer"
	req_access = list(ACCESS_ENGINE)
	var/engine_id = 0
	var/authenticated = 0
	var/obj/machinery/power/am_engine/engine/connected_E = null
	var/obj/machinery/power/am_engine/injector/connected_I = null
	var/state = STATE_DEFAULT
	required_skills = list(/datum/skill/engineering = SKILL_LEVEL_PRO)

/obj/machinery/computer/am_engine/atom_init()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/computer/am_engine/atom_init_late()
	for(var/obj/machinery/power/am_engine/engine/E in machines)
		if(E.engine_id == engine_id)
			connected_E = E
	for(var/obj/machinery/power/am_engine/injector/I in machines)
		if(I.engine_id == engine_id)
			connected_I = I

/obj/machinery/computer/am_engine/Topic(href, href_list)
	. = ..()
	if(!.)
		return

	if(!href_list["operation"])
		return FALSE
	switch(href_list["operation"])
		// main interface
		if("activate")
			connected_E.engine_process()
		if("engine")
			src.state = STATE_ENGINE
		if("injector")
			src.state = STATE_INJECTOR
		if("main")
			src.state = STATE_DEFAULT
		if("login")
			var/mob/M = usr
			var/obj/item/weapon/card/id/I = M.get_active_hand()
			if (I && istype(I))
				if(check_access(I))
					authenticated = 1
		if("deactivate")
			src.connected_E.stopping = 1
		if("logout")
			authenticated = 0

	updateUsrDialog()

/obj/machinery/computer/am_engine/ui_interact(mob/user)
	var/dat = ""
	switch(src.state)
		if(STATE_DEFAULT)
			if (src.authenticated)
				dat += "<BR><A href='byond://?src=\ref[src];operation=logout'>Log Out</A><br>"
				dat += "<BR><A href='byond://?src=\ref[src];operation=engine'>Engine Menu</A>"
				dat += "<BR><A href='byond://?src=\ref[src];operation=injector'>Injector Menu</A>"
			else
				dat += "<BR><A href='byond://?src=\ref[src];operation=login'>Log In</A>"
		if(STATE_INJECTOR)
			if(src.connected_I.injecting)
				dat += "<BR>Injecting<br>"
			else
				dat += "<BR>Injecting not in progress<br>"
		if(STATE_ENGINE)
			if(src.connected_E.stopping)
				dat += "<BR>STOPPING"
			else if(src.connected_E.operating && !src.connected_E.stopping)
				dat += "<BR><A href='byond://?src=\ref[src];operation=deactivate'>Emergency Stop</A>"
			else
				dat += "<BR><A href='byond://?src=\ref[src];operation=activate'>Activate Engine</A>"
			dat += "<BR>Contents:<br>[src.connected_E.H_fuel]kg of Hydrogen<br>[src.connected_E.antiH_fuel]kg of Anti-Hydrogen<br>"

	dat += "<BR>[(src.state != STATE_DEFAULT) ? "<A href='byond://?src=\ref[src];operation=main'>Main Menu</A> | " : ""]"

	var/datum/browser/popup = new(user, "communications", "Engine Computer", 400, 500)
	popup.set_content(dat)
	popup.open()
