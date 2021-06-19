/datum/martial_art/wrathful
	name = "Wrathful"
	deflection_chance = 75
	no_guns = TRUE
	no_guns_message = "Why use this when your fists are stronger?"
	has_explaination_verb = TRUE
	combos = list(/*/datum/martial_combo/wrathful/pummel, /datum/martial_combo/wrathful/barrage, /datum/martial_combo/wrathful/head_slam*/)

/datum/martial_art/wrathful/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	MARTIAL_ARTS_ACT_CHECK
	var/obj/item/grab/G = D.grabbedby(A,1)
	if(G)
		G.state = GRAB_AGGRESSIVE // insta-aggressive
	add_attack_logs(A, D, "Melee attacked with martial-art [src] : Grabbed", ATKLOG_ALL)
	return TRUE

/datum/martial_art/wrathful/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	MARTIAL_ARTS_ACT_CHECK
	A.do_attack_animation(D, ATTACK_EFFECT_SMASH)
	var/atk_verb = pick("punches", "kicks", "hits", "slams")
	D.visible_message("<span class='danger'>[A] [atk_verb] [D]!</span>", \
					  "<span class='userdanger'> [A] [atk_verb] you! </span>")
	D.apply_damage(rand(2, 5) + rand(A.dna.species.punchdamagelow, A.dna.species.punchdamagehigh), BRUTE)
	playsound(get_turf(D) , 'sound/weapons/punch1.ogg', 25, 1, -1)
	add_attack_logs(A, D, "Melee attacked with martial-art [src] : Punched", ATKLOG_ALL)
	return TRUE

