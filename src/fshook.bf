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
 *      File System Hooks.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	/*#ifdef ALLEGRO_HAVE_SYS_TYPES_H
	   
	#else
	/* 4 Gig max offsets if sys/types doesn't exist. */
	typedef c_uint off_t;
	#endif*/

	[CRepr]
	public struct ALLEGRO_FS_ENTRY
	{
		ALLEGRO_FS_INTERFACE* vtable;
	}

	public enum ALLEGRO_FILE_MODE : c_int
	{
		ALLEGRO_FILEMODE_READ    = 1,
		ALLEGRO_FILEMODE_WRITE   = 1 << 1,
		ALLEGRO_FILEMODE_EXECUTE = 1 << 2,
		ALLEGRO_FILEMODE_HIDDEN  = 1 << 3,
		ALLEGRO_FILEMODE_ISFILE  = 1 << 4,
		ALLEGRO_FILEMODE_ISDIR   = 1 << 5
	}

	[CRepr]
	public struct ALLEGRO_FS_INTERFACE
	{
		function ALLEGRO_FS_ENTRY*(char* path) fs_create_entry;
		function void(ALLEGRO_FS_ENTRY* e) fs_destroy_entry;
		function char*(ALLEGRO_FS_ENTRY* e) fs_entry_name;
		function bool(ALLEGRO_FS_ENTRY* e) fs_update_entry;
		function uint32_t(ALLEGRO_FS_ENTRY* e) fs_entry_mode;
		function time_t(ALLEGRO_FS_ENTRY* e) fs_entry_atime;
		function time_t(ALLEGRO_FS_ENTRY* e) fs_entry_mtime;
		function time_t(ALLEGRO_FS_ENTRY* e) fs_entry_ctime;
		function off_t(ALLEGRO_FS_ENTRY* e) fs_entry_size;
		function bool(ALLEGRO_FS_ENTRY* e) fs_entry_exists;
		function bool(ALLEGRO_FS_ENTRY* e) fs_remove_entry;

		function bool(ALLEGRO_FS_ENTRY* e) fs_open_directory;
		function ALLEGRO_FS_ENTRY*(ALLEGRO_FS_ENTRY* e) fs_read_directory;
		function bool(ALLEGRO_FS_ENTRY* e) fs_close_directory;

		function bool(char* path) fs_filename_exists;
		function bool(char* path) fs_remove_filename;
		function char*() fs_get_current_directory;
		function bool(char* path) fs_change_directory;
		function bool(char* path) fs_make_directory;

		function ALLEGRO_FILE*(ALLEGRO_FS_ENTRY* e, char* mode) fs_open_file;
	}

	[CLink] public static extern ALLEGRO_FS_ENTRY* al_create_fs_entry(char* path);
	[CLink] public static extern void al_destroy_fs_entry(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern char* al_get_fs_entry_name(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern bool al_update_fs_entry(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern uint32_t al_get_fs_entry_mode(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern time_t al_get_fs_entry_atime(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern time_t al_get_fs_entry_mtime(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern time_t al_get_fs_entry_ctime(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern off_t al_get_fs_entry_size(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern bool al_fs_entry_exists(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern bool al_remove_fs_entry(ALLEGRO_FS_ENTRY* e);

	[CLink] public static extern bool al_open_directory(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern ALLEGRO_FS_ENTRY* al_read_directory(ALLEGRO_FS_ENTRY* e);
	[CLink] public static extern bool al_close_directory(ALLEGRO_FS_ENTRY* e);

	[CLink] public static extern bool al_filename_exists(char* path);
	[CLink] public static extern bool al_remove_filename(char* path);
	[CLink] public static extern char* al_get_current_directory();
	[CLink] public static extern bool al_change_directory(char* path);
	[CLink] public static extern bool al_make_directory(char* path);

	[CLink] public static extern ALLEGRO_FILE* al_open_fs_entry(ALLEGRO_FS_ENTRY* e, char* mode);

	public enum ALLEGRO_FOR_EACH_FS_ENTRY_RESULT : c_int
	{
		ALLEGRO_FOR_EACH_FS_ENTRY_ERROR = -1,
		ALLEGRO_FOR_EACH_FS_ENTRY_OK    =  0,
		ALLEGRO_FOR_EACH_FS_ENTRY_SKIP  =  1,
		ALLEGRO_FOR_EACH_FS_ENTRY_STOP  =  2
	}

	[CLink] public static extern c_int al_for_each_fs_entry(ALLEGRO_FS_ENTRY* dir, function c_int(ALLEGRO_FS_ENTRY* entry, void* extra) callback, void* extra);

	/* Thread-local state. */
	[CLink] public static extern ALLEGRO_FS_INTERFACE* al_get_fs_interface();
	[CLink] public static extern void al_set_fs_interface(ALLEGRO_FS_INTERFACE* vtable);
	[CLink] public static extern void al_set_standard_fs_interface();
}