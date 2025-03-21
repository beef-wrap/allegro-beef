using System;
using System.Interop;

namespace allegro;

extension allegro
{
	/* Possible bit combinations for the flags parameter of al_create_display. */
	[AllowDuplicates]
	public enum ALLEGRO_DISPLAY_FLAGS : c_int
	{
		ALLEGRO_WINDOWED                    = 1 << 0,
		ALLEGRO_FULLSCREEN                  = 1 << 1,
		ALLEGRO_OPENGL                      = 1 << 2,
		ALLEGRO_DIRECT3D_INTERNAL           = 1 << 3,
		ALLEGRO_RESIZABLE                   = 1 << 4,
		ALLEGRO_FRAMELESS                   = 1 << 5,
		ALLEGRO_NOFRAME                     = ALLEGRO_FRAMELESS, /* older synonym */
		ALLEGRO_GENERATE_EXPOSE_EVENTS      = 1 << 6,
		ALLEGRO_OPENGL_3_0                  = 1 << 7,
		ALLEGRO_OPENGL_FORWARD_COMPATIBLE   = 1 << 8,
		ALLEGRO_FULLSCREEN_WINDOW           = 1 << 9,
		ALLEGRO_MINIMIZED                   = 1 << 10,
		ALLEGRO_PROGRAMMABLE_PIPELINE       = 1 << 11,
		ALLEGRO_GTK_TOPLEVEL_INTERNAL       = 1 << 12,
		ALLEGRO_MAXIMIZED                   = 1 << 13,
		ALLEGRO_OPENGL_ES_PROFILE           = 1 << 14,
#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
		ALLEGRO_OPENGL_CORE_PROFILE         = 1 << 15,
		ALLEGRO_DRAG_AND_DROP               = 1 << 16,
#endif
	}

	/* Possible parameters for al_set_display_option.
	* Make sure to update ALLEGRO_EXTRA_DISPLAY_SETTINGS if you modify
	* anything here.
	*/
	public enum ALLEGRO_DISPLAY_OPTIONS : c_int
	{
		ALLEGRO_RED_SIZE = 0,
		ALLEGRO_GREEN_SIZE = 1,
		ALLEGRO_BLUE_SIZE = 2,
		ALLEGRO_ALPHA_SIZE = 3,
		ALLEGRO_RED_SHIFT = 4,
		ALLEGRO_GREEN_SHIFT = 5,
		ALLEGRO_BLUE_SHIFT = 6,
		ALLEGRO_ALPHA_SHIFT = 7,
		ALLEGRO_ACC_RED_SIZE = 8,
		ALLEGRO_ACC_GREEN_SIZE = 9,
		ALLEGRO_ACC_BLUE_SIZE = 10,
		ALLEGRO_ACC_ALPHA_SIZE = 11,
		ALLEGRO_STEREO = 12,
		ALLEGRO_AUX_BUFFERS = 13,
		ALLEGRO_COLOR_SIZE = 14,
		ALLEGRO_DEPTH_SIZE = 15,
		ALLEGRO_STENCIL_SIZE = 16,
		ALLEGRO_SAMPLE_BUFFERS = 17,
		ALLEGRO_SAMPLES = 18,
		ALLEGRO_RENDER_METHOD = 19,
		ALLEGRO_FLOAT_COLOR = 20,
		ALLEGRO_FLOAT_DEPTH = 21,
		ALLEGRO_SINGLE_BUFFER = 22,
		ALLEGRO_SWAP_METHOD = 23,
		ALLEGRO_COMPATIBLE_DISPLAY = 24,
		ALLEGRO_UPDATE_DISPLAY_REGION = 25,
		ALLEGRO_VSYNC = 26,
		ALLEGRO_MAX_BITMAP_SIZE = 27,
		ALLEGRO_SUPPORT_NPOT_BITMAP = 28,
		ALLEGRO_CAN_DRAW_INTO_BITMAP = 29,
		ALLEGRO_SUPPORT_SEPARATE_ALPHA = 30,
		ALLEGRO_AUTO_CONVERT_BITMAPS = 31,
		ALLEGRO_SUPPORTED_ORIENTATIONS = 32,
		ALLEGRO_OPENGL_MAJOR_VERSION = 33,
		ALLEGRO_OPENGL_MINOR_VERSION = 34,
		ALLEGRO_DEFAULT_SHADER_PLATFORM = 35,
		ALLEGRO_DISPLAY_OPTIONS_COUNT
	}

	public enum ALLEGRO_IMPORTANCE_FLAGS : c_int
	{
		ALLEGRO_DONTCARE,
		ALLEGRO_REQUIRE,
		ALLEGRO_SUGGEST
	}

	 /* Bitflags so they can be used for the ALLEGRO_SUPPORTED_ORIENTATIONS option. */
	public enum ALLEGRO_DISPLAY_ORIENTATION : c_int
	{
		ALLEGRO_DISPLAY_ORIENTATION_UNKNOWN = 0,
		ALLEGRO_DISPLAY_ORIENTATION_0_DEGREES = 1,
		ALLEGRO_DISPLAY_ORIENTATION_90_DEGREES = 2,
		ALLEGRO_DISPLAY_ORIENTATION_180_DEGREES = 4,
		ALLEGRO_DISPLAY_ORIENTATION_270_DEGREES = 8,
		ALLEGRO_DISPLAY_ORIENTATION_PORTRAIT = 5,
		ALLEGRO_DISPLAY_ORIENTATION_LANDSCAPE = 10,
		ALLEGRO_DISPLAY_ORIENTATION_ALL = 15,
		ALLEGRO_DISPLAY_ORIENTATION_FACE_UP = 16,
		ALLEGRO_DISPLAY_ORIENTATION_FACE_DOWN = 32
	}


	 /* Formally part of the primitives addon. */
	public const c_int _ALLEGRO_PRIM_MAX_USER_ATTR = 10;

	public struct ALLEGRO_DISPLAY;

	 /* Enum: ALLEGRO_NEW_WINDOW_TITLE_MAX_SIZE
	 */
	public const c_int ALLEGRO_NEW_WINDOW_TITLE_MAX_SIZE = 255;

	[CLink] public static extern void al_set_new_display_refresh_rate(c_int refresh_rate);
	[CLink] public static extern void al_set_new_display_flags(c_int flags);
	[CLink] public static extern c_int  al_get_new_display_refresh_rate();
	[CLink] public static extern c_int  al_get_new_display_flags();

	[CLink] public static extern void al_set_new_window_title(char* title);
	[CLink] public static extern char* al_get_new_window_title();

	[CLink] public static extern c_int al_get_display_width(ALLEGRO_DISPLAY* display);
	[CLink] public static extern c_int al_get_display_height(ALLEGRO_DISPLAY* display);
	[CLink] public static extern c_int al_get_display_format(ALLEGRO_DISPLAY* display);
	[CLink] public static extern c_int al_get_display_refresh_rate(ALLEGRO_DISPLAY* display);
	[CLink] public static extern c_int al_get_display_flags(ALLEGRO_DISPLAY* display);
	[CLink] public static extern c_int al_get_display_orientation(ALLEGRO_DISPLAY* display);
	[CLink] public static extern bool al_set_display_flag(ALLEGRO_DISPLAY* display, c_int flag, bool onoff);

	[CLink] public static extern ALLEGRO_DISPLAY* al_create_display(c_int w, c_int h);
	[CLink] public static extern void al_destroy_display(ALLEGRO_DISPLAY* display);
	[CLink] public static extern ALLEGRO_DISPLAY* al_get_current_display();
	[CLink] public static extern void al_set_target_bitmap(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern void al_set_target_backbuffer(ALLEGRO_DISPLAY* display);
	[CLink] public static extern ALLEGRO_BITMAP* al_get_backbuffer(ALLEGRO_DISPLAY* display);
	[CLink] public static extern ALLEGRO_BITMAP* al_get_target_bitmap();

	[CLink] public static extern bool al_acknowledge_resize(ALLEGRO_DISPLAY* display);
	[CLink] public static extern bool al_resize_display(ALLEGRO_DISPLAY* display, c_int width, c_int height);
	[CLink] public static extern void al_flip_display();
	[CLink] public static extern void al_update_display_region(c_int x, c_int y, c_int width, c_int height);
	[CLink] public static extern bool al_is_compatible_bitmap(ALLEGRO_BITMAP* bitmap);

	[CLink] public static extern bool al_wait_for_vsync();

	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_display_event_source(ALLEGRO_DISPLAY* display);

	[CLink] public static extern void al_set_display_icon(ALLEGRO_DISPLAY* display, ALLEGRO_BITMAP* icon);
	[CLink] public static extern void al_set_display_icons(ALLEGRO_DISPLAY* display, c_int num_icons, ALLEGRO_BITMAP* icons);

	 /* Stuff for multihead/window management */
	[CLink] public static extern c_int al_get_new_display_adapter();
	[CLink] public static extern void al_set_new_display_adapter(c_int adapter);
	[CLink] public static extern c_int al_get_display_adapter(ALLEGRO_DISPLAY* display);
	[CLink] public static extern void al_set_new_window_position(c_int x, c_int y);
	[CLink] public static extern void al_get_new_window_position(c_int* x, c_int* y);
	[CLink] public static extern void al_set_window_position(ALLEGRO_DISPLAY* display, c_int x, c_int y);
	[CLink] public static extern void al_get_window_position(ALLEGRO_DISPLAY* display, c_int* x, c_int* y);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	 [CLink] public static extern bool al_get_window_borders (ALLEGRO_DISPLAY *display, c_int *left, c_int *top, c_int *right, c_int *bottom);
#endif

	[CLink] public static extern bool al_set_window_constraints(ALLEGRO_DISPLAY* display, c_int min_w, c_int min_h, c_int max_w, c_int max_h);
	[CLink] public static extern bool al_get_window_constraints(ALLEGRO_DISPLAY* display, c_int* min_w, c_int* min_h, c_int* max_w, c_int* max_h);
	[CLink] public static extern void al_apply_window_constraints(ALLEGRO_DISPLAY* display, bool onoff);

	[CLink] public static extern void al_set_window_title(ALLEGRO_DISPLAY* display, char* title);

	 /* Defined in display_settings.c */
	[CLink] public static extern void al_set_new_display_option(c_int option, c_int value, c_int importance);
	[CLink] public static extern c_int al_get_new_display_option(c_int option, c_int* importance);
	[CLink] public static extern void al_reset_new_display_options();
	[CLink] public static extern void al_set_display_option(ALLEGRO_DISPLAY* display, c_int option, c_int value);
	[CLink] public static extern c_int al_get_display_option(ALLEGRO_DISPLAY* display, c_int option);

	 /*Deferred drawing*/
	[CLink] public static extern void al_hold_bitmap_drawing(bool hold);
	[CLink] public static extern bool al_is_bitmap_drawing_held();

	 /* Miscellaneous */
	[CLink] public static extern void al_acknowledge_drawing_halt(ALLEGRO_DISPLAY* display);
	[CLink] public static extern void al_acknowledge_drawing_resume(ALLEGRO_DISPLAY* display);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	 [CLink] public static extern void al_backup_dirty_bitmaps (ALLEGRO_DISPLAY *display);
#endif
}