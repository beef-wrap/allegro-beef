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
 *      Header file for X specific functionality.
 *
 *      By Robert MacGregor.
 *
 */


/*
 *  Public X-related API
 */


using System;
using System.Interop;


namespace allegro;


extension allegro
{
	public struct XID;

	[CLink] public static extern XID al_get_x_window_id(ALLEGRO_DISPLAY* display);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	[CLink] public static extern bool al_x_set_initial_icon (ALLEGRO_BITMAP *bitmap);
#endif

}