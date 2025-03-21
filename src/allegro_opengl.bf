/*         ______   ___    ___
 *        /\  _  \ /\_ \  /\_ \
 *        \ \ \L\ \\//\ \ \//\ \      __     __   _ __   ___
 *         \ \  __ \ \ \ \  \ \ \   /'__`\ /'_ `\/\`'__\/ __`\
 *          \ \ \/\ \ \_\ \_ \_\ \_/\  __//\ \L\ \ \ \//\ \L\ \
 *           \ \_\ \_\/\____\/\____\ \____\ \____ \ \_\\ \____/
 *            \/_/\/_/\/____/\/____/\/____/\/___L\ \/_/ \/___/
 *                                           /\____/
 *                                           \_/__/
 *
 *      Main header file for all OpenGL drivers.
 *
 *      By Milan Mimica.
 *
 */


using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct ALLEGRO_OGL_EXT_LIST;

	typealias GLuint = c_uint;

	/*
	 *  Public OpenGL-related API
	 */

	public enum ALLEGRO_OPENGL_VARIANT : c_int
	{
		ALLEGRO_DESKTOP_OPENGL = 0,
		ALLEGRO_OPENGL_ES
	}

	[CLink] public static extern uint32_t al_get_opengl_version();
	[CLink] public static extern bool al_have_opengl_extension(char* ext);
	[CLink] public static extern void* al_get_opengl_proc_address(char* name);
	[CLink] public static extern ALLEGRO_OGL_EXT_LIST* al_get_opengl_extension_list();
	[CLink] public static extern GLuint al_get_opengl_texture(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern void al_remove_opengl_fbo(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern GLuint al_get_opengl_fbo(ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern bool al_get_opengl_texture_size(ALLEGRO_BITMAP* bitmap, c_int* w, c_int* h);
	[CLink] public static extern void al_get_opengl_texture_position(ALLEGRO_BITMAP* bitmap, c_int* u, c_int* v);
	[CLink] public static extern GLuint al_get_opengl_program_object(ALLEGRO_SHADER* shader);
	[CLink] public static extern void al_set_current_opengl_context(ALLEGRO_DISPLAY* display);
	[CLink] public static extern c_int al_get_opengl_variant();
}