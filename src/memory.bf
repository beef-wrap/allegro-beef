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
 *      Memory management routines.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

extension allegro
{
	struct ALLEGRO_MEMORY_INTERFACE
	{
		function void*(size_t n, c_int line, char* file, char* func) mi_malloc;
		function void(void* ptr, c_int line, char* file, char* func) mi_free;
		function void*(void* ptr, size_t n, c_int line, char* file, char* func) mi_realloc;
		function void*(size_t count, size_t n, c_int line, char* file, char* func) mi_calloc;
	}

	[CLink] public static extern void al_set_memory_interface(ALLEGRO_MEMORY_INTERFACE* iface);

	// /* Function: al_malloc
	//  */
	//#define al_malloc(n) \
	//		(al_malloc_with_context((n), __LINE__, __FILE__, __func__))
	//
	///* Function: al_free
	// */
	//#define al_free(p) \
	//   (al_free_with_context((p), __LINE__, __FILE__, __func__))
	//
	///* Function: al_realloc
	// */
	//#define al_realloc(p, n) \
	//   (al_realloc_with_context((p), (n), __LINE__, __FILE__, __func__))
	//
	///* Function: al_calloc
	// */
	//#define al_calloc(c, n) \
	//   (al_calloc_with_context((c), (n), __LINE__, __FILE__, __func__))

	[CLink] public static extern void* al_malloc_with_context(size_t n, c_int line, char* file, char* func);
	[CLink] public static extern void al_free_with_context(void* ptr, c_int line, char* file, char* func);
	[CLink] public static extern void* al_realloc_with_context(void* ptr, size_t n, c_int line, char* file, char* func);
	[CLink] public static extern void* al_calloc_with_context(size_t count, size_t n, c_int line, char* file, char* func);
}