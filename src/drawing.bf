using System;
using System.Interop;

namespace allegro;

extension allegro
{
	/* Drawing primitives */
	[CLink] public static extern void al_clear_to_color(ALLEGRO_COLOR color);
	[CLink] public static extern void al_clear_depth_buffer(float x);
	[CLink] public static extern void al_draw_pixel(float x, float y, ALLEGRO_COLOR color);
}