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
 *      Base header, defines basic stuff needed by pretty much
 *      everything else.
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
	public const c_int ALLEGRO_VERSION          = 5;
	public const c_int ALLEGRO_SUB_VERSION      = 2;
	public const c_int ALLEGRO_WIP_VERSION      = 11;

#if ALLEGRO_UNSTABLE
	/* 1 << 31 represented as a signed c_int to match the arg type of
	* al_install_system.
	*/
	public const c_int ALLEGRO_UNSTABLE_BIT = _ALLEGRO_UNSTABLE_BIT_SET;
#else
	public const c_int ALLEGRO_UNSTABLE_BIT  = 0;
#endif

	/* Not sure we need it, but since ALLEGRO_VERSION_STR contains it:
	* 0 = GIT
	* 1 = first release
	* 2... = hotfixes?
	*
	* Note x.y.z (= x.y.z.0) has release number 1, and x.y.z.1 has release
	* number 2, just to confuse you.
	*/
	public const c_int ALLEGRO_RELEASE_NUMBER   = 0;

	public const c_char* ALLEGRO_VERSION_STR      	= "5.2.11 (GIT)";
	public const c_char* ALLEGRO_DATE_STR         	= "2024";
	public const c_int ALLEGRO_DATE             	= 20241126; /* yyyymmdd */
	public const c_int ALLEGRO_VERSION_INT 			= ((ALLEGRO_VERSION << 24) | (ALLEGRO_SUB_VERSION << 16) | (ALLEGRO_WIP_VERSION << 8) | ALLEGRO_RELEASE_NUMBER | ALLEGRO_UNSTABLE_BIT);

	[CLink] public static extern uint32_t al_get_allegro_version();
	[CLink] public static extern c_int al_run_main(c_int argc, char** argv, function c_int(c_int, char**));

	/*******************************************/
	/************ Some global stuff ************/
	/*******************************************/

	public const float ALLEGRO_PI        = 3.14159265358979323846f;

	// #define AL_ID(a,b,c,d)     (((a)<<24) | ((b)<<16) | ((c)<<8) | (d))
}