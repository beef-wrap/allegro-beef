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
 *      Header file for Windows specific API.
 *
 *      By Trent Gamblin.
 *
 */

/*
 *  Public Windows-related API
 */

using System;
using System.Interop;


namespace allegro;


extension allegro
{
	typealias UINT = c_uint;
	typealias WPARAM = c_uint*;
	typealias LPARAM = c_long*;
	typealias LRESULT = c_long*;

	public struct HWND;

	[CLink] public static extern HWND al_get_win_window_handle(ALLEGRO_DISPLAY* display);
	[CLink] public static extern bool al_win_add_window_callback(ALLEGRO_DISPLAY* display, function bool(ALLEGRO_DISPLAY* display, UINT message, WPARAM wparam, LPARAM lparam, LRESULT* result, void* userdata) callback, void* userdata);
	[CLink] public static extern bool al_win_remove_window_callback(ALLEGRO_DISPLAY* display, function bool(ALLEGRO_DISPLAY* display, UINT message, WPARAM wparam, LPARAM lparam, LRESULT* result, void* userdata) callback, void* userdata);
}