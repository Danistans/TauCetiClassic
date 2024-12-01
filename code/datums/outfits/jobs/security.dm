// HOS OUTFIT
/datum/outfit/job/hos
	name = OUTFIT_JOB_NAME("Head of Security")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden

	belt = /obj/item/weapon/katana // Шашка
	l_pocket = /obj/item/weapon/storage/key_holder
	survival_box = FALSE

	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

	back_style = BACKPACK_STYLE_SECURITY

// WARDEN OUTFIT
/datum/outfit/job/warden
	name = OUTFIT_JOB_NAME("Warden")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden

	suit_store = /obj/item/weapon/gun/energy/gun
	belt = /obj/item/weapon/katana // Шашка
	l_pocket = /obj/item/weapon/storage/key_holder
	survival_box = FALSE

	backpack_contents = null
	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

	back_style = BACKPACK_STYLE_SECURITY

// DETECTIVE OUTFIT
/datum/outfit/job/detective
	name = OUTFIT_JOB_NAME("Detective")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden
	survival_box = FALSE

	suit_store = /obj/item/weapon/gun/energy/gun
	belt = /obj/item/weapon/katana // Шашка
	l_pocket = /obj/item/weapon/storage/key_holder

	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

// OFFICER OUTFIT
/datum/outfit/job/officer
	name = OUTFIT_JOB_NAME("Security Officer")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden

	suit_store = /obj/item/weapon/gun/energy/gun
	belt = /obj/item/weapon/katana // Шашка
	l_pocket = /obj/item/weapon/storage/key_holder
	survival_box = FALSE

	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

	back_style = BACKPACK_STYLE_SECURITY

/datum/outfit/job/officer/security
	name = OUTFIT_JOB_NAME("Офицер охранки")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden
	l_pocket = /obj/item/weapon/storage/key_holder
	survival_box = FALSE

	suit_store = /obj/item/weapon/gun/energy/gun
	belt = /obj/item/weapon/katana // Шашка

/datum/outfit/job/officer/feldfeb
	name = OUTFIT_JOB_NAME("Фельдфебель")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden

	suit_store = /obj/item/weapon/gun/energy/gun
	belt = /obj/item/weapon/katana // Шашка
	l_pocket = /obj/item/weapon/storage/key_holder
	survival_box = FALSE

	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

	back_style = BACKPACK_STYLE_SECURITY

/datum/outfit/job/officer/unter
	name = OUTFIT_JOB_NAME("Унтер-офицер")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden
	survival_box = FALSE

	belt = /obj/item/weapon/katana // Шашка
	l_pocket = /obj/item/weapon/storage/key_holder

	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

	back_style = BACKPACK_STYLE_SECURITY

/datum/outfit/job/officer/rjevsky
	name = OUTFIT_JOB_NAME("Поручик")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden

	belt = /obj/item/weapon/katana // Шашка
	l_pocket = /obj/item/weapon/storage/key_holder
	survival_box = FALSE

	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

	back_style = BACKPACK_STYLE_SECURITY

// FORENSIC OUTFIT
/datum/outfit/job/forensic
	name = OUTFIT_JOB_NAME("Фельдфебель")

	uniform = /obj/item/clothing/under/shorts/red // Офицерская форма
	uniform_f = /obj/item/clothing/under/shorts/red
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet/warden
	l_pocket = /obj/item/weapon/storage/key_holder
	survival_box = FALSE

	belt = /obj/item/weapon/katana // Шашка

	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

// CADET OUTFIT
/datum/outfit/job/cadet
	name = OUTFIT_JOB_NAME("Ефрейтор")

	uniform = /obj/item/clothing/under/shorts/grey // Солдатская форма
	uniform_f = /obj/item/clothing/under/shorts/grey
	shoes = /obj/item/clothing/shoes/boots // Говнодавы
	head = /obj/item/clothing/head/helmet
	l_pocket = /obj/item/weapon/storage/key_holder
	belt = /obj/item/weapon/storage/belt/security
	survival_box = FALSE

	implants = list(/obj/item/weapon/implant/mind_protect/mindshield, /obj/item/weapon/implant/obedience)

	back_style = BACKPACK_STYLE_SECURITY
