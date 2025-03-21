using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CRepr]
	public struct ALLEGRO_COLOR
	{
		public float r, g, b, a;
	}

	public enum ALLEGRO_PIXEL_FORMAT : c_int
	{
		ALLEGRO_PIXEL_FORMAT_ANY                   = 0,
		ALLEGRO_PIXEL_FORMAT_ANY_NO_ALPHA          = 1,
		ALLEGRO_PIXEL_FORMAT_ANY_WITH_ALPHA        = 2,
		ALLEGRO_PIXEL_FORMAT_ANY_15_NO_ALPHA       = 3,
		ALLEGRO_PIXEL_FORMAT_ANY_16_NO_ALPHA       = 4,
		ALLEGRO_PIXEL_FORMAT_ANY_16_WITH_ALPHA     = 5,
		ALLEGRO_PIXEL_FORMAT_ANY_24_NO_ALPHA       = 6,
		ALLEGRO_PIXEL_FORMAT_ANY_32_NO_ALPHA       = 7,
		ALLEGRO_PIXEL_FORMAT_ANY_32_WITH_ALPHA     = 8,
		ALLEGRO_PIXEL_FORMAT_ARGB_8888             = 9,
		ALLEGRO_PIXEL_FORMAT_RGBA_8888             = 10,
		ALLEGRO_PIXEL_FORMAT_ARGB_4444             = 11,
		ALLEGRO_PIXEL_FORMAT_RGB_888               = 12, /* 24 bit format */
		ALLEGRO_PIXEL_FORMAT_RGB_565               = 13,
		ALLEGRO_PIXEL_FORMAT_RGB_555               = 14,
		ALLEGRO_PIXEL_FORMAT_RGBA_5551             = 15,
		ALLEGRO_PIXEL_FORMAT_ARGB_1555             = 16,
		ALLEGRO_PIXEL_FORMAT_ABGR_8888             = 17,
		ALLEGRO_PIXEL_FORMAT_XBGR_8888             = 18,
		ALLEGRO_PIXEL_FORMAT_BGR_888               = 19, /* 24 bit format */
		ALLEGRO_PIXEL_FORMAT_BGR_565               = 20,
		ALLEGRO_PIXEL_FORMAT_BGR_555               = 21,
		ALLEGRO_PIXEL_FORMAT_RGBX_8888             = 22,
		ALLEGRO_PIXEL_FORMAT_XRGB_8888             = 23,
		ALLEGRO_PIXEL_FORMAT_ABGR_F32              = 24,
		ALLEGRO_PIXEL_FORMAT_ABGR_8888_LE          = 25,
		ALLEGRO_PIXEL_FORMAT_RGBA_4444             = 26,
		ALLEGRO_PIXEL_FORMAT_SINGLE_CHANNEL_8      = 27,
		ALLEGRO_PIXEL_FORMAT_COMPRESSED_RGBA_DXT1  = 28,
		ALLEGRO_PIXEL_FORMAT_COMPRESSED_RGBA_DXT3  = 29,
		ALLEGRO_PIXEL_FORMAT_COMPRESSED_RGBA_DXT5  = 30,
		ALLEGRO_NUM_PIXEL_FORMATS
	}


	/* Pixel mapping */
	[CLink] public static extern ALLEGRO_COLOR al_map_rgb(c_uchar r, c_uchar g, c_uchar b);
	[CLink] public static extern ALLEGRO_COLOR al_map_rgba(c_uchar r, c_uchar g, c_uchar b, c_uchar a);
	[CLink] public static extern ALLEGRO_COLOR al_map_rgb_f(float r, float g, float b);
	[CLink] public static extern ALLEGRO_COLOR al_map_rgba_f(float r, float g, float b, float a);
	[CLink] public static extern ALLEGRO_COLOR al_premul_rgba(c_uchar r, c_uchar g, c_uchar b, c_uchar a);
	[CLink] public static extern ALLEGRO_COLOR al_premul_rgba_f(float r, float g, float b, float a);

	/* Pixel unmapping */
	[CLink] public static extern void al_unmap_rgb(ALLEGRO_COLOR color, c_uchar* r, c_uchar* g, c_uchar* b);
	[CLink] public static extern void al_unmap_rgba(ALLEGRO_COLOR color, c_uchar* r, c_uchar* g, c_uchar* b, c_uchar* a);
	[CLink] public static extern void al_unmap_rgb_f(ALLEGRO_COLOR color, float* r, float* g, float* b);
	[CLink] public static extern void al_unmap_rgba_f(ALLEGRO_COLOR color, float* r, float* g, float* b, float* a);

	/* Pixel formats */
	[CLink] public static extern c_int al_get_pixel_size(c_int format);
	[CLink] public static extern c_int al_get_pixel_format_bits(c_int format);
	[CLink] public static extern c_int al_get_pixel_block_size(c_int format);
	[CLink] public static extern c_int al_get_pixel_block_width(c_int format);
	[CLink] public static extern c_int al_get_pixel_block_height(c_int format);
}