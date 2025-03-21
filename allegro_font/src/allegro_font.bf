using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct ALLEGRO_FONT;

	[CRepr]
	public struct ALLEGRO_GLYPH
	{
		ALLEGRO_BITMAP* bitmap;
		c_int x;
		c_int y;
		c_int w;
		c_int h;
		c_int kerning;
		c_int offset_x;
		c_int offset_y;
		c_int advance;
	}

	[AllowDuplicates]
	public enum ALLEGRO_ALIGNMENT : c_int
	{
		ALLEGRO_NO_KERNING       = -1,
		ALLEGRO_ALIGN_LEFT       = 0,
		ALLEGRO_ALIGN_CENTRE     = 1,
		ALLEGRO_ALIGN_CENTER     = 1,
		ALLEGRO_ALIGN_RIGHT      = 2,
		ALLEGRO_ALIGN_INTEGER    = 4,
	}

	[CLink] public static extern bool al_register_font_loader(char* ext, function ALLEGRO_FONT*(char* filename, c_int size, c_int flags) load);
	[CLink] public static extern ALLEGRO_FONT* al_load_bitmap_font(char* filename);
	[CLink] public static extern ALLEGRO_FONT* al_load_bitmap_font_flags(char* filename, c_int flags);
	[CLink] public static extern ALLEGRO_FONT* al_load_font(char* filename, c_int size, c_int flags);

	[CLink] public static extern ALLEGRO_FONT* al_grab_font_from_bitmap(ALLEGRO_BITMAP* bmp, c_int n, c_int[] ranges);
	[CLink] public static extern ALLEGRO_FONT* al_create_builtin_font();

	[CLink] public static extern void al_draw_ustr(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x, float y, c_int flags, ALLEGRO_USTR* ustr);
	[CLink] public static extern void al_draw_text(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x, float y, c_int flags, char* text);
	[CLink] public static extern void al_draw_justified_text(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x1, float x2, float y, float diff, c_int flags, char* text);
	[CLink] public static extern void al_draw_justified_ustr(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x1, float x2, float y, float diff, c_int flags, ALLEGRO_USTR* text);
	[CLink] public static extern void al_draw_textf(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x, float y, c_int flags, char* format, ...);
	[CLink] public static extern void al_draw_justified_textf(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x1, float x2, float y, float diff, c_int flags, char* format, ...);
	[CLink] public static extern c_int al_get_text_width(ALLEGRO_FONT* f, char* str);
	[CLink] public static extern c_int al_get_ustr_width(ALLEGRO_FONT* f, ALLEGRO_USTR* ustr);
	[CLink] public static extern c_int al_get_font_line_height(ALLEGRO_FONT* f);
	[CLink] public static extern c_int al_get_font_ascent(ALLEGRO_FONT* f);
	[CLink] public static extern c_int al_get_font_descent(ALLEGRO_FONT* f);
	[CLink] public static extern void al_destroy_font(ALLEGRO_FONT* f);
	[CLink] public static extern void al_get_ustr_dimensions(ALLEGRO_FONT* f, ALLEGRO_USTR* text, c_int* bbx, c_int* bby, c_int* bbw, c_int* bbh);
	[CLink] public static extern void al_get_text_dimensions(ALLEGRO_FONT* f, char* text, c_int* bbx, c_int* bby, c_int* bbw, c_int* bbh);
	[CLink] public static extern bool al_init_font_addon();
	[CLink] public static extern bool al_is_font_addon_initialized();
	[CLink] public static extern void al_shutdown_font_addon();
	[CLink] public static extern uint32_t al_get_allegro_font_version();
	[CLink] public static extern c_int al_get_font_ranges(ALLEGRO_FONT* font, c_int ranges_count, c_int* ranges);

	[CLink] public static extern void al_draw_glyph(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x, float y, c_int codepoint);
	[CLink] public static extern c_int al_get_glyph_width(ALLEGRO_FONT* f, c_int codepoint);
	[CLink] public static extern bool al_get_glyph_dimensions(ALLEGRO_FONT* f, c_int codepoint, c_int* bbx, c_int* bby, c_int* bbw, c_int* bbh);
	[CLink] public static extern c_int al_get_glyph_advance(ALLEGRO_FONT* f, c_int codepoint1, c_int codepoint2);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_FONT_SRC
	[CLink] public static extern bool al_get_glyph(ALLEGRO_FONT* f, c_int prev_codepoint, c_int codepoint, ALLEGRO_GLYPH* glyph);
#endif

	[CLink] public static extern void al_draw_multiline_text(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x, float y, float max_width, float line_height, c_int flags, char* text);

	[CLink] public static extern void al_draw_multiline_textf(ALLEGRO_FONT* font, ALLEGRO_COLOR color, double x, double y, double max_width, double line_height, c_int flags, char* format, ...);

	[CLink] public static extern void al_draw_multiline_ustr(ALLEGRO_FONT* font, ALLEGRO_COLOR color, float x, float y, float max_width, float line_height, c_int flags, ALLEGRO_USTR* text);

	[CLink] public static extern void al_do_multiline_text(ALLEGRO_FONT* font, float max_width, char* text, function bool(c_int line_num, char* line, c_int size, void* extra) cb, void* extra);

	[CLink] public static extern void al_do_multiline_ustr(ALLEGRO_FONT* font, float max_width, ALLEGRO_USTR* ustr, function bool(c_int line_num, ALLEGRO_USTR* line, void* extra) cb, void* extra);

	[CLink] public static extern void al_set_fallback_font(ALLEGRO_FONT* font, ALLEGRO_FONT* fallback);
	[CLink] public static extern ALLEGRO_FONT* al_get_fallback_font(ALLEGRO_FONT* font);
}