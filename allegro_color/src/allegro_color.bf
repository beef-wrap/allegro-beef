using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CLink] public static extern uint32_t al_get_allegro_color_version();
	[CLink] public static extern void al_color_hsv_to_rgb(float hue, float saturation, float value, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_hsl(float red, float green, float blue, float* hue, float* saturation, float* lightness);
	[CLink] public static extern void al_color_rgb_to_hsv(float red, float green, float blue, float* hue, float* saturation, float* value);
	[CLink] public static extern void al_color_hsl_to_rgb(float hue, float saturation, float lightness, float* red, float* green, float* blue);
	[CLink] public static extern bool al_color_name_to_rgb(char* name, float* r, float* g, float* b);
	[CLink] public static extern  char* al_color_rgb_to_name(float r, float g, float b);
	[CLink] public static extern void al_color_cmyk_to_rgb(float cyan, float magenta, float yellow, float key, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_cmyk(float red, float green, float blue, float* cyan, float* magenta, float* yellow, float* key);
	[CLink] public static extern void al_color_yuv_to_rgb(float y, float u, float v, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_yuv(float red, float green, float blue, float* y, float* u, float* v);
	[CLink] public static extern void al_color_rgb_to_html(float red, float green, float blue, char* string);
	[CLink] public static extern bool al_color_html_to_rgb(char* string, float* red, float* green, float* blue);
	[CLink] public static extern ALLEGRO_COLOR al_color_yuv(float y, float u, float v);
	[CLink] public static extern ALLEGRO_COLOR al_color_cmyk(float c, float m, float y, float k);
	[CLink] public static extern ALLEGRO_COLOR al_color_hsl(float h, float s, float l);
	[CLink] public static extern ALLEGRO_COLOR al_color_hsv(float h, float s, float v);
	[CLink] public static extern ALLEGRO_COLOR al_color_name(char* name);
	[CLink] public static extern ALLEGRO_COLOR al_color_html(char* string);
	[CLink] public static extern void al_color_xyz_to_rgb(float x, float y, float z, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_xyz(float red, float green, float blue, float* x, float* y, float* z);
	[CLink] public static extern ALLEGRO_COLOR al_color_xyz(float x, float y, float z);
	[CLink] public static extern void al_color_lab_to_rgb(float l, float a, float b, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_lab(float red, float green, float blue, float* l, float* a, float* b);
	[CLink] public static extern ALLEGRO_COLOR al_color_lab(float l, float a, float b);
	[CLink] public static extern void al_color_xyy_to_rgb(float x, float y, float y2, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_xyy(float red, float green, float blue, float* x, float* y, float* y2);
	[CLink] public static extern ALLEGRO_COLOR al_color_xyy(float x, float y, float y2);
	[CLink] public static extern double al_color_distance_ciede2000(ALLEGRO_COLOR c1, ALLEGRO_COLOR c2);
	[CLink] public static extern void al_color_lch_to_rgb(float l, float c, float h, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_lch(float red, float green, float blue, float* l, float* c, float* h);
	[CLink] public static extern ALLEGRO_COLOR al_color_lch(float l, float c, float h);
	[CLink] public static extern bool al_is_color_valid(ALLEGRO_COLOR color);
	[CLink] public static extern void al_color_oklab_to_rgb(float l, float a, float b, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_oklab(float red, float green, float blue, float* l, float* a, float* b);
	[CLink] public static extern ALLEGRO_COLOR al_color_oklab(float l, float a, float b);
	[CLink] public static extern void al_color_linear_to_rgb(float x, float y, float z, float* red, float* green, float* blue);
	[CLink] public static extern void al_color_rgb_to_linear(float red, float green, float blue, float* x, float* y, float* z);
	[CLink] public static extern ALLEGRO_COLOR al_color_linear(float r, float g, float b);
}