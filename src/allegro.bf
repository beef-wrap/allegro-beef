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
 *      Main header file for the entire Allegro library.
 *      (separate modules can be included from the allegro/ directory)
 *
 *      By Shawn Hargreaves.
 *
 *      Vincent Penquerc'h split the original allegro.h into separate headers.
 *
 *      See readme.txt for copyright information.
 */

using System;
using System.Interop;

namespace allegro;

public static class allegro
{
	typealias off_t = c_long;
	typealias time_t = int64;
	typealias char = c_char;
	typealias size_t = uint;
	typealias intptr_t = c_intptr;
	typealias uintptr_t = c_uintptr;
	typealias int8_t = int8;
	typealias int16_t = int16;
	typealias int32_t = int32;
	typealias int64_t = int64;
	typealias uint8_t = uint8;
	typealias uint16_t = uint16;
	typealias uint32_t = uint32;
	typealias uint64_t = uint64;
	public struct va_list;
	public const c_int _ALLEGRO_UNSTABLE_BIT_SET = c_int.MinValue;
}