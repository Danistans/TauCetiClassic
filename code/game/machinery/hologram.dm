/* Holograms!
 * Contains:
 *		Holopad
 *		Hologram
 *		Other stuff
 */

/*
Revised. Original based on space ninja hologram code. Which is also mine. /N
How it works:
AI clicks on holopad in camera view. View centers on holopad.
AI clicks again on the holopad to display a hologram. Hologram stays as long as AI is looking at the pad and it (the hologram) is in range of the pad.
AI can use the directional keys to move the hologram around, provided the above conditions are met and the AI in question is the holopad's master.
Only one AI may project from a holopad at any given time.
AI may cancel the hologram at any time by clicking on the holopad once more.

Possible to do for anyone motivated enough:
	Give an AI variable for different hologram icons.
	Itegrate EMP effect to disable the unit.
*/


/*
 * Holopad
 */

// HOLOPAD MODE
// 0 = RANGE BASED
// 1 = AREA BASED
var/global/const/HOLOPAD_MODE = 0

/obj/machinery/hologram/holopad
	name = "AI holopad"
	desc = "It's a floor-mounted device for projecting holographic images. It is activated remotely."
	icon_state = "holopad0"

	plane = FLOOR_PLANE

	flags = HEAR_TALK

	var/mob/living/silicon/ai/master//Which AI, if any, is controlling the object? Only one AI may control a hologram at any time.
	var/last_request = 0 //to prevent request spam. ~Carn
	var/holo_range = 5 // Change to change how far the AI can move away from the holopad before deactivating.

/obj/machinery/hologram/holopad/atom_init()
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/weapon/circuitboard/holopad(null)
	component_parts += new /obj/item/weapon/stock_parts/capacitor(null)
	RefreshParts()

/obj/machinery/hologram/holopad/RefreshParts()
	..()

	var/holograph_range = 4
	for(var/obj/item/weapon/stock_parts/capacitor/B in component_parts)
		holograph_range += 1 * B.rating
	holo_range = holograph_range

/obj/machinery/hologram/holopad/attackby(obj/item/P, mob/user, params)
	if(default_deconstruction_screwdriver(user, "holopad_open", "holopad0", P))
		return

	if(exchange_parts(user, P))
		return

	if(default_pry_open(P))
		return

	if(default_unfasten_wrench(user, P))
		return

	default_deconstruction_crowbar(P)


/obj/machinery/hologram/holopad/attack_hand(mob/user) //Carn: Hologram requests.
	if(..())
		return 1
	if(!ishuman(user) && !IsAdminGhost(user))
		return 1
	user.SetNextMove(CLICK_CD_INTERACT)
	if(tgui_alert(user, "Would you like to request an AI's presence?",, list("Yes","No")) == "Yes")
		if(last_request + 200 < world.time) //don't spam the AI with requests you jerk!
			last_request = world.time
			to_chat(user, "<span class='notice'>You request an AI's presence.</span>")
			var/area/area = get_area(src)
			for(var/mob/living/silicon/ai/AI as anything in ai_list)
				if(!AI.client || AI.stat == DEAD)
					continue
				to_chat(AI, "<span class='info'>Your presence is requested at <a href='byond://?src=\ref[AI];jumptoholopad=\ref[src]'>\the [area]</a>.</span>")
		else
			to_chat(user, "<span class='notice'>A request for AI presence was already sent recently.</span>")

/obj/machinery/hologram/holopad/attack_ai(mob/living/silicon/ai/user)
	if (!istype(user))
		return ..()
	/*There are pretty much only three ways to interact here.
	I don't need to check for client since they're clicking on an object.
	This may change in the future but for now will suffice.*/
	if(user.eyeobj.loc != src.loc)//Set client eye on the object if it's not already.
		user.eyeobj.setLoc(get_turf(src))
	else if(!hologram)//If there is no hologram, possibly make one.
		activate_holo(user)
	else if(master==user)//If there is a hologram, remove it. But only if the user is the master. Otherwise do nothing.
		clear_holo()
	return

/obj/machinery/hologram/holopad/proc/activate_holo(mob/living/silicon/ai/user)
	if(!(stat & NOPOWER) && user.eyeobj.loc == src.loc)//If the projector has power and client eye is on it.
		if(!hologram)//If there is not already a hologram.
			create_holo(user)//Create one.
			playsound(src, 'sound/machines/holopadon.ogg', VOL_EFFECTS_MASTER, null, FALSE)

			if(user.holohack)
				change_holo_to_carp(user)

			visible_message("A holographic image of [hologram.name] flicks to life right before your eyes!")
		else
			to_chat(user, "<span class='warning'>ERROR:</span> Image feed in progress.")
	else
		to_chat(user, "<span class='warning'>ERROR:</span> Unable to project hologram.")
	return

/*This is the proc for special two-way communication between AI and holopad/people talking near holopad.
For the other part of the code, check silicon say.dm. Particularly robot talk.*/
/obj/machinery/hologram/holopad/hear_talk(mob/living/M, text, verb, datum/language/speaking)
	if(M&&hologram&&master)//Master is mostly a safety in case lag hits or something.
		if(!master.say_understands(M, speaking))//The AI will be able to understand most mobs talking through the holopad.
			if(speaking)
				text = speaking.scramble(text)
			else
				text = stars(text)
		var/name_used = M.GetVoice()
		//This communication is imperfect because the holopad "filters" voices and is only designed to connect to the master only.
		var/rendered
		if(speaking)
			rendered = "<i><span class='game say'>Holopad received, <span class='name'>[name_used]</span> [speaking.format_message(text, verb)]</span></i>"
		else
			rendered = "<i><span class='game say'>Holopad received, <span class='name'>[name_used]</span> [verb], <span class='message'>\"[text]\"</span></span></i>"
		to_chat(master, rendered)
	return

/obj/machinery/hologram/holopad/proc/create_holo(mob/living/silicon/ai/A, turf/T = loc)
	hologram = new(T)//Spawn a blank effect at the location.
	hologram.icon = A.holo_icon
	hologram.mouse_opacity = MOUSE_OPACITY_TRANSPARENT//So you can't click on it.
	hologram.layer = FLY_LAYER//Above all the other objects/mobs. Or the vast majority of them.
	hologram.anchored = TRUE//So space wind cannot drag it.
	hologram.name = "[A.name]"//If someone decides to right click.
	hologram.desc = "Hologram of [A.name]"
	hologram.set_light(2)	//hologram lighting
	set_light(2)			//pad lighting
	icon_state = "holopad1"
	A.holo = src
	master = A//AI is the master.
	use_power = ACTIVE_POWER_USE//Active power usage.

/obj/machinery/hologram/holopad/proc/change_holo_to_carp(mob/living/silicon/ai/A)
	hologram.icon = getHologramIcon(icon('icons/mob/AI.dmi',"holo4"))
	hologram.name = "space carp"
	hologram.desc = "Hologram of cute space carp... Wait, WHAT?"

/obj/machinery/hologram/holopad/clear_holo()
//	hologram.set_light(0)//Clear lighting.	//handled by the lighting controller when its ower is deleted
	qdel(hologram)//Get rid of hologram.
	hologram = null
	if(master.holo == src)
		master.holo = null
	master = null//Null the master, since no-one is using it now.
	set_light(0)			//pad lighting (hologram lighting will be handled automatically since its owner was deleted)
	icon_state = "holopad0"
	use_power = IDLE_POWER_USE//Passive power usage.
	return 1

/obj/machinery/hologram/holopad/process()
	if(hologram)//If there is a hologram.
		if(master && !master.stat && master.client && master.eyeobj)//If there is an AI attached, it's not incapacitated, it has a client, and the client eye is centered on the projector.
			if(!(stat & NOPOWER))//If the  machine has power.
				if(HOLOPAD_MODE == 0 && (get_dist(master.eyeobj, src) <= holo_range))
					return 1

				else if (HOLOPAD_MODE == 1)
					var/area/holo_area = get_area(src)
					var/area/eye_area = get_area(master.eyeobj)
					if(eye_area == holo_area)
						return 1

		clear_holo()//If not, we want to get rid of the hologram.
	return 1

/obj/machinery/hologram/holopad/proc/move_hologram()
	if(hologram)
		step_to(hologram, master.eyeobj) // So it turns.
		hologram.loc = get_turf(master.eyeobj)

	return 1

/*
 * Hologram
 */

/obj/machinery/hologram
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 5
	active_power_usage = 100
	var/obj/effect/overlay/hologram//The projection itself. If there is one, the instrument is on, off otherwise.

/obj/machinery/hologram/proc/clear_holo()
	return

/obj/machinery/hologram/atom_break()
	. = ..()
	if(hologram)
		clear_holo()

/obj/machinery/hologram/Destroy()
	if(hologram)
		clear_holo()
	return ..()
/*
Holographic project of everything else.

/mob/verb/hologram_test()
	set name = "Hologram Debug New"
	set category = "CURRENT DEBUG"

	var/obj/effect/overlay/hologram = new(loc)//Spawn a blank effect at the location.
	var/icon/flat_icon = icon(getFlatIcon(src,0))//Need to make sure it's a new icon so the old one is not reused.
	flat_icon.ColorTone(rgb(125,180,225))//Let's make it bluish.
	flat_icon.ChangeOpacity(0.5)//Make it half transparent.
	var/input = input("Select what icon state to use in effect.",,"")
	if(input)
		var/icon/alpha_mask = new('icons/effects/effects.dmi', "[input]")
		flat_icon.AddAlphaMask(alpha_mask)//Finally, let's mix in a distortion effect.
		hologram.icon = flat_icon

		to_chat(world, "Your icon should appear now.")
	return
*/

/*
 * Other Stuff: Is this even used?
 */
/obj/machinery/hologram/projector
	name = "hologram projector"
	desc = "It makes a hologram appear...with magnets or something..."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "hologram0"
