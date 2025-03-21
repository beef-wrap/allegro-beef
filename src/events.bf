using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public enum ALLEGRO_EVENT_TYPE : c_int
	{
		ALLEGRO_EVENT_JOYSTICK_AXIS               =  1,
		ALLEGRO_EVENT_JOYSTICK_BUTTON_DOWN        =  2,
		ALLEGRO_EVENT_JOYSTICK_BUTTON_UP          =  3,
		ALLEGRO_EVENT_JOYSTICK_CONFIGURATION      =  4,

		ALLEGRO_EVENT_KEY_DOWN                    = 10,
		ALLEGRO_EVENT_KEY_CHAR                    = 11,
		ALLEGRO_EVENT_KEY_UP                      = 12,

		ALLEGRO_EVENT_MOUSE_AXES                  = 20,
		ALLEGRO_EVENT_MOUSE_BUTTON_DOWN           = 21,
		ALLEGRO_EVENT_MOUSE_BUTTON_UP             = 22,
		ALLEGRO_EVENT_MOUSE_ENTER_DISPLAY         = 23,
		ALLEGRO_EVENT_MOUSE_LEAVE_DISPLAY         = 24,
		ALLEGRO_EVENT_MOUSE_WARPED                = 25,

		ALLEGRO_EVENT_TIMER                       = 30,

		ALLEGRO_EVENT_DISPLAY_EXPOSE              = 40,
		ALLEGRO_EVENT_DISPLAY_RESIZE              = 41,
		ALLEGRO_EVENT_DISPLAY_CLOSE               = 42,
		ALLEGRO_EVENT_DISPLAY_LOST                = 43,
		ALLEGRO_EVENT_DISPLAY_FOUND               = 44,
		ALLEGRO_EVENT_DISPLAY_SWITCH_IN           = 45,
		ALLEGRO_EVENT_DISPLAY_SWITCH_OUT          = 46,
		ALLEGRO_EVENT_DISPLAY_ORIENTATION         = 47,
		ALLEGRO_EVENT_DISPLAY_HALT_DRAWING        = 48,
		ALLEGRO_EVENT_DISPLAY_RESUME_DRAWING      = 49,

		ALLEGRO_EVENT_TOUCH_BEGIN                 = 50,
		ALLEGRO_EVENT_TOUCH_END                   = 51,
		ALLEGRO_EVENT_TOUCH_MOVE                  = 52,
		ALLEGRO_EVENT_TOUCH_CANCEL                = 53,

		ALLEGRO_EVENT_DISPLAY_CONNECTED           = 60,
		ALLEGRO_EVENT_DISPLAY_DISCONNECTED        = 61,

		ALLEGRO_EVENT_DROP                        = 62,
	}

	/* Function: ALLEGRO_EVENT_TYPE_IS_USER
	*
	*    1 <= n < 512  - builtin events
	*  512 <= n < 1024 - reserved user events (for addons)
	* 1024 <= n        - unreserved user events
	*/
	static mixin ALLEGRO_EVENT_TYPE_IS_USER(c_uint t) { t >= 512 }

	/* Function: ALLEGRO_GET_EVENT_TYPE
	*/
	//#define ALLEGRO_GET_EVENT_TYPE(a, b, c, d)   AL_ID(a, b, c, d)

	[CRepr]
	public struct ALLEGRO_EVENT_SOURCE
	{
		c_int[32] __pad;
	}

	/*
	* Event structures
	*
	* All event types have the following fields in common.
	*
	*  type      -- the type of event this is
	*  timestamp -- when this event was generated
	*  source    -- which event source generated this event
	*
	* For people writing event sources: The common fields must be at the
	* very start of each event structure, i.e. put _AL_EVENT_HEADER at the
	* front.
	*/
	[CRepr]
	public struct ALLEGRO_ANY_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_EVENT_SOURCE* source;
		public double timestamp;
	}

	[CRepr]
	public struct ALLEGRO_DISPLAY_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_DISPLAY* source;
		public double timestamp;
		public c_int x, y;
		public c_int width, height;
		public c_int orientation;
	}

	[CRepr]
	public struct ALLEGRO_JOYSTICK_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_JOYSTICK* source;
		public double timestamp;
		public ALLEGRO_JOYSTICK* id;
		public c_int stick;
		public c_int axis;
		public float pos;
		public c_int button;
	}

	[CRepr]
	public struct ALLEGRO_KEYBOARD_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_KEYBOARD* source;
		public double timestamp;
		public ALLEGRO_DISPLAY* display; /* the window the key was pressed in */
		public c_int keycode; /* the physical key pressed */
		public c_int unichar; /* unicode character or negative */
		public c_uint modifiers; /* bitfield */
		public bool repeat_; /* auto-repeated or not */
	}

	[CRepr]
	public struct ALLEGRO_MOUSE_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_MOUSE* source;
		public double timestamp;
		public ALLEGRO_DISPLAY* display;

		/* (display) Window the event originate from
		 * (x, y) Primary mouse position
		 * (z) Mouse wheel position (1D 'wheel'), or,
		 * (w, z) Mouse wheel position (2D 'ball')
		 * (pressure) The pressure applied, for stylus (0 or 1 for normal mouse)
		 */
		public c_int x,  y,  z, w;
		public c_int dx, dy, dz, dw;
		public c_uint button;
		public float pressure;
	}

	[CRepr]
	public struct ALLEGRO_TIMER_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_TIMER* source;
		public double timestamp;
		public int64_t count;
		public double error;
	}

	[CRepr]
	public struct ALLEGRO_TOUCH_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_TOUCH_INPUT* source;
		public double timestamp;
		public ALLEGRO_DISPLAY* display;
		/* (id) Identifier of the event, always positive number.
		 * (x, y) Touch position on the screen in 1:1 resolution.
		 * (dx, dy) Relative touch position.
		 * (primary) True, if touch is a primary one (usually first one).
		 */
		public c_int id;
		public float x, y;
		public float dx, dy;
		public bool primary;
	}

	public struct ALLEGRO_USER_EVENT_DESCRIPTOR;

	[CRepr]
	public struct ALLEGRO_USER_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_EVENT_SOURCE* source;
		public double timestamp;
		public ALLEGRO_USER_EVENT_DESCRIPTOR* __internal__descr;
		public intptr_t data1;
		public intptr_t data2;
		public intptr_t data3;
		public intptr_t data4;
	}

	[CRepr]
	public struct ALLEGRO_DROP_EVENT
	{
		public ALLEGRO_EVENT_TYPE type;
		public ALLEGRO_DISPLAY* source;
		public double timestamp;
		public c_int x, y;
		public c_int row;
		public bool is_file;
		public char* text;
		public bool is_complete;
	}

	[CRepr, Union]
	public struct ALLEGRO_EVENT
	{
	   /* This must be the same as the first field of _AL_EVENT_HEADER.  */
		public ALLEGRO_EVENT_TYPE type;
	   /* `any' is to allow the user to access the other fields which are
		* common to all event types, without using some specific type
		* structure.
		*/
		public ALLEGRO_ANY_EVENT      any;
		public ALLEGRO_DISPLAY_EVENT  display;
		public ALLEGRO_JOYSTICK_EVENT joystick;
		public ALLEGRO_KEYBOARD_EVENT keyboard;
		public ALLEGRO_MOUSE_EVENT    mouse;
		public ALLEGRO_TIMER_EVENT    timer;
		public ALLEGRO_TOUCH_EVENT    touch;
		public ALLEGRO_USER_EVENT     user;
		public ALLEGRO_DROP_EVENT     drop;
	}

	/* Event sources */

	[CLink] public static extern void al_init_user_event_source(ALLEGRO_EVENT_SOURCE*);
	[CLink] public static extern void al_destroy_user_event_source(ALLEGRO_EVENT_SOURCE*);
	/* The second argument is ALLEGRO_EVENT instead of ALLEGRO_USER_EVENT
	* to prevent users passing a pointer to a too-short structure.
	*/
	[CLink] public static extern bool al_emit_user_event(ALLEGRO_EVENT_SOURCE*, ALLEGRO_EVENT*, function void(ALLEGRO_USER_EVENT*) dtor);
	[CLink] public static extern void al_unref_user_event(ALLEGRO_USER_EVENT*);
	[CLink] public static extern void al_set_event_source_data(ALLEGRO_EVENT_SOURCE*, intptr_t data);
	[CLink] public static extern intptr_t al_get_event_source_data(ALLEGRO_EVENT_SOURCE*);

	/* Event queues */

	[CRepr]
	public struct ALLEGRO_EVENT_QUEUE;

	[CLink] public static extern ALLEGRO_EVENT_QUEUE* al_create_event_queue();
	[CLink] public static extern void al_destroy_event_queue(ALLEGRO_EVENT_QUEUE*);
	[CLink] public static extern bool al_is_event_source_registered(ALLEGRO_EVENT_QUEUE*, ALLEGRO_EVENT_SOURCE*);
	[CLink] public static extern void al_register_event_source(ALLEGRO_EVENT_QUEUE*, ALLEGRO_EVENT_SOURCE*);
	[CLink] public static extern void al_unregister_event_source(ALLEGRO_EVENT_QUEUE*, ALLEGRO_EVENT_SOURCE*);
	[CLink] public static extern void al_pause_event_queue(ALLEGRO_EVENT_QUEUE*, bool);
	[CLink] public static extern bool al_is_event_queue_paused(ALLEGRO_EVENT_QUEUE*);
	[CLink] public static extern bool al_is_event_queue_empty(ALLEGRO_EVENT_QUEUE*);
	[CLink] public static extern bool al_get_next_event(ALLEGRO_EVENT_QUEUE*, ALLEGRO_EVENT* ret_event);
	[CLink] public static extern bool al_peek_next_event(ALLEGRO_EVENT_QUEUE*, ALLEGRO_EVENT* ret_event);
	[CLink] public static extern bool al_drop_next_event(ALLEGRO_EVENT_QUEUE*);
	[CLink] public static extern void al_flush_event_queue(ALLEGRO_EVENT_QUEUE*);
	[CLink] public static extern void al_wait_for_event(ALLEGRO_EVENT_QUEUE*, ALLEGRO_EVENT* ret_event);
	[CLink] public static extern bool al_wait_for_event_timed(ALLEGRO_EVENT_QUEUE*, ALLEGRO_EVENT* ret_event, float secs);
	[CLink] public static extern bool al_wait_for_event_until(ALLEGRO_EVENT_QUEUE* queue, ALLEGRO_EVENT* ret_event, ALLEGRO_TIMEOUT* timeout);
}