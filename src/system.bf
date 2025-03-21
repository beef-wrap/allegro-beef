using System;
using System.Interop;

namespace allegro;

static
{
	static mixin AL_ID(char8 a, char8 b, char8 c, char8 d)
	{
		(c_int)a << 24 | (c_int)(b) << 16 | ((c_int)(c) << 8) | (c_int)(d)
	}
}

extension allegro
{
	public struct ALLEGRO_SYSTEM;

	public enum ALLEGRO_SYSTEM_ID : c_int
	{
		ALLEGRO_SYSTEM_ID_UNKNOWN = 0,
		ALLEGRO_SYSTEM_ID_XGLX = AL_ID!('X', 'G', 'L', 'X'),
		ALLEGRO_SYSTEM_ID_WINDOWS = AL_ID!('W', 'I', 'N', 'D'),
		ALLEGRO_SYSTEM_ID_MACOSX = AL_ID!('O', 'S', 'X', ' '),
		ALLEGRO_SYSTEM_ID_ANDROID = AL_ID!('A', 'N', 'D', 'R'),
		ALLEGRO_SYSTEM_ID_IPHONE = AL_ID!('I', 'P', 'H', 'O'),
		ALLEGRO_SYSTEM_ID_GP2XWIZ = AL_ID!('W', 'I', 'Z', ' '),
		ALLEGRO_SYSTEM_ID_RASPBERRYPI = AL_ID!('R', 'A', 'S', 'P'),
		ALLEGRO_SYSTEM_ID_SDL = AL_ID!('S', 'D', 'L', '2')
	}

	//[CLink] public static extern void atexit();

	//public static mixin al_init() { al_install_system(ALLEGRO_VERSION_INT, atexit) }

	[CLink] public static extern bool al_install_system(c_int version, function c_int(function void()) atexit_ptr);
	[CLink] public static extern void al_uninstall_system();
	[CLink] public static extern bool al_is_system_installed();
	[CLink] public static extern ALLEGRO_SYSTEM* al_get_system_driver();
	[CLink] public static extern ALLEGRO_CONFIG* al_get_system_config();
	[CLink] public static extern ALLEGRO_SYSTEM_ID al_get_system_id();

	public enum ALLEGRO_PATH_TYPE : c_int
	{
		ALLEGRO_RESOURCES_PATH = 0,
		ALLEGRO_TEMP_PATH,
		ALLEGRO_USER_DATA_PATH,
		ALLEGRO_USER_HOME_PATH,
		ALLEGRO_USER_SETTINGS_PATH,
		ALLEGRO_USER_DOCUMENTS_PATH,
		ALLEGRO_EXENAME_PATH,
		ALLEGRO_LAST_PATH /* must be last */
	}

	[CLink] public static extern ALLEGRO_PATH* al_get_standard_path(c_int id);
	[CLink] public static extern void al_set_exe_name(char* path);

	[CLink] public static extern void al_set_org_name(char* org_name);
	[CLink] public static extern void al_set_app_name(char* app_name);
	[CLink] public static extern char* al_get_org_name();
	[CLink] public static extern char* al_get_app_name();

	[CLink] public static extern bool al_inhibit_screensaver(bool inhibit);
}