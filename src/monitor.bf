using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CRepr]
	public struct ALLEGRO_MONITOR_INFO
	{
		c_int x1;
		c_int y1;
		c_int x2;
		c_int y2;
	}

	public const c_int ALLEGRO_DEFAULT_DISPLAY_ADAPTER = -1;

	[CLink] public static extern c_int al_get_num_video_adapters();
	[CLink] public static extern bool al_get_monitor_info(c_int adapter, ALLEGRO_MONITOR_INFO* info);
	[CLink] public static extern c_int al_get_monitor_dpi(c_int adapter);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	 [CLink] public static extern c_int al_get_monitor_refresh_rate (c_int adapter);
#endif
}