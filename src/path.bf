using System;
using System.Interop;

namespace allegro;

extension allegro
{

#if ALLEGRO_WINDOWS
	public const c_char* ALLEGRO_NATIVE_PATH_SEP = "\\";
	public const c_char* ALLEGRO_NATIVE_DRIVE_SEP = ":";
#else
	public const c_char* ALLEGRO_NATIVE_PATH_SEP = "/";
	public const c_char* ALLEGRO_NATIVE_DRIVE_SEP = "\0";
#endif

	public struct ALLEGRO_PATH;

	[CLink] public static extern ALLEGRO_PATH* al_create_path(char* str);
	[CLink] public static extern ALLEGRO_PATH* al_create_path_for_directory(char* str);
	[CLink] public static extern ALLEGRO_PATH* al_clone_path(ALLEGRO_PATH* path);

	[CLink] public static extern c_int al_get_path_num_components(ALLEGRO_PATH* path);
	[CLink] public static extern char* al_get_path_component(ALLEGRO_PATH* path, c_int i);
	[CLink] public static extern void al_replace_path_component(ALLEGRO_PATH* path, c_int i, char* s);
	[CLink] public static extern void al_remove_path_component(ALLEGRO_PATH* path, c_int i);
	[CLink] public static extern void al_insert_path_component(ALLEGRO_PATH* path, c_int i, char* s);
	[CLink] public static extern char* al_get_path_tail(ALLEGRO_PATH* path);
	[CLink] public static extern void al_drop_path_tail(ALLEGRO_PATH* path);
	[CLink] public static extern void al_append_path_component(ALLEGRO_PATH* path, char* s);
	[CLink] public static extern bool al_join_paths(ALLEGRO_PATH* path, ALLEGRO_PATH* tail);
	[CLink] public static extern bool al_rebase_path(ALLEGRO_PATH* head, ALLEGRO_PATH* tail);
	[CLink] public static extern char* al_path_cstr(ALLEGRO_PATH* path, char delim);
	[CLink] public static extern ALLEGRO_USTR* al_path_ustr(ALLEGRO_PATH* path, char delim);
	[CLink] public static extern void al_destroy_path(ALLEGRO_PATH* path);

	[CLink] public static extern void al_set_path_drive(ALLEGRO_PATH* path, char* drive);
	[CLink] public static extern char* al_get_path_drive(ALLEGRO_PATH* path);

	[CLink] public static extern void al_set_path_filename(ALLEGRO_PATH* path, char* filename);
	[CLink] public static extern char* al_get_path_filename(ALLEGRO_PATH* path);

	[CLink] public static extern char* al_get_path_extension(ALLEGRO_PATH* path);
	[CLink] public static extern bool al_set_path_extension(ALLEGRO_PATH* path, char* ext);
	[CLink] public static extern char* al_get_path_basename(ALLEGRO_PATH* path);

	[CLink] public static extern bool al_make_path_canonical(ALLEGRO_PATH* path);

}