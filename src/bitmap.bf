using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct ALLEGRO_BITMAP;

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	public enum ALLEGRO_BITMAP_WRAP : c_int
	{
		ALLEGRO_BITMAP_WRAP_DEFAULT = 0,
		ALLEGRO_BITMAP_WRAP_REPEAT = 1,
		ALLEGRO_BITMAP_WRAP_CLAMP = 2,
		ALLEGRO_BITMAP_WRAP_MIRROR = 3,
	}
#endif

	public enum ALLEGRO_BITMAP_FLAGS : c_int
	{
		ALLEGRO_MEMORY_BITMAP            = 0x0001,
		_ALLEGRO_KEEP_BITMAP_FORMAT      = 0x0002, /* now a bitmap loader flag */
		ALLEGRO_FORCE_LOCKING            = 0x0004, /* no longer honoured */
		ALLEGRO_NO_PRESERVE_TEXTURE      = 0x0008,
		_ALLEGRO_ALPHA_TEST              = 0x0010, /* now a render state flag */
		_ALLEGRO_INTERNAL_OPENGL         = 0x0020,
		ALLEGRO_MIN_LINEAR               = 0x0040,
		ALLEGRO_MAG_LINEAR               = 0x0080,
		ALLEGRO_MIPMAP                   = 0x0100,
		_ALLEGRO_NO_PREMULTIPLIED_ALPHA  = 0x0200, /* now a bitmap loader flag */
		ALLEGRO_VIDEO_BITMAP             = 0x0400,
		ALLEGRO_CONVERT_BITMAP           = 0x1000
	}

	[CLink] public static extern void al_set_new_bitmap_format(c_int format);
	[CLink] public static extern void al_set_new_bitmap_flags(c_int flags);
	[CLink] public static extern c_int al_get_new_bitmap_format();
	[CLink] public static extern c_int al_get_new_bitmap_flags();
	[CLink] public static extern void al_add_new_bitmap_flag(c_int flag);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	[CLink] public static extern c_int al_get_new_bitmap_depth ();
	[CLink] public static extern void al_set_new_bitmap_depth (c_int depth);
	[CLink] public static extern c_int al_get_new_bitmap_samples ();
	[CLink] public static extern void al_set_new_bitmap_samples (c_int samples);
	[CLink] public static extern void al_get_new_bitmap_wrap (ALLEGRO_BITMAP_WRAP *u, ALLEGRO_BITMAP_WRAP *v);
	[CLink] public static extern void al_set_new_bitmap_wrap (ALLEGRO_BITMAP_WRAP u, ALLEGRO_BITMAP_WRAP v);
#endif

	[CLink] public static extern c_int al_get_bitmap_width(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern c_int al_get_bitmap_height(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern c_int al_get_bitmap_format(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern c_int al_get_bitmap_flags(ALLEGRO_BITMAP* bitmap);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	 [CLink] public static extern c_int al_get_bitmap_depth (ALLEGRO_BITMAP *bitmap);
	 [CLink] public static extern c_int al_get_bitmap_samples (ALLEGRO_BITMAP *bitmap);
#endif

	[CLink] public static extern ALLEGRO_BITMAP* al_create_bitmap(c_int w, c_int h);
	[CLink] public static extern void al_destroy_bitmap(ALLEGRO_BITMAP* bitmap);

	[CLink] public static extern void al_put_pixel(c_int x, c_int y, ALLEGRO_COLOR color);
	[CLink] public static extern void al_put_blended_pixel(c_int x, c_int y, ALLEGRO_COLOR color);
	[CLink] public static extern ALLEGRO_COLOR al_get_pixel(ALLEGRO_BITMAP* bitmap, c_int x, c_int y);

	/* Masking */
	[CLink] public static extern void al_convert_mask_to_alpha(ALLEGRO_BITMAP* bitmap, ALLEGRO_COLOR mask_color);

	 /* Blending */
#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	 [CLink] public static extern ALLEGRO_COLOR al_get_bitmap_blend_color ();
	 [CLink] public static extern void al_get_bitmap_blender (c_int *op, c_int *src, c_int *dst);
	 [CLink] public static extern void al_get_separate_bitmap_blender (c_int *op, c_int *src, c_int *dst, c_int *alpha_op, c_int *alpha_src, c_int *alpha_dst);
	 [CLink] public static extern void al_set_bitmap_blend_color (ALLEGRO_COLOR color);
	 [CLink] public static extern void al_set_bitmap_blender (c_int op, c_int src, c_int dst);
	 [CLink] public static extern void al_set_separate_bitmap_blender (c_int op, c_int src, c_int dst, c_int alpha_op, c_int alpha_src, c_int alpha_dst);
	 [CLink] public static extern void al_reset_bitmap_blender ();
#endif

	 /* Clipping */
	[CLink] public static extern void al_set_clipping_rectangle(c_int x, c_int y, c_int width, c_int height);
	[CLink] public static extern void al_reset_clipping_rectangle();
	[CLink] public static extern void al_get_clipping_rectangle(c_int* x, c_int* y, c_int* w, c_int* h);

	 /* Sub bitmaps */
	[CLink] public static extern ALLEGRO_BITMAP* al_create_sub_bitmap(ALLEGRO_BITMAP* parent, c_int x, c_int y, c_int w, c_int h);
	[CLink] public static extern bool al_is_sub_bitmap(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern ALLEGRO_BITMAP* al_get_parent_bitmap(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern c_int al_get_bitmap_x(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern c_int al_get_bitmap_y(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern void al_reparent_bitmap(ALLEGRO_BITMAP* bitmap, ALLEGRO_BITMAP* parent, c_int x, c_int y, c_int w, c_int h);

	 /* Miscellaneous */
	[CLink] public static extern ALLEGRO_BITMAP* al_clone_bitmap(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern void al_convert_bitmap(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern void al_convert_memory_bitmaps();

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_SRC
	 [CLink] public static extern void al_backup_dirty_bitmap (ALLEGRO_BITMAP *bitmap);
#endif
}