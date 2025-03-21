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
 *      Clipboard handling.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CLink] public static extern char* al_get_clipboard_text(ALLEGRO_DISPLAY* display);
	[CLink] public static extern bool al_set_clipboard_text(ALLEGRO_DISPLAY* display, char* text);
	[CLink] public static extern bool al_clipboard_has_text(ALLEGRO_DISPLAY* display);
}