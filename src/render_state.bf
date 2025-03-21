using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public enum ALLEGRO_RENDER_STATE : c_int
	{
	   /* ALLEGRO_ALPHA_TEST was the name of a rare bitmap flag only used on the
		* Wiz port.  Reuse the name but retain the same value.
		*/
		ALLEGRO_ALPHA_TEST = 0x0010,
		ALLEGRO_WRITE_MASK,
		ALLEGRO_DEPTH_TEST,
		ALLEGRO_DEPTH_FUNCTION,
		ALLEGRO_ALPHA_FUNCTION,
		ALLEGRO_ALPHA_TEST_VALUE
	}

	public enum ALLEGRO_RENDER_FUNCTION : c_int
	{
		ALLEGRO_RENDER_NEVER,
		ALLEGRO_RENDER_ALWAYS,
		ALLEGRO_RENDER_LESS,
		ALLEGRO_RENDER_EQUAL,
		ALLEGRO_RENDER_LESS_EQUAL,
		ALLEGRO_RENDER_GREATER,
		ALLEGRO_RENDER_NOT_EQUAL,
		ALLEGRO_RENDER_GREATER_EQUAL
	}

	public enum ALLEGRO_WRITE_MASK_FLAGS : c_int
	{
		ALLEGRO_MASK_RED = 1 << 0,
		ALLEGRO_MASK_GREEN = 1 << 1,
		ALLEGRO_MASK_BLUE = 1 << 2,
		ALLEGRO_MASK_ALPHA = 1 << 3,
		ALLEGRO_MASK_DEPTH = 1 << 4,
		ALLEGRO_MASK_RGB = (ALLEGRO_MASK_RED | ALLEGRO_MASK_GREEN | ALLEGRO_MASK_BLUE),
		ALLEGRO_MASK_RGBA = (ALLEGRO_MASK_RGB | ALLEGRO_MASK_ALPHA)
	}

	[CLink] public static extern c_int al_get_render_state(ALLEGRO_RENDER_STATE state);
	[CLink] public static extern void al_set_render_state(ALLEGRO_RENDER_STATE state, c_int value);
}