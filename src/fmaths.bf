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
 *      Fixed point math routines.
 *
 *      By Shawn Hargreaves.
 *
 *      See readme.txt for copyright information.
 */
using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CLink] public static extern al_fixed al_fixsqrt(al_fixed x);
	[CLink] public static extern al_fixed al_fixhypot(al_fixed x, al_fixed y);
	[CLink] public static extern al_fixed al_fixatan(al_fixed x);
	[CLink] public static extern al_fixed al_fixatan2(al_fixed y, al_fixed x);

	/*AL_ARRAY(al_fixed, _al_fix_cos_tbl);
	AL_ARRAY(al_fixed, _al_fix_tan_tbl);
	AL_ARRAY(al_fixed, _al_fix_acos_tbl);*/
}