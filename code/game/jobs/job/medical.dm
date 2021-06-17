/datum/job/cmo
	title = "Medical Administrator"
	flag = JOB_CMO
	department_flag = JOBCAT_MEDSCI
	total_positions = 1
	spawn_positions = 1
	is_medical = 1
	supervisors = "the captain"
	department_head = list("Mayor")
	selection_color = "#ffddf0"
	req_admin_notify = 1
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_GENETICS, ACCESS_HEADS,
			ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_CMO, ACCESS_SURGERY, ACCESS_RC_ANNOUNCE,
			ACCESS_KEYCARD_AUTH, ACCESS_SEC_DOORS, ACCESS_PSYCHIATRIST, ACCESS_PARAMEDIC, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_EVA, ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_GENETICS, ACCESS_HEADS,
			ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_CMO, ACCESS_SURGERY, ACCESS_RC_ANNOUNCE,
			ACCESS_KEYCARD_AUTH, ACCESS_SEC_DOORS, ACCESS_PSYCHIATRIST, ACCESS_MAINT_TUNNELS, ACCESS_PARAMEDIC, ACCESS_MINERAL_STOREROOM)
	minimal_player_age = 21
	exp_requirements = 1200
	exp_type = EXP_TYPE_MEDICAL
	outfit = /datum/outfit/job/cmo

/datum/outfit/job/cmo
	name = "Medical Administrator"
	jobtype = /datum/job/cmo

	uniform = /obj/item/clothing/under/rank/chief_medical_officer
	suit = /obj/item/clothing/suit/storage/labcoat/cmo
	shoes = /obj/item/clothing/shoes/brown
	l_ear = /obj/item/radio/headset/heads/cmo
	id = /obj/item/card/id/cmo
	suit_store = /obj/item/flashlight/pen
	l_hand = /obj/item/storage/firstaid/doctor
	pda = /obj/item/pda/heads/cmo
	backpack_contents = list(
		/obj/item/melee/classic_baton/telescopic = 1
	)

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel_med
	dufflebag = /obj/item/storage/backpack/duffel/medical

/datum/job/doctor
	title = "Medical Doctor"
	flag = JOB_DOCTOR
	department_flag = JOBCAT_MEDSCI
	total_positions = 5
	spawn_positions = 3
	is_medical = 1
	supervisors = "the chief medical officer"
	department_head = list("Medical Administrator")
	selection_color = "#ffeef0"
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_GENETICS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_MAINT_TUNNELS)
	alt_titles = list("Surgeon","Nurse")
	minimal_player_age = 3
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/doctor

/datum/outfit/job/doctor
	name = "Medical Doctor"
	jobtype = /datum/job/doctor

	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/labcoat
	shoes = /obj/item/clothing/shoes/white
	l_ear = /obj/item/radio/headset/headset_med
	id = /obj/item/card/id/medical
	suit_store = /obj/item/flashlight/pen
	l_hand = /obj/item/storage/firstaid/doctor
	pda = /obj/item/pda/medical

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel_med
	dufflebag = /obj/item/storage/backpack/duffel/medical


/datum/outfit/job/doctor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(H.mind && H.mind.role_alt_title)
		switch(H.mind.role_alt_title)
			if("Surgeon")
				uniform = /obj/item/clothing/under/rank/medical/blue
				head = /obj/item/clothing/head/surgery/blue
			if("Medical Doctor")
				uniform = /obj/item/clothing/under/rank/medical
			if("Nurse")
				if(H.gender == FEMALE)
					if(prob(50))
						uniform = /obj/item/clothing/under/rank/nursesuit
					else
						uniform = /obj/item/clothing/under/rank/nurse
					head = /obj/item/clothing/head/nursehat
				else
					uniform = /obj/item/clothing/under/rank/medical/purple
