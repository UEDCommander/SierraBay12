/*
	SierraBay12 - Master defines file

	Руководство по добавлению дефайнов:
	- Добавь комментарий с ID модуля и указанием, что это начало
	- Запиши все нужные дефайны
	- Вновь комментарий с ID модуля и указанием, что это конец
*/

// TAJARA - Start
#define SPECIES_TAJARA			"Tajara"
#define LANGUAGE_SIIK_MAAS		"Siik'maas"
#define LANGUAGE_SIIK_TAJR		"Siik'tajr"
// TAJARA - End

// LEGALESE - Start
#define LANGUAGE_LEGALESE		"Legalese"
// LEGALESE - End

// UTF8 - Start
#undef show_browser
#define show_browser(target, content, title)  to_target(target, browse(utf_8_html(content), title))
// UTF8 - End

// DON_LOADOUT - Start
// Не открывать до Рождества
/*
#define DONATION_TIER_NONE   null
#define DONATION_TIER_ONE    "Tier 1"
#define DONATION_TIER_TWO    "Tier 2"
#define DONATION_TIER_THREE  "Tier 3"
#define DONATION_TIER_FOUR   "Tier 4"
#define DONATION_TIER_ADMIN  "Admin"

#define DONATION_TIER_ONE_SUM    100
#define DONATION_TIER_TWO_SUM    300
#define DONATION_TIER_THREE_SUM  500
#define DONATION_TIER_FOUR_SUM   1000

// Keep this in ascending order
// (from the lower tier to the higher)
#define DONATION_TIER_ALL_TIERS list(\
	DONATION_TIER_NONE, DONATION_TIER_ONE, \
	DONATION_TIER_TWO, DONATION_TIER_THREE, \
	DONATION_TIER_FOUR, DONATION_TIER_ADMIN)
*/
// DON_LOADOUT - End

// GLIDING - Start
#define DELAY2GLIDESIZE(delay) (world.icon_size / max(ceil(delay / world.tick_lag), 1))
// GLIDING - End

// LOADOUT_ITEMS - Start
#define ACCESSORY_SLOT_OVER     "Over"
// LOADOUT_ITEMS - End

// RESOMI - Start
#define SPECIES_RESOMI  "Resomi"
#define LANGUAGE_RESOMI "Schechi"

#define CULTURE_RESOMI_EREMUS         "Eremus, Eremusianin"
#define CULTURE_RESOMI_ASRANDA        "Asranda, Randian"
#define CULTURE_RESOMI_REFUGEE        "Imperial refugee"
#define CULTURE_RESOMI_NEWGENERATION  "New generation"
#define CULTURE_RESOMI_LOSTCOLONYRICH "A native of a thriving lost colony"
#define CULTURE_RESOMI_LOSTCOLONYPOOR "A native of a impoverished lost colony"

#define HOME_SYSTEM_RESOMI_BIRDCAGE       "Birdcage (Colchis Habitat)"
#define HOME_SYSTEM_RESOMI_EREMUS         "Eremus"
#define HOME_SYSTEM_RESOMI_ASRANDA        "Asranda"
#define HOME_SYSTEM_RESOMI_SAVEEL         "Zer'een (Saveel)"
#define HOME_SYSTEM_RESOMI_LOST_COLONY    "Unknown independent colony"
#define HOME_SYSTEM_RESOMI_REFUGEE_COLONY "Unknown Independent Refugee Colony"
#define HOME_SYSTEM_RESOMI_HOMELESS       "None"
#define HOME_SYSTEM_RESOMI_IMPER_COLONY   "Unknown Imperial colony"

#define RELIGION_RESOMI_CHOSEN    "Faith of the Chosen"
#define RELIGION_RESOMI_EMPEROR   "Cult of the Emperor"
#define RELIGION_RESOMI_MOUNTAIN  "Echos of the Mountain"
#define RELIGION_RESOMI_SKIES     "Lights of the Skies"

/*#define CULTURE_RESOMI_BIRDCAGE  "Birdcage, \"Born in the void\""
#define CULTURE_RESOMI_SAVEEL      "Saveel, Sav"
#define HOME_SYSTEM_RESOMI_TIAMATH "Tiamat"*/
// RESOMI - End
