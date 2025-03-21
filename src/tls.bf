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
 *      Thread local storage routines.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	/* Enum: ALLEGRO_STATE_FLAGS
	 */
	public enum ALLEGRO_STATE_FLAGS : c_int
	{
		ALLEGRO_STATE_NEW_DISPLAY_PARAMETERS = 0x0001,
		ALLEGRO_STATE_NEW_BITMAP_PARAMETERS  = 0x0002,
		ALLEGRO_STATE_DISPLAY                = 0x0004,
		ALLEGRO_STATE_TARGET_BITMAP          = 0x0008,
		ALLEGRO_STATE_BLENDER                = 0x0010,
		ALLEGRO_STATE_NEW_FILE_INTERFACE     = 0x0020,
		ALLEGRO_STATE_TRANSFORM              = 0x0040,
		ALLEGRO_STATE_PROJECTION_TRANSFORM   = 0x0100,

		ALLEGRO_STATE_BITMAP                 = ALLEGRO_STATE_TARGET_BITMAP + ALLEGRO_STATE_NEW_BITMAP_PARAMETERS,

		ALLEGRO_STATE_ALL                    = 0xffff

	}

	[CRepr]
	struct ALLEGRO_STATE
	{
	   /* Internally, a thread_local_state structure is placed here. */
		char[1024] _tls;
	}


	[CLink] public static extern void al_store_state(ALLEGRO_STATE* state, c_int flags);
	[CLink] public static extern void al_restore_state(ALLEGRO_STATE* state);
}