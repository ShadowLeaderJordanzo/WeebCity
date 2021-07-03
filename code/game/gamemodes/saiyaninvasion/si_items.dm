/obj/item/clothing/suit/armor/vest/saiyan
	name = "Alien Armor"
	desc = "An armored vest that protects against copious amounts of damage."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 50, "energy" = 30, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)

/obj/item/clothing/suit/armor/vest/humansaiyan
	name = "Replicated Alien Armor"
	desc = "An armored vest that was replciated to mimic the strength of the alien's."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 40, "energy" = 20, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 55)

/obj/item/restraints/handcuffs/energy/saiyancuffs // basically saiyan only cuffs, will keep them down
	name = "Alien Cuffs"
	desc = "Used for those pesky tailed ones."
	icon_state = "saiyanhandcuff"
	materials = list(MAT_METAL=500, MAT_PLASMA=1500)
	origin_tech = "materials=3;plasmatech=4;engineering=3"
/obj/item/twohanded/powerpole
	name = "Power Pole"
	desc = "A pole used by the Z-Warrior, it's power and durability is unmatched."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "powerpole"
	force = 15
	throwforce = 22
	throw_speed = 4
	throw_range = 9
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = SLOT_BACK
	armour_penetration = 50
	attack_verb = list("bludgeoned", "whacked")
	resistance_flags = FLAMMABLE

/obj/item/reagent_containers/food/snacks/grown/senzu
	name = "Senzu Bean"
	volume = 25
	bitesize = 1
	consume_sound = 'sound/items/eatfood.ogg'
	instant_application = 1 //if we want to bypass the forcedfeed delay
	antable = FALSE // Will ants come near it?
	resistance_flags = FLAMMABLE
	container_type = NONE
	list_reagents = list("adminordrazine" = 25)

/obj/item/reagent_containers/food/snacks/grown/senzu/On_Consume(mob/M, mob/user)
	if(!user)
		return
	if(!reagents.total_volume)
		if(M == user)
			to_chat(user, "<span class='notice'>You finish eating \the [src].</span>")
		user.visible_message("<span class='notice'>[M] finishes eating \the [src].</span>")
		user.unEquip(src)	//so icons update :[
		Post_Consume(M)
		qdel(src)
	return

/obj/item/reagent_containers/food/snacks/grown/senzu/Post_Consume(mob/living/M)
	M.rejuvenate()
	return
