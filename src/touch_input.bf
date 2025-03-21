/*         ______   ___    ___
 *        /\  _  \ /\_ \  /\_ \
 *        \ \ \L\ \\//\ \ \//\ \      __     __   _ __   ___
 *         \ \  __ \ \ \ \  \ \ \   /'__`\ /'_ `\/\`'__\/ __`\
 *          \ \ \/\ \ \_\ \_ \_\ \_/\  __//\ \L\ \ \ \//\ \L\ \
 *           \ \_\ \_\/\____\/\____\ \____\ \____ \ \_\\ \____/
 *            \/_/\/_/\/____/\/____/\/____/\/___L\ \/_/ \/___/
 *                                           /\____/
 *                                           \_/__/
 *
 *      Touch input routines.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public const c_int ALLEGRO_TOUCH_INPUT_MAX_TOUCH_COUNT        = 16;

	public struct ALLEGRO_TOUCH_INPUT;

	[CRepr]
	public struct ALLEGRO_TOUCH_STATE
	{
	   /* (id) An identifier of touch. If touch is valid this number is positive.
		* (x, y) Touch position on the screen in 1:1 resolution.
		* (dx, dy) Relative touch position.
		* (primary) True, if touch is a primary one (usually first one).
		* (display) Display at which the touch belong.
		*/
		c_int id;
		float x, y;
		float dx, dy;
		bool primary;
		ALLEGRO_DISPLAY* display;
	}

	[CRepr]
	public struct ALLEGRO_TOUCH_INPUT_STATE
	{
		ALLEGRO_TOUCH_STATE[ALLEGRO_TOUCH_INPUT_MAX_TOUCH_COUNT] touches;
	}


#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	public enum ALLEGRO_MOUSE_EMULATION_MODE : c_int
	{
		ALLEGRO_MOUSE_EMULATION_NONE,
		ALLEGRO_MOUSE_EMULATION_TRANSPARENT,
		ALLEGRO_MOUSE_EMULATION_INCLUSIVE,
		ALLEGRO_MOUSE_EMULATION_EXCLUSIVE,
		ALLEGRO_MOUSE_EMULATION_5_0_x
	}
#endif

	[CLink] public static extern bool al_is_touch_input_installed();
	[CLink] public static extern bool al_install_touch_input();
	[CLink] public static extern void al_uninstall_touch_input();
	[CLink] public static extern void al_get_touch_input_state(ALLEGRO_TOUCH_INPUT_STATE* ret_state);
	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_touch_input_event_source();

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	[CLink] public static extern void al_set_mouse_emulation_mode(c_int mode);
	[CLink] public static extern c_int al_get_mouse_emulation_mode();
	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_touch_input_mouse_emulation_event_source();
#endif

}