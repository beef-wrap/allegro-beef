using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct ALLEGRO_FILE;

	[CRepr]
	public struct ALLEGRO_FILE_INTERFACE
	{
		function void*(char* path, char* mode) fi_fopen;
		function bool(ALLEGRO_FILE* handle) fi_fclose;
		function size_t(ALLEGRO_FILE* f, void* ptr, size_t size) fi_fread;
		function size_t(ALLEGRO_FILE* f, void* ptr, size_t size) fi_fwrite;
		function bool(ALLEGRO_FILE* f) fi_fflush;
		function int64_t(ALLEGRO_FILE* f) fi_ftell;
		function bool(ALLEGRO_FILE* f, int64_t offset, c_int whence) fi_fseek;
		function bool(ALLEGRO_FILE* f) fi_feof;
		function c_int(ALLEGRO_FILE* f) fi_ferror;
		function char*(ALLEGRO_FILE* f) fi_ferrmsg;
		function void(ALLEGRO_FILE* f) fi_fclearerr;
		function c_int(ALLEGRO_FILE* f, c_int c) fi_fungetc;
		function off_t(ALLEGRO_FILE* f) fi_fsize;
	}

	public enum ALLEGRO_SEEK : c_int
	{
		ALLEGRO_SEEK_SET = 0,
		ALLEGRO_SEEK_CUR,
		ALLEGRO_SEEK_END
	}

	 /* The basic operations. */
	[CLink] public static extern ALLEGRO_FILE* al_fopen(char* path, char* mode);
	[CLink] public static extern ALLEGRO_FILE* al_fopen_interface(ALLEGRO_FILE_INTERFACE* vt, char* path, char* mode);
	[CLink] public static extern ALLEGRO_FILE* al_create_file_handle(ALLEGRO_FILE_INTERFACE* vt, void* userdata);
	[CLink] public static extern bool al_fclose(ALLEGRO_FILE* f);
	[CLink] public static extern size_t al_fread(ALLEGRO_FILE* f, void* ptr, size_t size);
	[CLink] public static extern size_t al_fwrite(ALLEGRO_FILE* f, void* ptr, size_t size);
	[CLink] public static extern bool al_fflush(ALLEGRO_FILE* f);
	[CLink] public static extern int64_t al_ftell(ALLEGRO_FILE* f);
	[CLink] public static extern bool al_fseek(ALLEGRO_FILE* f, int64_t offset, c_int whence);
	[CLink] public static extern bool al_feof(ALLEGRO_FILE* f);
	[CLink] public static extern c_int al_ferror(ALLEGRO_FILE* f);
	[CLink] public static extern char* al_ferrmsg(ALLEGRO_FILE* f);
	[CLink] public static extern void al_fclearerr(ALLEGRO_FILE* f);
	[CLink] public static extern c_int al_fungetc(ALLEGRO_FILE* f, c_int c);
	[CLink] public static extern int64_t al_fsize(ALLEGRO_FILE* f);

	 /* Convenience functions. */
	[CLink] public static extern c_int al_fgetc(ALLEGRO_FILE* f);
	[CLink] public static extern c_int al_fputc(ALLEGRO_FILE* f, c_int c);
	[CLink] public static extern int16_t al_fread16le(ALLEGRO_FILE* f);
	[CLink] public static extern int16_t al_fread16be(ALLEGRO_FILE* f);
	[CLink] public static extern size_t al_fwrite16le(ALLEGRO_FILE* f, int16_t w);
	[CLink] public static extern size_t al_fwrite16be(ALLEGRO_FILE* f, int16_t w);
	[CLink] public static extern int32_t al_fread32le(ALLEGRO_FILE* f);
	[CLink] public static extern int32_t al_fread32be(ALLEGRO_FILE* f);
	[CLink] public static extern size_t al_fwrite32le(ALLEGRO_FILE* f, int32_t l);
	[CLink] public static extern size_t al_fwrite32be(ALLEGRO_FILE* f, int32_t l);
	[CLink] public static extern char* al_fgets(ALLEGRO_FILE* f, char* p, size_t max);
	[CLink] public static extern ALLEGRO_USTR* al_fget_ustr(ALLEGRO_FILE* f);
	[CLink] public static extern c_int al_fputs(ALLEGRO_FILE* f, char* p);
	[CLink] public static extern c_int al_fprintf(ALLEGRO_FILE* f, char* format, ...);
	[CLink] public static extern c_int al_vfprintf(ALLEGRO_FILE* f, char* format, va_list args);

	/* Specific to stdio backend. */
	[CLink] public static extern ALLEGRO_FILE* al_fopen_fd(c_int fd, char* mode);
	[CLink] public static extern ALLEGRO_FILE* al_make_temp_file(char* tmpl, ALLEGRO_PATH** ret_path);

	/* Specific to slices. */
	[CLink] public static extern ALLEGRO_FILE* al_fopen_slice(ALLEGRO_FILE* fp, size_t initial_size, char* mode);

	/* Thread-local state. */
	[CLink] public static extern ALLEGRO_FILE_INTERFACE* al_get_new_file_interface();
	[CLink] public static extern void al_set_new_file_interface(ALLEGRO_FILE_INTERFACE* file_interface);
	[CLink] public static extern void al_set_standard_file_interface();

	/* ALLEGRO_FILE field accessors */
	[CLink] public static extern void* al_get_file_userdata(ALLEGRO_FILE* f);
}