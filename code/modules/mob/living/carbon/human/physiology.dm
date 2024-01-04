//Stores several modifiers in a way that isn't cleared by changing species
/datum/physiology
<<<<<<< HEAD
	var/brute_mod = 1 // % of brute damage taken from all sources
	var/burn_mod = 1 // % of burn damage taken from all sources
	var/tox_mod = 1 // % of toxin damage taken from all sources
	var/oxy_mod = 1 // % of oxygen damage taken from all sources
	var/clone_mod = 1 // % of clone damage taken from all sources
	var/stamina_mod = 1 // % of stamina damage taken from all sources
	var/brain_mod = 1 // % of brain damage taken from all sources
=======
	/// Multiplier to brute damage received.
	/// IE: A brute mod of 0.9 = 10% less brute damage.
	/// Only applies to damage dealt via [apply_damage][/mob/living/proc/apply_damage] unless factored in manually.
	var/brute_mod = 1
	/// Multiplier to burn damage received
	var/burn_mod = 1
	/// Multiplier to toxin damage received
	var/tox_mod = 1
	/// Multiplier to oxygen damage received
	var/oxy_mod = 1
	/// Multiplier to stamina damage received
	var/stamina_mod = 1
	/// Multiplier to brain damage received
	var/brain_mod = 1
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2

	var/pressure_mod = 1 // % of brute damage taken from low or high pressure (stacks with brute_mod)
	var/heat_mod = 1 // % of burn damage taken from heat (stacks with burn_mod)
	var/cold_mod = 1 // % of burn damage taken from cold (stacks with burn_mod)

	var/damage_resistance = 0 // %damage reduction from all sources

	var/siemens_coeff = 1 // resistance to shocks

	/// Multiplier applied to all incapacitating stuns (knockdown, stun, paralyze, immobilize)
	var/stun_mod = 1
	/// Multiplied aplpied to just knockdowns, stacks with above multiplicatively
	var/knockdown_mod = 1

	var/bleed_mod = 1 // % bleeding modifier
	var/datum/armor/armor // internal armor datum

	var/hunger_mod = 1 //% of hunger rate taken per tick.

/datum/physiology/New()
	armor = new
