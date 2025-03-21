using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CLink] public static extern bool al_init_image_addon();
	[CLink] public static extern bool al_is_image_addon_initialized();
	[CLink] public static extern void al_shutdown_image_addon();
	[CLink] public static extern uint32_t al_get_allegro_image_version();
}