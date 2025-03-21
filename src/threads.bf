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
 *      Thread routines.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct ALLEGRO_THREAD;
	public struct ALLEGRO_MUTEX;
	public struct ALLEGRO_COND;

	[CLink] public static extern ALLEGRO_THREAD* al_create_thread(function void*(ALLEGRO_THREAD* thread, void* arg) proc, void* arg);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	[CLink] public static extern ALLEGRO_THREAD* al_create_thread_with_stacksize(function void*(ALLEGRO_THREAD* thread, void* arg) proc, void* arg, size_t stacksize);
#endif

	[CLink] public static extern void al_start_thread(ALLEGRO_THREAD* outer);
	[CLink] public static extern void al_join_thread(ALLEGRO_THREAD* outer, void** ret_value);
	[CLink] public static extern void al_set_thread_should_stop(ALLEGRO_THREAD* outer);
	[CLink] public static extern bool al_get_thread_should_stop(ALLEGRO_THREAD* outer);
	[CLink] public static extern void al_destroy_thread(ALLEGRO_THREAD* thread);
	[CLink] public static extern void al_run_detached_thread(function void*(void* arg) proc, void* arg);

	[CLink] public static extern ALLEGRO_MUTEX* al_create_mutex();
	[CLink] public static extern ALLEGRO_MUTEX* al_create_mutex_recursive();
	[CLink] public static extern void al_lock_mutex(ALLEGRO_MUTEX* mutex);
	[CLink] public static extern void al_unlock_mutex(ALLEGRO_MUTEX* mutex);
	[CLink] public static extern void al_destroy_mutex(ALLEGRO_MUTEX* mutex);

	[CLink] public static extern ALLEGRO_COND* al_create_cond();
	[CLink] public static extern void al_destroy_cond(ALLEGRO_COND* cond);
	[CLink] public static extern void al_wait_cond(ALLEGRO_COND* cond, ALLEGRO_MUTEX* mutex);
	[CLink] public static extern c_int al_wait_cond_until(ALLEGRO_COND* cond, ALLEGRO_MUTEX* mutex, ALLEGRO_TIMEOUT* timeout);
	[CLink] public static extern void al_broadcast_cond(ALLEGRO_COND* cond);
	[CLink] public static extern void al_signal_cond(ALLEGRO_COND* cond);
}