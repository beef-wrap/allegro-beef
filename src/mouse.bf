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
 *      Mouse routines.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	/* Allow up to four extra axes for future expansion. */
	public const c_int ALLEGRO_MOUSE_MAX_EXTRA_AXES = 4;

	public struct ALLEGRO_MOUSE;

	struct ALLEGRO_MOUSE_STATE
	{
	   /* (x, y) Primary mouse position
		* (z) Mouse wheel position (1D 'wheel'), or,
		* (w, z) Mouse wheel position (2D 'ball')
		* display - the display the mouse is on (coordinates are relative to this)
		* pressure - the pressure applied to the mouse (for stylus/tablet)
		*/
		c_int x;
		c_int y;
		c_int z;
		c_int w;
		c_int more_axes;
		c_int buttons;
		float pressure;
		ALLEGRO_DISPLAY* display;
	}

	public enum ALLEGRO_MOUSE_BUTTON : c_int
	{
		ALLEGRO_MOUSE_BUTTON_LEFT = 1,
		ALLEGRO_MOUSE_BUTTON_RIGHT = 2,
		ALLEGRO_MOUSE_BUTTON_MIDDLE = 3,
	}

	[CLink] public static extern bool al_is_mouse_installed();
	[CLink] public static extern bool al_install_mouse();
	[CLink] public static extern void al_uninstall_mouse();
	[CLink] public static extern c_uint al_get_mouse_num_buttons();
	[CLink] public static extern c_uint al_get_mouse_num_axes  ();
	[CLink] public static extern bool al_set_mouse_xy(ALLEGRO_DISPLAY* display, c_int x, c_int y);
	[CLink] public static extern bool al_set_mouse_z(c_int z);
	[CLink] public static extern bool al_set_mouse_w(c_int w);
	[CLink] public static extern bool al_set_mouse_axis(c_int axis, c_int value);
	[CLink] public static extern void al_get_mouse_state(ALLEGRO_MOUSE_STATE* ret_state);
	[CLink] public static extern bool al_mouse_button_down(ALLEGRO_MOUSE_STATE* state, c_int button);
	[CLink] public static extern c_int al_get_mouse_state_axis(ALLEGRO_MOUSE_STATE* state, c_int axis);
	[CLink] public static extern bool al_can_get_mouse_cursor_position();
	[CLink] public static extern bool al_get_mouse_cursor_position(c_int* ret_x, c_int* ret_y);
	[CLink] public static extern bool al_grab_mouse(ALLEGRO_DISPLAY* display);
	[CLink] public static extern bool al_ungrab_mouse();
	[CLink] public static extern void al_set_mouse_wheel_precision(c_int precision);
	[CLink] public static extern c_int al_get_mouse_wheel_precision();

	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_mouse_event_source();
}