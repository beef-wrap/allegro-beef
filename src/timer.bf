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
 *      Timer routines.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{

	/* Function: ALLEGRO_USECS_TO_SECS
	*/
	static mixin ALLEGRO_USECS_TO_SECS(float x) { (x) / 1000000.0 }

	/* Function: ALLEGRO_MSECS_TO_SECS
	*/
	static mixin ALLEGRO_MSECS_TO_SECS(float x) { (x) / 1000.0 }

	/* Function: ALLEGRO_BPS_TO_SECS
	*/
	static mixin ALLEGRO_BPS_TO_SECS(float x) {  (1.0 / (x)) }

	/* Function: ALLEGRO_BPM_TO_SECS
	*/
	static mixin ALLEGRO_BPM_TO_SECS(float x) {  (60.0 / (x)) }

	public struct ALLEGRO_TIMER;

	[CLink] public static extern ALLEGRO_TIMER* al_create_timer(double speed_secs);
	[CLink] public static extern void al_destroy_timer(ALLEGRO_TIMER* timer);
	[CLink] public static extern void al_start_timer(ALLEGRO_TIMER* timer);
	[CLink] public static extern void al_stop_timer(ALLEGRO_TIMER* timer);
	[CLink] public static extern void al_resume_timer(ALLEGRO_TIMER* timer);
	[CLink] public static extern bool al_get_timer_started(ALLEGRO_TIMER* timer);
	[CLink] public static extern double al_get_timer_speed(ALLEGRO_TIMER* timer);
	[CLink] public static extern void al_set_timer_speed(ALLEGRO_TIMER* timer, double speed_secs);
	[CLink] public static extern int64_t al_get_timer_count(ALLEGRO_TIMER* timer);
	[CLink] public static extern void al_set_timer_count(ALLEGRO_TIMER* timer, int64_t count);
	[CLink] public static extern void al_add_timer_count(ALLEGRO_TIMER* timer, int64_t diff);
	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_timer_event_source(ALLEGRO_TIMER* timer);
}