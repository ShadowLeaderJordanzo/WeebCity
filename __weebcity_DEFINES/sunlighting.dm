/*
    SEE LAYERS.DM Line 86 for the rest of the lighting layer/plane shit, considering how stuff is ordered in this codebase I don't give a FUCK.
*/ // WEEBCITY - JTGSZ CHANGE - Sunlighting
#define SUNLIGHTING_PLANE 14
#define SUNLIGHTING_LAYER 14
#define SUNLIGHTING_RENDER_TARGET "*SUNLIGHT_PLANE" //byond var so it ok despite looking janky

//Its a color matrix
#define SUNLIGHT_DARK_MATRIX \
	list                     \
	(                        \
		0, 0, 0, 0, \
		0, 0, 0, 0, \
		0, 0, 0, 0, \
		0, 0, 0, 0, \
		0, 0, 0, 1           \
	)                        \

#define SUNLIGHT_INDOOR   0
#define SUNLIGHT_OUTDOOR  1
#define SUNLIGHT_BORDER   2