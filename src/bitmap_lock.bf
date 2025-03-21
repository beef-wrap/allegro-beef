using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public enum ALLEGRO_LOCK_FLAGS : c_int
	{
		ALLEGRO_LOCK_READWRITE  = 0,
		ALLEGRO_LOCK_READONLY   = 1,
		ALLEGRO_LOCK_WRITEONLY  = 2
	}

	[CRepr]
	public struct ALLEGRO_LOCKED_REGION
	{
		void* data;
		c_int format;
		c_int pitch;
		c_int pixel_size;
	}

	[CLink] public static extern ALLEGRO_LOCKED_REGION* al_lock_bitmap(ALLEGRO_BITMAP* bitmap, c_int format, c_int flags);
	[CLink] public static extern ALLEGRO_LOCKED_REGION* al_lock_bitmap_region(ALLEGRO_BITMAP* bitmap, c_int x, c_int y, c_int width, c_int height, c_int format, c_int flags);
	[CLink] public static extern ALLEGRO_LOCKED_REGION* al_lock_bitmap_blocked(ALLEGRO_BITMAP* bitmap, c_int flags);
	[CLink] public static extern ALLEGRO_LOCKED_REGION* al_lock_bitmap_region_blocked(ALLEGRO_BITMAP* bitmap, c_int x_block, c_int y_block, c_int width_block, c_int height_block, c_int flags);
	[CLink] public static extern void al_unlock_bitmap(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern bool al_is_bitmap_locked(ALLEGRO_BITMAP* bitmap);
}