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
 *      Keyboard routines.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CRepr]
	public struct ALLEGRO_KEYBOARD;

	[CRepr]
	public struct ALLEGRO_KEYBOARD_STATE
	{
		/* public */
		public ALLEGRO_DISPLAY* display;
		/* internal */
		c_uint[((.)ALLEGRO_KEY_CODE.ALLEGRO_KEY_MAX + 31) / 32] __key_down__internal__;
	}


	[CLink] public static extern bool al_is_keyboard_installed();
	[CLink] public static extern bool al_install_keyboard();
	[CLink] public static extern void al_uninstall_keyboard();

	[CLink] public static extern bool al_can_set_keyboard_leds();
	[CLink] public static extern bool al_set_keyboard_leds(c_int leds);

	[CLink] public static extern char* al_keycode_to_name(c_int keycode);

	[CLink] public static extern void al_get_keyboard_state(ALLEGRO_KEYBOARD_STATE* ret_state);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	[CLink] public static extern void  al_clear_keyboard_state (ALLEGRO_DISPLAY *display);
#endif

	[CLink] public static extern bool al_key_down(ALLEGRO_KEYBOARD_STATE*, c_int keycode);

	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_keyboard_event_source();
}