using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_wav(char* filename);
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_wav_f(ALLEGRO_FILE* fp);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM* _al_load_wav_audio_stream(char* filename, size_t buffer_count, c_uint samples);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM* _al_load_wav_audio_stream_f(ALLEGRO_FILE* f, size_t buffer_count, c_uint samples);
	[CLink] public static extern bool _al_save_wav(char* filename, ALLEGRO_SAMPLE* spl);
	[CLink] public static extern bool _al_save_wav_f(ALLEGRO_FILE* pf, ALLEGRO_SAMPLE* spl);
	[CLink] public static extern bool _al_identify_wav(ALLEGRO_FILE* f);

	/*
	* Built-in Port of A4 Creative Voice file (.voc) Loader.
	* should not implement streams since it's unlikely this container
	* will ever be used as such.
	*/
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_voc(char* filename);
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_voc_f(ALLEGRO_FILE* fp);
	[CLink] public static extern bool _al_identify_voc(ALLEGRO_FILE* f);


#if ALLEGRO_CFG_ACODEC_FLAC
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_flac(char* filename);
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_flac_f(ALLEGRO_FILE* f);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM *_al_load_flac_audio_stream(char* filename, size_t buffer_count, unsigned c_int samples);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM *_al_load_flac_audio_stream_f(ALLEGRO_FILE* f, size_t buffer_count, unsigned c_int samples);
	[CLink] public static extern bool _al_identify_flac(ALLEGRO_FILE* f);
#endif

#if ALLEGRO_CFG_ACODEC_DUMB
	[CLink] public static extern bool _al_register_dumb_loaders();
#endif

#if ALLEGRO_CFG_ACODEC_OPENMPT
	[CLink] public static extern bool _al_register_openmpt_loaders();
#endif

#if ALLEGRO_CFG_ACODEC_DUMB || ALLEGRO_CFG_ACODEC_OPENMPT
	[CLink] public static extern bool _al_identify_it(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_669(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_amf(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_asy(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_mtm(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_okt(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_psm(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_ptm(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_riff(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_stm(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_mod(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_s3m(ALLEGRO_FILE* f);
	[CLink] public static extern bool _al_identify_xm(ALLEGRO_FILE* f);
#endif

#if ALLEGRO_CFG_ACODEC_VORBIS
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_ogg_vorbis(char* filename);
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_ogg_vorbis_f(ALLEGRO_FILE* file);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM *_al_load_ogg_vorbis_audio_stream(char* filename, size_t buffer_count, unsigned c_int samples);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM *_al_load_ogg_vorbis_audio_stream_f(ALLEGRO_FILE* file, size_t buffer_count, unsigned c_int samples);
	[CLink] public static extern bool _al_identify_ogg_vorbis(ALLEGRO_FILE* f);
#endif

#if ALLEGRO_CFG_ACODEC_OPUS
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_ogg_opus(char* filename);
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_ogg_opus_f(ALLEGRO_FILE* file);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM *_al_load_ogg_opus_audio_stream(char* filename, size_t buffer_count, unsigned c_int samples);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM *_al_load_ogg_opus_audio_stream_f(ALLEGRO_FILE* file, size_t buffer_count, unsigned c_int samples);
	[CLink] public static extern bool _al_identify_ogg_opus(ALLEGRO_FILE* f);
#endif

#if ALLEGRO_CFG_ACODEC_MP3
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_mp3(char* filename);
	[CLink] public static extern ALLEGRO_SAMPLE* _al_load_mp3_f(ALLEGRO_FILE* f);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM *_al_load_mp3_audio_stream(char* filename, size_t buffer_count, unsigned c_int samples);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM *_al_load_mp3_audio_stream_f(ALLEGRO_FILE* f, size_t buffer_count, unsigned c_int samples);
	[CLink] public static extern bool _al_identify_mp3(ALLEGRO_FILE* f);
#endif
}