// Saiyans ahve powers, but it is just go, go fast and a regen when they get low. also the ki blast and beams, which may be a bit harder



/datum/saiyan
	var/mob/living/owner = null
	var/gender = MALE
	var/list/powers = list(/obj/effect/proc_holder/spell/saiyan/self/zenkai, /obj/effect/proc_holder/spell/saiyan/self/breakout)

/mob/proc/make_saiyan()
	if(!mind)
		return
	var/datum/saiyan/s
	if(!mind.saiyan)
		s = new /datum/saiyan()
		s.owner = src
		mind.saiyan = s
		mind.AddSpell(s.powers[1])
		mind.AddSpell(s.powers[2])
	else
		s = mind.saiyan
		//remove saiyaan shit, this prolly aint needed but just in case
/obj/effect/proc_holder/spell/saiyan
	panel = "Saiyan"
	school = "Saiyan"
	clothes_req = 0
	range = 1
	charge_max = 1800
	action_background_icon_state = "bg_vampire"
	var/gain_desc = null
/obj/effect/proc_holder/spell/saiyan/New()
	..()
	if(!gain_desc)
		gain_desc = "You have gained \the [src] ability."

/obj/effect/proc_holder/spell/saiyan/can_cast(mob/user, charge_check, show_message)
	if(!user.mind)
		return 0
	if(!ishuman(user))
		return 0
	if(user.stat >= DEAD)
		return 0
	return ..()

/obj/effect/proc_holder/spell/saiyan/self/choose_targets(mob/user = usr)
	perform(list(user))

/obj/effect/proc_holder/spell/saiyan/self/zenkai
	name = "Zenkai"
	desc= "Undying Will"
	action_icon_state = "vampire_rejuvinate"
	charge_type = "charges"
	charge_max = 1
	stat_allowed = 1

/obj/effect/proc_holder/spell/saiyan/self/zenkai/cast(list/targets, mob/user = usr)
	var/mob/living/U = user
	U.SetWeakened(0)
	U.SetStunned(0)
	U.SetParalysis(0)
	U.SetSleeping(0)
	U.SetEyeBlind(0)
	U.SetEyeBlurry(0)
	U.SetSlowed(0)
	U.SetLoseBreath(0)
	U.SetDizzy(0)
	U.SetJitter(0)
	U.SetConfused(0)
	U.RestoreEars()
	U.adjustStaminaLoss(-75)
	to_chat(user, "<span class='notice'>Your Saiyan blood refuses to let you fall here.</span>")
	for(var/i = 1 to 5)
		U.heal_overall_damage(10, 10)
		sleep(35)

/obj/effect/proc_holder/spell/saiyan/self/breakout
	name = "Break Free"
	desc = "You are far too powerful to be shackled."
	action_icon_state = "vampire_rejuvinate"
	charge_type = "recharge"
	charge_max = 100
/obj/effect/proc_holder/spell/saiyan/self/breakout/cast(list/targets, mob/user = usr)
	var/mob/living/carbon/human/U = user
	if(U.handcuffed)
		if(!(istype(U.handcuffed, /obj/item/restraints/handcuffs/energy/saiyancuffs)))
			U.uncuff()
			to_chat(U, "You snap the cuffs.")


