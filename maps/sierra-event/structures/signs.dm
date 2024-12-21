/obj/structure/sign/dedicationplaque/sierra
	name = "\improper SES Sierra Democratica dedication plaque"

/obj/structure/sign/dedicationplaque/sierra/Initialize()
	. = ..()
	desc = "S.E.S. Sierra Democratica - Mako Class Superdestroyer - SEAF Registry 3525 - Blume Ship Yards, Super Earth - Fourth Vessel To Bear The Name - Launched [GLOB.using_map.game_year - 12] - Super Earth Central Government - 'The light of Democracy will guide us through the darkest abyss.'"


/obj/structure/sign/memorial/sierra
	name = "\improper SES Sierra Democratica model"
	icon = 'maps/sierra/structures/memorial/sierra_memorial.dmi'
	icon_state = "sierra"

	layer = ABOVE_HUMAN_LAYER

	//description holder
	var/description

	/// The token for the loop sound
	var/levitation_sound

	/// list of sierra port developers
	var/developers = "K.G. List, S.H. Eugene, L.D. Nest, J.X. Kand and A.T. Cuddle"

/obj/structure/sign/memorial/sierra/Initialize()
	. = ..()

	levitation_sound = GLOB.sound_player.PlayLoopingSound(src, "\ref[src]", 'maps/sierra/structures/memorial/levitation_sound.ogg', 25, 3)

	set_light(2, 0.8, COLOR_TEAL)

	desc = "You see a holographic sign that says: 'Model of S.E.S. Sierra Democratica - Mako Class Superdestroyer'"
	description = {"<div style="max-width: 480px; margin: 12px auto;"><div style="border: 1px solid #4e9bcf; padding: 20px; color: #4e9bcf; margin-bottom: 10px; font-family: monospace;"><div style="font-size: 14px; text-align: center; font-weight: bold;"><div>S.E.S. Sierra Democratica - Mako Class Superdestroyer</div><div>SEAF Registry 3525 - Blume Ship Yards.</div></div><hr style="border-color: #4e9bcf;"><div style="font-style: italic; text-align: center;"><div>Super Earth - Fourth Vessel To Bear The Name</div><div>Launched [GLOB.using_map.game_year - 12] - Super Earth Central Government</div><div>"The light of Democracy will guide us through the darkest abyss"</div></div><hr style="border-color: #4e9bcf;"><div>Special thanks to the engineers of section '#2179-INF'.<br><br>Adjustment Engineers: [developers] for invaluable contributions to the development of the SES Sierra Democratica.</div></div><div class="notice">Next comes an extremely long list of names and job titles, as well as a photograph of the team of engineers responsible for building this ship.</div></div>"}

	update_icon()

/obj/structure/sign/memorial/sierra/on_update_icon()
	. = ..()
	AddOverlays(image(icon, "sierra-overlay"))

/obj/structure/sign/memorial/sierra/update_emissive_blocker()
	. = ..()
	. += emissive_appearance(icon, "sierra-overlay")

/obj/structure/sign/memorial/sierra/examine(mob/user)
	. = ..()
	to_chat(user, "You see a holographic sign: <A href='?src=\ref[src];show_info=1'>Read Sign</A>")

/obj/structure/sign/memorial/sierra/CanUseTopic()
	return STATUS_INTERACTIVE

/obj/structure/sign/memorial/sierra/OnTopic(href, href_list)
	if(href_list["show_info"])
		to_chat(usr, description)
		return TOPIC_HANDLED
	. = ..()


/obj/structure/sign/poster/annoyed_gas
	icon_state = "annoyed_gas"
	poster_type = /singleton/poster/annoyed_gas

/obj/structure/sign/poster/healthy_hugs
	icon_state = "healthy_hugs"
	poster_type = /singleton/poster/healthy_hugs

/obj/structure/sign/poster/no_alcohol
	icon_state = "no_alcohol"
	poster_type = /singleton/poster/no_alcohol

/obj/structure/sign/poster/pizza_for_captain
	icon_state = "pizza_for_captain"
	poster_type = /singleton/poster/pizza_for_captain

/obj/structure/sign/poster/would_you_plant
	icon_state = "would_you_plant"
	poster_type = /singleton/poster/would_you_plant

/obj/structure/sign/poster/cabbage_tray
	icon_state = "cabbage_tray"
	poster_type = /singleton/poster/cabbage_tray

/obj/structure/sign/poster/unusual_gas
	icon_state = "unusual_gas"
	poster_type = /singleton/poster/contraband_only/unusual_gas
