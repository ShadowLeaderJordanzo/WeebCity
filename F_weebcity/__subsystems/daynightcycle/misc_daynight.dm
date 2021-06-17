/*
	Instead of using the usual iteration of day/night I jam into everything, lets use another considering this codebase is AGPL
	But really, its because newer tg forks have extreme GC issues with lighting from my experience.
	Although this iteration is literally untested, might as well give it a try.
	Anyways thanks russians, and thanks Andrew
*/

//Contains all sunlight objects
/obj/screen/plane_master/Sunlight
	name = "lighting plane master"
	plane = SUNLIGHTING_PLANE
	blend_mode = BLEND_MULTIPLY
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	render_target = SUNLIGHTING_RENDER_TARGET
	//screen_loc = "CENTER"

/* our sunny version - I will need to figure out a less shit way of copying this */
/obj/screen/fullscreen/lighting_backdrop/Sunlight
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "flash"
	//screen_loc = "CENTER"
	transform = null
	plane = LIGHTING_PLANE
	layer = LIGHTING_LAYER
	blend_mode = BLEND_ADD
	show_when_dead = TRUE
	screen_loc = "CENTER"
	//render_source = "*SUNLIGHT_PLANE"


/obj/screen/fullscreen/lighting_backdrop/Sunlight/Initialize()
	. = ..()
	filters += filter(type="layer", render_source=SUNLIGHTING_RENDER_TARGET /*, flags=MASK_INVERSE*/ )
	SSsunlight.sunlighting_planes |= src

/obj/screen/fullscreen/lighting_backdrop/Sunlight/Destroy()
	. = ..()
	SSsunlight.sunlighting_planes -= src


