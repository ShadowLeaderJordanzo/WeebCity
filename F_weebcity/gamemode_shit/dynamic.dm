/* Right now its going to be simple but as we go on more will be appended to it as there is only one antag type right now
*/

/datum/game_mode/dynamic
	name = "dynamic"
	config_tag = "dynamic"
	restricted_jobs = list("Cyborg","AI")// Cybernetic beings don't convert species v well do they.
	protected_jobs = list()
	required_players = 0
	required_enemies = 1
	recommended_enemies = 1
	// List of shit to append datums to after pre-round selection, well catch and process people latejoining without a list via conditionals
	var/list/datum/mind/picked_minds = list()

/datum/game_mode/dynamic/announce()
	to_chat(world, "<B>The current game mode is - Dynamic!</B>")
	to_chat(world, "<B>Things will happen and you'll deal with it!</B>")

/*
	I don't feel like setting up pref selection atm, so lets just take peoples asses without consent or warning barring they are in a restricted job
	This is the proc that occurs at roundstart for antag drafts
*/
/datum/game_mode/dynamic/proc/grab_players_unconsentually()
	var/list/players = list()
	var/list/candidates = list()
	
	for(var/mob/new_player/player in GLOB.player_list)
		if(player.client && player.ready)
			players += player

	players = shuffle(players)
	
	//If they have skip on we will respect that, pass over them, and add the people who don'ts mind to the initial list of canidates
	for(var/mob/new_player/player in players)
		if(!player.client.skip_antag)
			candidates += player.mind
			players -= player
	
	// Remove candidates who want to be antagonist but have a job that precludes it
	if(restricted_jobs)
		for(var/datum/mind/player in candidates)
			for(var/job in restricted_jobs)
				if(player.assigned_role == job)
					candidates -= player

	return candidates //we basically returning a list of minds to pick from wherev
/*
	This is a ticker loop, so we can handle recalculations/etc here on the integer used to better control this game_mode's handling of element introduction
*/
/datum/game_mode/dynamic/process()
	return 0

/datum/game_mode/dynamic/pre_setup()

	if(config.protect_roles_from_antagonist)
		restricted_jobs += protected_jobs

	var/list/possible_antags = grab_players_unconsentually() //Here is where that list goes

	// stop setup if no possible picks
	if(!possible_antags.len)
		return FALSE

	var/num_antags = 1 //When someone figures out a proper formula for this we recalculate this for the starters

	for(var/i in 1 to num_antags)
		if(!possible_antags.len)
			break
		var/datum/mind/antags = pick_n_take(possible_antags)
		picked_minds += antags
		antags.special_role = SPECIAL_ROLE_TRAITOR
		antags.restricted_roles = restricted_jobs

	if(!length(picked_minds)) //Failure(?)
		return FALSE
	return TRUE

/* 
	We are post setup I guess, append the appropriate datums to whoever
*/
/datum/game_mode/dynamic/post_setup()
	for(var/player_mind in picked_minds)
		var/datum/mind/antags = player_mind
		antags.add_antag_datum(/datum/antagonist/saiyan) //we add saiyans
	..()

/*
	Heres where we handle people joining in late relevant to the game mode conditions, its called in new_player.dm via SSticker.mode ref
*/
/datum/game_mode/dynamic/latespawn(mob/M)
	return


/datum/game_mode/dynamic/declare_completion()
	..()
	return