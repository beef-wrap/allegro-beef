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
	/*
	*  Public android-related API
	*/
	[CLink] public static extern void al_android_set_apk_file_interface();
	[CLink] public static extern char* al_android_get_os_version();
	[CLink] public static extern void al_android_set_apk_fs_interface();

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	public struct JNIEnv;
	public struct jobject;
	[CLink] public static extern JNIEnv *al_android_get_jni_env();
	[CLink] public static extern jobject al_android_get_activity();
	[CLink] public static extern c_int al_android_open_fd(char* uri, char* mode);
#endif

	/* XXX decide if this should be public */
	[CLink] public static extern void _al_android_set_capture_volume_keys(ALLEGRO_DISPLAY* display, bool onoff);
}