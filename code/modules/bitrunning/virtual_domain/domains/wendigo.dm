/datum/lazy_template/virtual_domain/wendigo
	name = "Glacial Devourer"
	cost = BITRUNNER_COST_HIGH
	desc = "Legends speak of the ravenous Wendigo hidden deep within the caves of Icemoon."
	difficulty = BITRUNNER_DIFFICULTY_HIGH
	forced_outfit = /datum/outfit/job/miner
	key = "wendigo"
	map_name = "wendigo"
	reward_points = BITRUNNER_REWARD_HIGH

<<<<<<< HEAD
/mob/living/simple_animal/hostile/megafauna/wendigo/virtual_domain
	can_be_cybercop = FALSE
	crusher_loot = list(/obj/structure/closet/crate/secure/bitrunning/encrypted)
	guaranteed_butcher_results = list(/obj/item/wendigo_skull = 1)
	health = 2000
	loot = list(/obj/structure/closet/crate/secure/bitrunning/encrypted)
	maxHealth = 2000
	true_spawn = FALSE
=======
/obj/effect/mob_spawn/corpse/human/bitrunner/special(mob/living/spawned_mob)
	. = ..()
	spawned_mob.apply_status_effect(/datum/status_effect/gutted)

/obj/effect/mob_spawn/corpse/human/cyber_police/special(mob/living/spawned_mob)
	. = ..()
	spawned_mob.apply_status_effect(/datum/status_effect/gutted)
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2
