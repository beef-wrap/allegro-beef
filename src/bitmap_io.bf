using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public enum ALLEGRO_BITMAP_LOADER_FLAGS : c_int
	{
		ALLEGRO_KEEP_BITMAP_FORMAT       = 0x0002, /* was a bitmap flag in 5.0 */
		ALLEGRO_NO_PREMULTIPLIED_ALPHA   = 0x0200, /* was a bitmap flag in 5.0 */
		ALLEGRO_KEEP_INDEX               = 0x0800
	}

	function ALLEGRO_BITMAP* ALLEGRO_IIO_LOADER_FUNCTION(char* filename, c_int flags);
	function ALLEGRO_BITMAP* ALLEGRO_IIO_FS_LOADER_FUNCTION(ALLEGRO_FILE* fp, c_int flags);
	function bool ALLEGRO_IIO_SAVER_FUNCTION(char* filename, ALLEGRO_BITMAP* bitmap);
	function bool ALLEGRO_IIO_FS_SAVER_FUNCTION(ALLEGRO_FILE* fp, ALLEGRO_BITMAP* bitmap);
	function bool ALLEGRO_IIO_IDENTIFIER_FUNCTION(ALLEGRO_FILE* f);

	[CLink] public static extern bool al_register_bitmap_loader(char* ext, ALLEGRO_IIO_LOADER_FUNCTION loader);
	[CLink] public static extern bool al_register_bitmap_saver(char* ext, ALLEGRO_IIO_SAVER_FUNCTION saver);
	[CLink] public static extern bool al_register_bitmap_loader_f(char* ext, ALLEGRO_IIO_FS_LOADER_FUNCTION fs_loader);
	[CLink] public static extern bool al_register_bitmap_saver_f(char* ext, ALLEGRO_IIO_FS_SAVER_FUNCTION fs_saver);
	[CLink] public static extern bool al_register_bitmap_identifier(char* ext, ALLEGRO_IIO_IDENTIFIER_FUNCTION identifier);
	[CLink] public static extern ALLEGRO_BITMAP* al_load_bitmap(char* filename);
	[CLink] public static extern ALLEGRO_BITMAP* al_load_bitmap_flags(char* filename, c_int flags);
	[CLink] public static extern ALLEGRO_BITMAP* al_load_bitmap_f(ALLEGRO_FILE* fp, char* ident);
	[CLink] public static extern ALLEGRO_BITMAP* al_load_bitmap_flags_f(ALLEGRO_FILE* fp, char* ident, c_int flags);
	[CLink] public static extern bool al_save_bitmap(char* filename, ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern bool al_save_bitmap_f(ALLEGRO_FILE* fp, char* ident, ALLEGRO_BITMAP* bitmap);
	[CLink] public static extern char* al_identify_bitmap_f(ALLEGRO_FILE* fp);
	[CLink] public static extern char* al_identify_bitmap(char* filename);
}