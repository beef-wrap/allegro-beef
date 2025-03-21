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

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct UIWindow;
	public struct UIView;

	[CLink] public static extern UIWindow* al_iphone_get_window(ALLEGRO_DISPLAY* d);
	[CLink] public static extern UIView* al_iphone_get_view(ALLEGRO_DISPLAY* d);
}