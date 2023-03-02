#define INTERDICTION_LENS_RANGE 3

/datum/clockcult/scripture/create_structure/interdiction
	name = "Interdiction Lens"
	desc = "Creates a device that will slow non servants in the area and damage mechanised exosuits. Requires power from a sigil of transmission."
	tip = "Construct interdiction lens to slow down a hostile assault."
	button_icon_state = "Interdiction Lens"
	power_cost = 500
	invokation_time = 80
	invokation_text = list("Oh great lord...", "...may your divinity block the outsiders.")
	summoned_structure = /obj/structure/destructible/clockwork/gear_base/interdiction_lens
	cogs_required = 4
	category = SPELLTYPE_STRUCTURES

/obj/structure/destructible/clockwork/gear_base/interdiction_lens
	name = "interdiction lens"
	desc = "A mesmerizing light that flashes to a rhythm that you just can't stop tapping to."
	clockwork_desc = "A small device which will slow down nearby attackers at a small power cost."
	default_icon_state = "interdiction_lens_inactive"
	anchored = TRUE
	break_message = "<span class='warning'>The interdiction lens breaks into multiple fragments, which gently float to the ground.</span>"
	max_integrity = 150
	minimum_power = 5
	var/enabled = FALSE			//Misnomer - Whether we want to be enabled or not, processing would be if we are enabled
	var/processing = FALSE
	var/datum/proximity_monitor/advanced/dampening_field
	var/obj/item/borg/projectile_dampen/clockcult/internal_dampener

/obj/structure/destructible/clockwork/gear_base/interdiction_lens/Initialize()
	internal_dampener = new
	. = ..()

/obj/structure/destructible/clockwork/gear_base/interdiction_lens/Destroy()
	if(enabled)
		STOP_PROCESSING(SSobj, src)
	QDEL_NULL(dampening_field)
	QDEL_NULL(internal_dampener)
	. = ..()

/obj/structure/destructible/clockwork/gear_base/interdiction_lens/attack_hand(mob/user)
	if(is_servant_of_ratvar(user))
		enabled = !enabled
		to_chat(user, "<span class='brass'>You toggle [src] [enabled?"on":"off"].</span>")
		if(enabled)
			if(update_power())
				repowered()
			else
				enabled = FALSE
				to_chat(user, "<span class='warning'>[src] does not have enough power!</span>")
		else
			depowered()
	else
		. = ..()

/obj/structure/destructible/clockwork/gear_base/interdiction_lens/process()
	if(!anchored)
		enabled = FALSE
		STOP_PROCESSING(SSobj, src)
		icon_state = "interdiction_lens_unwrenched"
		return
	if(prob(5))
		new /obj/effect/temp_visual/steam_release(get_turf(src))
	for(var/mob/living/L in range(INTERDICTION_LENS_RANGE, src))
		if(!is_servant_of_ratvar(L))
			if(use_power(5))
				L.apply_status_effect(STATUS_EFFECT_INTERDICTION)

/obj/structure/destructible/clockwork/gear_base/interdiction_lens/repowered()
	if(enabled)
		if(!processing)
			START_PROCESSING(SSobj, src)
			processing = TRUE
		icon_state = "interdiction_lens_active"
		flick("interdiction_lens_recharged", src)
		if(istype(dampening_field))
			QDEL_NULL(dampening_field)
		dampening_field =  new(src, field_radius, TRUE, src)
		RegisterSignal(dampening_field, COMSIG_DAMPENER_CAPTURE, PROC_REF(dampen_projectile))
		RegisterSignal(dampening_field, COMSIG_DAMPENER_RELEASE, PROC_REF(release_projectile))

/obj/item/borg/projectile_dampen/clockcult
	name = "internal clockcult projectile dampener"

/obj/item/borg/projectile_dampen/clockcult/process_recharge()
	energy = maxenergy
