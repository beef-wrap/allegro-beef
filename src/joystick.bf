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
 *      Joystick routines.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	/* internal values */
	public const c_int _AL_MAX_JOYSTICK_AXES      = 5;
	public const c_int _AL_MAX_JOYSTICK_STICKS    = 16;
#if ALLEGRO_ANDROID
	public const c_int _AL_MAX_JOYSTICK_BUTTONS   = 36;
#else
	public const c_int _AL_MAX_JOYSTICK_BUTTONS   = 32;
#endif

	public struct ALLEGRO_JOYSTICK;

	[CRepr]
	public struct ALLEGRO_JOYSTICK_STATE
	{
		struct
		{
			float axis; /* -1.0 to 1.0 */
		} stick;
		c_int button; /* 0 to 32767 */
	}

	public enum ALLEGRO_JOYFLAGS : c_int
	{
		ALLEGRO_JOYFLAG_DIGITAL  = 0x01,
		ALLEGRO_JOYFLAG_ANALOGUE = 0x02
	}

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	public enum ALLEGRO_GAMEPAD_BUTTON : c_int
	{
		ALLEGRO_GAMEPAD_BUTTON_A,
		ALLEGRO_GAMEPAD_BUTTON_B,
		ALLEGRO_GAMEPAD_BUTTON_X,
		ALLEGRO_GAMEPAD_BUTTON_Y,
		ALLEGRO_GAMEPAD_BUTTON_LEFT_SHOULDER,
		ALLEGRO_GAMEPAD_BUTTON_RIGHT_SHOULDER,
		ALLEGRO_GAMEPAD_BUTTON_BACK,
		ALLEGRO_GAMEPAD_BUTTON_START,
		ALLEGRO_GAMEPAD_BUTTON_GUIDE,
		ALLEGRO_GAMEPAD_BUTTON_LEFT_THUMB,
		ALLEGRO_GAMEPAD_BUTTON_RIGHT_THUMB,
	}

	public enum ALLEGRO_GAMEPAD_STICK : c_int
	{
		ALLEGRO_GAMEPAD_STICK_DPAD,
		ALLEGRO_GAMEPAD_STICK_LEFT_THUMB,
		ALLEGRO_GAMEPAD_STICK_RIGHT_THUMB,
		ALLEGRO_GAMEPAD_STICK_LEFT_TRIGGER,
		ALLEGRO_GAMEPAD_STICK_RIGHT_TRIGGER,
	}

	public enum ALLEGRO_JOYSTICK_TYPE : c_int
	{
		ALLEGRO_JOYSTICK_TYPE_UNKNOWN,
		ALLEGRO_JOYSTICK_TYPE_GAMEPAD,
	}

	[CRepr]
	public struct ALLEGRO_JOYSTICK_GUID
	{
		uint8_t[16] val;
	}
#endif

	[CLink] public static extern bool al_install_joystick();
	[CLink] public static extern void al_uninstall_joystick();
	[CLink] public static extern bool al_is_joystick_installed();
	[CLink] public static extern bool al_reconfigure_joysticks();

	[CLink] public static extern c_int al_get_num_joysticks();
	[CLink] public static extern ALLEGRO_JOYSTICK* al_get_joystick(c_int joyn);
	[CLink] public static extern void al_release_joystick(ALLEGRO_JOYSTICK*);
	[CLink] public static extern bool al_get_joystick_active(ALLEGRO_JOYSTICK*);
	[CLink] public static extern char* al_get_joystick_name(ALLEGRO_JOYSTICK*);

	[CLink] public static extern c_int al_get_joystick_num_sticks(ALLEGRO_JOYSTICK*);
	[CLink] public static extern c_int al_get_joystick_stick_flags(ALLEGRO_JOYSTICK*, c_int stick); /* junk? */
	[CLink] public static extern char* al_get_joystick_stick_name(ALLEGRO_JOYSTICK*, c_int stick);

	[CLink] public static extern c_int al_get_joystick_num_axes(ALLEGRO_JOYSTICK*, c_int stick);
	[CLink] public static extern char* al_get_joystick_axis_name(ALLEGRO_JOYSTICK*, c_int stick, c_int axis);

	[CLink] public static extern c_int al_get_joystick_num_buttons(ALLEGRO_JOYSTICK*);
	[CLink] public static extern char* al_get_joystick_button_name(ALLEGRO_JOYSTICK*, c_int buttonn);

	[CLink] public static extern void al_get_joystick_state(ALLEGRO_JOYSTICK*, ALLEGRO_JOYSTICK_STATE* ret_state);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	[CLink] public static extern ALLEGRO_JOYSTICK_GUID al_get_joystick_guid(ALLEGRO_JOYSTICK*);
	[CLink] public static extern ALLEGRO_JOYSTICK_TYPE al_get_joystick_type(ALLEGRO_JOYSTICK*);
	[CLink] public static extern bool al_set_joystick_mappings (char* filename);
	[CLink] public static extern bool al_set_joystick_mappings_f(ALLEGRO_FILE* file);
#endif

	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_joystick_event_source();
}