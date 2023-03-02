GLOBAL_LIST_EMPTY(servants_of_ratvar)	//List of minds in the cult
GLOBAL_LIST_EMPTY(all_servants_of_ratvar)	//List of minds in the cult
GLOBAL_LIST_EMPTY(human_servants_of_ratvar)	//Humans in the cult
GLOBAL_LIST_EMPTY(cyborg_servants_of_ratvar)

GLOBAL_VAR(ratvar_arrival_tick)	//The world.time that Ratvar will arrive if the gateway is not disrupted

GLOBAL_VAR_INIT(installed_integration_cogs, 0)

GLOBAL_VAR(celestial_gateway)	//The celestial gateway
GLOBAL_VAR_INIT(ratvar_risen, FALSE)	//Has ratvar risen?
GLOBAL_VAR_INIT(gateway_opening, FALSE)	//Is the gateway currently active?

//A useful list containing all scriptures with the index of the name.
//This should only be used for looking up scriptures
GLOBAL_LIST_EMPTY(clockcult_all_scriptures)

GLOBAL_VAR_INIT(clockcult_power, 2500)
GLOBAL_VAR_INIT(clockcult_vitality, 200)

GLOBAL_VAR(clockcult_eminence)

//==========================
//==== Clock cult procs ====
//==========================

#define is_servant_of_ratvar(mob) (mob?.mind?.has_antag_datum(/datum/antagonist/servant_of_ratvar))

//Similar to cultist one, except silicons are allowed
/proc/is_convertable_to_clockcult(mob/living/M)
	if(!istype(M))
		return FALSE
	if(!M.mind)
		return FALSE
	if(is_servant_of_ratvar(M))
		return FALSE
	if(M.mind.enslaved_to && !is_servant_of_ratvar(M.mind.enslaved_to))
		return FALSE
	if(M.mind.unconvertable)
		return FALSE
	if(HAS_TRAIT(M, TRAIT_MINDSHIELD))
		return FALSE
	return TRUE

/proc/generate_clockcult_scriptures()
	//Generate scriptures
	for(var/categorypath in subtypesof(/datum/clockcult/scripture))
		var/datum/clockcult/scripture/S = new categorypath
		GLOB.clockcult_all_scriptures[S.name] = S

/proc/flee_reebe()
	for(var/mob/living/M in GLOB.mob_list)
		if(!is_reebe(M.z))
			continue
		var/safe_place = find_safe_turf()
		M.forceMove(safe_place)
		if(!is_servant_of_ratvar(M))
			M.SetSleeping(50)

//Transmits a message to everyone in the cult
//Doesn't work if the cultists contain holy water, or are not on the station or Reebe
/proc/hierophant_message(msg, mob/living/sender, span = "<span class='brass'>", use_sanitisation=TRUE, say=TRUE)
	var/hierophant_message = "[span]"
	if(sender?.reagents)
		if(sender.reagents.has_reagent(/datum/reagent/water/holywater, 1))
			to_chat(sender, "<span class='nezbere'>[pick("You fail to transmit your cries for help.", "Your calls into the void go unanswered.", "You try to transmit your message, but the hierophant network is silent.")]</span>")
			return FALSE
	if(!msg)
		if(sender)
			to_chat(sender, "<span class='brass'>You cannot transmit nothing!</span>")
		return FALSE
	if(use_sanitisation)
		msg = sanitize(msg)
	if(sender)
		if(say)
			sender.say("#[text2ratvar(msg)]")
		var/datum/antagonist/servant_of_ratvar/SoR = is_servant_of_ratvar(sender)
		var/prefix = "Cogturner"
		switch(SoR.prefix)
			if(CLOCKCULT_PREFIX_EMINENCE)
				prefix = "Master"
			if(CLOCKCULT_PREFIX_MASTER)
				prefix = sender.gender == MALE\
					? "Clockfather"\
					: sender.gender == FEMALE\
						? "Clockmother"\
						: "Clockmaster"
				hierophant_message = "<span class='leader_brass'>"
			if(CLOCKCULT_PREFIX_RECRUIT)
				var/role = sender.mind?.assigned_role
				//Ew, this could be done better with a dictionary list, but this isn't much slower
				if(role in JOB_ASSISTANT)
					prefix = "Helper"
				else if(role in JOB_MIME)
					prefix = "Cogwatcher"
				else if(role in JOB_CLOWN)
					prefix = "Clonker"
			//Fallthrough is default of "Clockbrother"
		hierophant_message += "<b>[prefix] [sender.name]</b> transmits, \"[msg]\""
	else
		hierophant_message += msg
	if(span)
		hierophant_message += "</span>"
	for(var/datum/mind/mind in GLOB.all_servants_of_ratvar)
		send_hierophant_message_to(mind, hierophant_message)
	for(var/mob/dead/observer/O in GLOB.dead_mob_list)
		if(istype(sender))
			to_chat(O, "[FOLLOW_LINK(O, sender)] [hierophant_message]")
		else
			to_chat(O, hierophant_message)

/proc/send_hierophant_message_to(datum/mind/mind, hierophant_message)
	var/mob/M = mind.current
	if(!isliving(M) || QDELETED(M))
		return
	if(M.reagents)
		if(M.reagents.has_reagent(/datum/reagent/water/holywater, 1))
			if(pick(20))
				to_chat(M, "<span class='nezbere'>You hear the cogs whispering to you, but cannot understand their words.</span>")
			return
	to_chat(M, hierophant_message)
