using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CLink] public static extern ALLEGRO_FILE* al_open_memfile(void* mem, int64_t size, char* mode);
	[CLink] public static extern uint32_t al_get_allegro_memfile_version();
}