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
 */


/*
 *  Public iPhone-related API
 */
using System;
using System.Interop;


namespace allegro;

extension allegro
{
	public enum ALLEGRO_IPHONE_STATUSBAR_ORIENTATION : c_int
	{
		ALLEGRO_IPHONE_STATUSBAR_ORIENTATION_PORTRAIT = 0,
		ALLEGRO_IPHONE_STATUSBAR_ORIENTATION_PORTRAIT_UPSIDE_DOWN,
		ALLEGRO_IPHONE_STATUSBAR_ORIENTATION_LANDSCAPE_RIGHT,
		ALLEGRO_IPHONE_STATUSBAR_ORIENTATION_LANDSCAPE_LEFT
	}

	[CLink] public static extern void al_iphone_set_statusbar_orientation(c_int orientation);
	[CLink] public static extern double al_iphone_get_last_shake_time();
	[CLink] public static extern float al_iphone_get_battery_level();
}