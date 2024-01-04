/**
 * Reproduce with a similar mob.
 */
/datum/ai_planning_subtree/make_babies
<<<<<<< HEAD
	var/chance = 5
=======
	operational_datums = list(/datum/component/breed)
	///chance to make babies
	var/chance = 5
	///make babies behavior we will use
	var/datum/ai_behavior/reproduce_behavior = /datum/ai_behavior/make_babies
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2

/datum/ai_planning_subtree/make_babies/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()

<<<<<<< HEAD
	if(controller.pawn.gender != FEMALE || !SPT_PROB(chance, seconds_per_tick))
=======
	if(!SPT_PROB(chance, seconds_per_tick))
		return

	if(controller.blackboard_key_exists(BB_BABIES_TARGET))
		controller.queue_behavior(reproduce_behavior, BB_BABIES_TARGET, BB_BABIES_CHILD_TYPES)
		return SUBTREE_RETURN_FINISH_PLANNING

	if(controller.pawn.gender == FEMALE || !controller.blackboard[BB_BREED_READY])
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2
		return

	var/partner_types = controller.blackboard[BB_BABIES_PARTNER_TYPES]
	var/baby_types = controller.blackboard[BB_BABIES_CHILD_TYPES]

	if(!partner_types || !baby_types)
		return

	// Baby can't reproduce
	if(is_type_in_list(controller.pawn, baby_types))
		return

	// Find target
	if(controller.blackboard_key_exists(BB_BABIES_TARGET))
		controller.queue_behavior(/datum/ai_behavior/make_babies, BB_BABIES_TARGET, BB_BABIES_CHILD_TYPES)
		return SUBTREE_RETURN_FINISH_PLANNING
	controller.queue_behavior(/datum/ai_behavior/find_partner, BB_BABIES_TARGET, BB_BABIES_PARTNER_TYPES, BB_BABIES_CHILD_TYPES)
