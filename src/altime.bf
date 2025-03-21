using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CRepr]
	public struct ALLEGRO_TIMEOUT
	{
		uint64_t __pad1__;
		uint64_t __pad2__;
	}

	[CLink] public static extern double al_get_time();
	[CLink] public static extern void al_rest(double seconds);
	[CLink] public static extern void al_init_timeout(ALLEGRO_TIMEOUT* timeout, double seconds);
}