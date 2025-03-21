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
 *      Header file for Direct3D specific API.
 *
 *      By Milan Mimica.
 *
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct LPDIRECT3DDEVICE9;
	public struct LPDIRECT3DTEXTURE9;

	[CLink] public static extern LPDIRECT3DDEVICE9 al_get_d3d_device(ALLEGRO_DISPLAY*);
	[CLink] public static extern LPDIRECT3DTEXTURE9 al_get_d3d_system_texture(ALLEGRO_BITMAP*);
	[CLink] public static extern LPDIRECT3DTEXTURE9 al_get_d3d_video_texture(ALLEGRO_BITMAP*);
	[CLink] public static extern bool al_have_d3d_non_pow2_texture_support();
	[CLink] public static extern bool al_have_d3d_non_square_texture_support();
	[CLink] public static extern void al_get_d3d_texture_position(ALLEGRO_BITMAP* bitmap, c_int* u, c_int* v);
	[CLink] public static extern bool al_get_d3d_texture_size(ALLEGRO_BITMAP* bitmap, c_int* width, c_int* height);
	[CLink] public static extern bool al_is_d3d_device_lost(ALLEGRO_DISPLAY* display);
	[CLink] public static extern void al_set_d3d_device_release_callback(function void(ALLEGRO_DISPLAY* display) callback);
	[CLink] public static extern void al_set_d3d_device_restore_callback(function void(ALLEGRO_DISPLAY* display) callback);
}