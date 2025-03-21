using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct ALLEGRO_SHADER;

	public enum ALLEGRO_SHADER_TYPE : c_int
	{
		ALLEGRO_VERTEX_SHADER = 1,
		ALLEGRO_PIXEL_SHADER = 2
	}

	public enum ALLEGRO_SHADER_PLATFORM : c_int
	{
		ALLEGRO_SHADER_AUTO = 0,
		ALLEGRO_SHADER_GLSL = 1,
		ALLEGRO_SHADER_HLSL = 2,
		ALLEGRO_SHADER_AUTO_MINIMAL = 3,
		ALLEGRO_SHADER_GLSL_MINIMAL = 4,
		ALLEGRO_SHADER_HLSL_MINIMAL = 5,
		ALLEGRO_SHADER_HLSL_SM_3_0 = 6,
	}

	 /* Shader variable names */
	public const c_char* ALLEGRO_SHADER_VAR_COLOR             = "al_color";
	public const c_char* ALLEGRO_SHADER_VAR_POS               = "al_pos";
	public const c_char* ALLEGRO_SHADER_VAR_PROJVIEW_MATRIX   = "al_projview_matrix";
	public const c_char* ALLEGRO_SHADER_VAR_TEX               = "al_tex";
	public const c_char* ALLEGRO_SHADER_VAR_TEXCOORD          = "al_texcoord";
	public const c_char* ALLEGRO_SHADER_VAR_TEX_MATRIX        = "al_tex_matrix";
	public const c_char* ALLEGRO_SHADER_VAR_USER_ATTR         = "al_user_attr_";
	public const c_char* ALLEGRO_SHADER_VAR_USE_TEX           = "al_use_tex";
	public const c_char* ALLEGRO_SHADER_VAR_USE_TEX_MATRIX    = "al_use_tex_matrix";
	public const c_char* ALLEGRO_SHADER_VAR_ALPHA_TEST        = "al_alpha_test";
	public const c_char* ALLEGRO_SHADER_VAR_ALPHA_FUNCTION    = "al_alpha_func";
	public const c_char* ALLEGRO_SHADER_VAR_ALPHA_TEST_VALUE  = "al_alpha_test_val";

	[CLink] public static extern ALLEGRO_SHADER* al_create_shader(ALLEGRO_SHADER_PLATFORM platform);
	[CLink] public static extern bool al_attach_shader_source(ALLEGRO_SHADER* shader, ALLEGRO_SHADER_TYPE type, char* source);
	[CLink] public static extern bool al_attach_shader_source_file(ALLEGRO_SHADER* shader, ALLEGRO_SHADER_TYPE type, char* filename);
	[CLink] public static extern bool al_build_shader(ALLEGRO_SHADER* shader);
	[CLink] public static extern char* al_get_shader_log(ALLEGRO_SHADER* shader);
	[CLink] public static extern ALLEGRO_SHADER_PLATFORM al_get_shader_platform(ALLEGRO_SHADER* shader);
	[CLink] public static extern bool al_use_shader(ALLEGRO_SHADER* shader);
	[CLink] public static extern ALLEGRO_SHADER* al_get_current_shader();
	[CLink] public static extern void al_destroy_shader(ALLEGRO_SHADER* shader);

	[CLink] public static extern bool al_set_shader_sampler(char* name, ALLEGRO_BITMAP* bitmap, c_int unit);
	[CLink] public static extern bool al_set_shader_matrix(char* name, ALLEGRO_TRANSFORM* matrix);
	[CLink] public static extern bool al_set_shader_int(char* name, c_int i);
	[CLink] public static extern bool al_set_shader_float(char* name, float f);
	[CLink] public static extern bool al_set_shader_int_vector(char* name, c_int num_components, c_int* i, c_int num_elems);
	[CLink] public static extern bool al_set_shader_float_vector(char* name, c_int num_components, float* f, c_int num_elems);
	[CLink] public static extern bool al_set_shader_bool(char* name, bool b);

	[CLink] public static extern char* al_get_default_shader_source(ALLEGRO_SHADER_PLATFORM platform, ALLEGRO_SHADER_TYPE type);
}