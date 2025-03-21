using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CRepr]
	public struct ALLEGRO_DISPLAY_MODE
	{
		c_int width;
		c_int height;
		c_int format;
		c_int refresh_rate;
	}

	[CLink] public static extern c_int al_get_num_display_modes();
	[CLink] public static extern ALLEGRO_DISPLAY_MODE* al_get_display_mode(c_int index, ALLEGRO_DISPLAY_MODE* mode);
}