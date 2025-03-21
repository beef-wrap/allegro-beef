using System;
using System.Interop;

namespace allegro;

extension allegro
{
	/* Flags for the blitting functions */
	public enum ALLEGRO_BITMAP_DRAW_FLAGS : c_int
	{
		ALLEGRO_FLIP_HORIZONTAL = 0x00001,
		ALLEGRO_FLIP_VERTICAL   = 0x00002
	}

	/* Blitting */
	[CLink] public static extern void al_draw_bitmap(ALLEGRO_BITMAP* bitmap, float dx, float dy, c_int flags);
	[CLink] public static extern void al_draw_bitmap_region(ALLEGRO_BITMAP* bitmap, float sx, float sy, float sw, float sh, float dx, float dy, c_int flags);
	[CLink] public static extern void al_draw_scaled_bitmap(ALLEGRO_BITMAP* bitmap, float sx, float sy, float sw, float sh, float dx, float dy, float dw, float dh, c_int flags);
	[CLink] public static extern void al_draw_rotated_bitmap(ALLEGRO_BITMAP* bitmap, float cx, float cy, float dx, float dy, float angle, c_int flags);
	[CLink] public static extern void al_draw_scaled_rotated_bitmap(ALLEGRO_BITMAP* bitmap, float cx, float cy, float dx, float dy, float xscale, float yscale, float angle, c_int flags);

	/* Tinted blitting */
	[CLink] public static extern void al_draw_tinted_bitmap(ALLEGRO_BITMAP* bitmap, ALLEGRO_COLOR tint, float dx, float dy, c_int flags);
	[CLink] public static extern void al_draw_tinted_bitmap_region(ALLEGRO_BITMAP* bitmap, ALLEGRO_COLOR tint, float sx, float sy, float sw, float sh, float dx, float dy, c_int flags);
	[CLink] public static extern void al_draw_tinted_scaled_bitmap(ALLEGRO_BITMAP* bitmap, ALLEGRO_COLOR tint, float sx, float sy, float sw, float sh, float dx, float dy, float dw, float dh, c_int flags);
	[CLink] public static extern void al_draw_tinted_rotated_bitmap(ALLEGRO_BITMAP* bitmap, ALLEGRO_COLOR tint, float cx, float cy, float dx, float dy, float angle, c_int flags);
	[CLink] public static extern void al_draw_tinted_scaled_rotated_bitmap(ALLEGRO_BITMAP* bitmap, ALLEGRO_COLOR tint, float cx, float cy, float dx, float dy, float xscale, float yscale, float angle, c_int flags);
	[CLink] public static extern void al_draw_tinted_scaled_rotated_bitmap_region(ALLEGRO_BITMAP* bitmap, float sx, float sy, float sw, float sh, ALLEGRO_COLOR tint, float cx, float cy, float dx, float dy, float xscale, float yscale, float angle, c_int flags);
}