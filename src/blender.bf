using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public enum ALLEGRO_BLEND_MODE : c_int
	{
		ALLEGRO_ZERO                = 0,
		ALLEGRO_ONE                 = 1,
		ALLEGRO_ALPHA               = 2,
		ALLEGRO_INVERSE_ALPHA       = 3,
		ALLEGRO_SRC_COLOR           = 4,
		ALLEGRO_DEST_COLOR          = 5,
		ALLEGRO_INVERSE_SRC_COLOR   = 6,
		ALLEGRO_INVERSE_DEST_COLOR  = 7,
		ALLEGRO_CONST_COLOR         = 8,
		ALLEGRO_INVERSE_CONST_COLOR = 9,
		ALLEGRO_NUM_BLEND_MODES
	}

	public enum ALLEGRO_BLEND_OPERATIONS : c_int
	{
		ALLEGRO_ADD                = 0,
		ALLEGRO_SRC_MINUS_DEST     = 1,
		ALLEGRO_DEST_MINUS_SRC     = 2,
		ALLEGRO_NUM_BLEND_OPERATIONS
	}

	[CLink] public static extern void al_set_blender(c_int op, c_int source, c_int dest);
	[CLink] public static extern void al_set_blend_color(ALLEGRO_COLOR color);
	[CLink] public static extern void al_get_blender(c_int* op, c_int* source, c_int* dest);
	[CLink] public static extern ALLEGRO_COLOR al_get_blend_color();
	[CLink] public static extern void al_set_separate_blender(c_int op, c_int source, c_int dest, c_int alpha_op, c_int alpha_source, c_int alpha_dest);
	[CLink] public static extern void al_get_separate_blender(c_int* op, c_int* source, c_int* dest, c_int* alpha_op, c_int* alpha_src, c_int* alpha_dest);
}