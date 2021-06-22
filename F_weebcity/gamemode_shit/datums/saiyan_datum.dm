/datum/antagonist/saiyan
	name = "Saiyans"
	roundend_category = "saiyans"
	job_rank = ROLE_TRAITOR
	special_role = SPECIAL_ROLE_TRAITOR
	give_objectives = TRUE
	antag_hud_name = "hudsyndicate"
	antag_hud_type = ANTAG_HUD_TRAITOR
	clown_gain_text = "You are a saiyan clown."
	clown_removal_text = "You are now a regular clown, dumb bitch"

/*
    Called when someone receives the datum
*/
/datum/antagonist/saiyan/on_gain()
	var/mob/living/carbon/human/H = owner.current
	var/list/spawn_locs = list()

	//Move them over to the ship
	for(var/obj/effect/landmark/A in GLOB.landmarks_list) //We don't know how many we getting so just grab a turf list and pick one.
		if(A.name == "Syndicate-Spawn")
			spawn_locs += get_turf(A)

	var/turf/T = pick(spawn_locs)
	H.loc = T.loc

	if(give_objectives)
		forge_human_objectives()
	
	H.mind.offstation_role = TRUE
	H.set_species(/datum/species/human/saiyan) //We set them to saiyan


	. = ..()

/datum/antagonist/saiyan/on_removal()

	return ..()

/datum/antagonist/saiyan/add_antag_hud(mob/living/antag_mob)
	antag_hud_name = "hudsyndicate"
	return ..()

/**
 * heres where objectives would go
 */
/datum/antagonist/saiyan/proc/forge_human_objectives()
	return

/**
 * Create and assign a single randomized human traitor objective.
 *
 * Returns TRUE if an objective was added, and FALSE if it failed due to it being a duplicate.
 */
/datum/antagonist/saiyan/proc/forge_single_human_objective()
	return FALSE

/**
 * Give human traitors their uplink, and AI traitors their law 0. Play the traitor an alert sound.
 */
/datum/antagonist/saiyan/proc/finalize_traitor()
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/tatoralert.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)
	to_chat(owner.current, "<span class='motd'>For more information, suck my dick</span>")

 //doesn't appear to be tied to anything right now
/datum/antagonist/saiyan/roundend_report_footer()
	return