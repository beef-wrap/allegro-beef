using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public typealias ALLEGRO_USTR = _al_tagbstring;

	public typealias ALLEGRO_USTR_INFO = _al_tagbstring;

	[CRepr]
	public struct _al_tagbstring
	{
		c_int mlen;
		c_int slen;
		c_uchar* data;
	}

	/* Creating strings */
	[CLink] public static extern ALLEGRO_USTR* al_ustr_new(char* s);
	[CLink] public static extern ALLEGRO_USTR* al_ustr_new_from_buffer(char* s, size_t size);

	// AL_PRINTFUNC(ALLEGRO_USTR *, al_ustr_newf, (char *fmt, ...), 1, 2);
	[CLink] public static extern void al_ustr_free(ALLEGRO_USTR* us);
	[CLink] public static extern char* al_cstr(ALLEGRO_USTR* us);
	[CLink] public static extern void al_ustr_to_buffer(ALLEGRO_USTR* us, char* buffer, c_int size);
	[CLink] public static extern char* al_cstr_dup(ALLEGRO_USTR* us);
	[CLink] public static extern ALLEGRO_USTR* al_ustr_dup(ALLEGRO_USTR* us);
	[CLink] public static extern ALLEGRO_USTR* al_ustr_dup_substr(ALLEGRO_USTR* us, c_int start_pos, c_int end_pos);

	/* Predefined string */
	[CLink] public static extern ALLEGRO_USTR* al_ustr_empty_string();

	/* Reference strings */
	[CLink] public static extern ALLEGRO_USTR* al_ref_cstr(ALLEGRO_USTR_INFO* info, char* s);
	[CLink] public static extern ALLEGRO_USTR* al_ref_buffer(ALLEGRO_USTR_INFO* info, char* s, size_t size);
	[CLink] public static extern ALLEGRO_USTR* al_ref_ustr(ALLEGRO_USTR_INFO* info, ALLEGRO_USTR* us, c_int start_pos, c_int end_pos);
	[CLink] public static extern ALLEGRO_USTR* al_ref_info(ALLEGRO_USTR_INFO* info);

	/* Sizes and offsets */
	[CLink] public static extern size_t al_ustr_size(ALLEGRO_USTR* us);
	[CLink] public static extern size_t al_ustr_length(ALLEGRO_USTR* us);
	[CLink] public static extern c_int al_ustr_offset(ALLEGRO_USTR* us, c_int index);
	[CLink] public static extern bool al_ustr_next(ALLEGRO_USTR* us, c_int* pos);
	[CLink] public static extern bool al_ustr_prev(ALLEGRO_USTR* us, c_int* pos);

	/* Get codepoints */
	[CLink] public static extern int32_t al_ustr_get(ALLEGRO_USTR* us, c_int pos);
	[CLink] public static extern int32_t al_ustr_get_next(ALLEGRO_USTR* us, c_int* pos);
	[CLink] public static extern int32_t al_ustr_prev_get(ALLEGRO_USTR* us, c_int* pos);

	/* Insert */
	[CLink] public static extern bool al_ustr_insert(ALLEGRO_USTR* us1, c_int pos, ALLEGRO_USTR* us2);
	[CLink] public static extern bool al_ustr_insert_cstr(ALLEGRO_USTR* us, c_int pos, char* us2);
	[CLink] public static extern size_t al_ustr_insert_chr(ALLEGRO_USTR* us, c_int pos, int32_t c);

	/* Append */
	[CLink] public static extern bool al_ustr_append(ALLEGRO_USTR* us1, ALLEGRO_USTR* us2);
	[CLink] public static extern bool al_ustr_append_cstr(ALLEGRO_USTR* us, char* s);
	[CLink] public static extern size_t al_ustr_append_chr(ALLEGRO_USTR* us, int32_t c);
	// AL_PRINTFUNC(bool, al_ustr_appendf, (ALLEGRO_USTR *us, char *fmt, ...), 2, 3);
	[CLink] public static extern bool al_ustr_vappendf(ALLEGRO_USTR* us, char* fmt, va_list ap);

	/* Remove */
	[CLink] public static extern bool al_ustr_remove_chr(ALLEGRO_USTR* us, c_int pos);
	[CLink] public static extern bool al_ustr_remove_range(ALLEGRO_USTR* us, c_int start_pos, c_int end_pos);
	[CLink] public static extern bool al_ustr_truncate(ALLEGRO_USTR* us, c_int start_pos);
	[CLink] public static extern bool al_ustr_ltrim_ws(ALLEGRO_USTR* us);
	[CLink] public static extern bool al_ustr_rtrim_ws(ALLEGRO_USTR* us);
	[CLink] public static extern bool al_ustr_trim_ws(ALLEGRO_USTR* us);

	/* Assign */
	[CLink] public static extern bool al_ustr_assign(ALLEGRO_USTR* us1, ALLEGRO_USTR* us2);
	[CLink] public static extern bool al_ustr_assign_substr(ALLEGRO_USTR* us1, ALLEGRO_USTR* us2, c_int start_pos, c_int end_pos);
	[CLink] public static extern bool al_ustr_assign_cstr(ALLEGRO_USTR* us1, char* s);

	/* Replace */
	[CLink] public static extern size_t al_ustr_set_chr(ALLEGRO_USTR* us, c_int pos, int32_t c);
	[CLink] public static extern bool al_ustr_replace_range(ALLEGRO_USTR* us1, c_int start_pos1, c_int end_pos1, ALLEGRO_USTR* us2);

	/* Searching */
	[CLink] public static extern c_int al_ustr_find_chr(ALLEGRO_USTR* us, c_int start_pos, int32_t c);
	[CLink] public static extern c_int al_ustr_rfind_chr(ALLEGRO_USTR* us, c_int start_pos, int32_t c);
	[CLink] public static extern c_int al_ustr_find_set(ALLEGRO_USTR* us, c_int start_pos, ALLEGRO_USTR* accept);
	[CLink] public static extern c_int al_ustr_find_set_cstr(ALLEGRO_USTR* us, c_int start_pos, char* accept);
	[CLink] public static extern c_int al_ustr_find_cset(ALLEGRO_USTR* us, c_int start_pos, ALLEGRO_USTR* reject);
	[CLink] public static extern c_int al_ustr_find_cset_cstr(ALLEGRO_USTR* us, c_int start_pos, char* reject);
	[CLink] public static extern c_int al_ustr_find_str(ALLEGRO_USTR* haystack, c_int start_pos, ALLEGRO_USTR* needle);
	[CLink] public static extern c_int al_ustr_find_cstr(ALLEGRO_USTR* haystack, c_int start_pos, char* needle);
	[CLink] public static extern c_int al_ustr_rfind_str(ALLEGRO_USTR* haystack, c_int start_pos, ALLEGRO_USTR* needle);
	[CLink] public static extern c_int al_ustr_rfind_cstr(ALLEGRO_USTR* haystack, c_int start_pos, char* needle);
	[CLink] public static extern bool al_ustr_find_replace(ALLEGRO_USTR* us, c_int start_pos, ALLEGRO_USTR* find, ALLEGRO_USTR* replace);
	[CLink] public static extern bool al_ustr_find_replace_cstr(ALLEGRO_USTR* us, c_int start_pos, char* find, char* replace);

	/* Compare */
	[CLink] public static extern bool al_ustr_equal(ALLEGRO_USTR* us1, ALLEGRO_USTR* us2);
	[CLink] public static extern c_int al_ustr_compare(ALLEGRO_USTR* u, ALLEGRO_USTR* v);
	[CLink] public static extern c_int al_ustr_ncompare(ALLEGRO_USTR* us1, ALLEGRO_USTR* us2, c_int n);
	[CLink] public static extern bool al_ustr_has_prefix(ALLEGRO_USTR* u, ALLEGRO_USTR* v);
	[CLink] public static extern bool al_ustr_has_prefix_cstr(ALLEGRO_USTR* u, char* s);
	[CLink] public static extern bool al_ustr_has_suffix(ALLEGRO_USTR* u, ALLEGRO_USTR* v);
	[CLink] public static extern bool al_ustr_has_suffix_cstr(ALLEGRO_USTR* us1, char* s);

	/* Low level UTF-8 functions */
	[CLink] public static extern size_t al_utf8_width(int32_t c);
	[CLink] public static extern size_t al_utf8_encode(char[] s, int32_t c);

	/* UTF-16 */
	[CLink] public static extern ALLEGRO_USTR* al_ustr_new_from_utf16(uint16_t* s);
	[CLink] public static extern size_t al_ustr_size_utf16(ALLEGRO_USTR* us);
	[CLink] public static extern size_t al_ustr_encode_utf16(ALLEGRO_USTR* us, uint16_t* s, size_t n);
	[CLink] public static extern size_t al_utf16_width(c_int c);
	[CLink] public static extern size_t al_utf16_encode(uint16_t[] s, int32_t c);
}