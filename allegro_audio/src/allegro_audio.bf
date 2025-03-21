using System;
using System.Interop;

namespace allegro;

extension allegro
{
	/*
	* Updated for 4.9 api inclusion by Ryan Dickie
	* Originally done by KC/Milan
	*/
	public enum ALLEGRO_AUDIO_EVENT_TYPE : c_int
	{
	   /* Internal, used to communicate with acodec. */
	   /* Must be in 512 <= n < 1024 */
		_KCM_STREAM_FEEDER_QUIT_EVENT_TYPE    = 512,
		ALLEGRO_EVENT_AUDIO_STREAM_FRAGMENT   = 513,
		ALLEGRO_EVENT_AUDIO_STREAM_FINISHED   = 514,
#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_KCM_AUDIO_SRC
		ALLEGRO_EVENT_AUDIO_RECORDER_FRAGMENT = 515,
#endif
	}

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_KCM_AUDIO_SRC
	[CRepr]
	public struct ALLEGRO_AUDIO_RECORDER_EVENT
	{
		ALLEGRO_EVENT_TYPE type;
		ALLEGRO_AUDIO_RECORDER* source;
		double timestamp;
		ALLEGRO_USER_EVENT_DESCRIPTOR* __internal__descr;
		void* buffer;
		c_uint samples;
	}
#endif

	[AllowDuplicates]
	public enum ALLEGRO_AUDIO_DEPTH : c_int
	{
	   /* Sample depth and type, and signedness. Mixers only use 32-bit signed
		* float (-1..+1). The unsigned value is a bit-flag applied to the depth
		* value.
		*/
		ALLEGRO_AUDIO_DEPTH_INT8      = 0x00,
		ALLEGRO_AUDIO_DEPTH_INT16     = 0x01,
		ALLEGRO_AUDIO_DEPTH_INT24     = 0x02,
		ALLEGRO_AUDIO_DEPTH_FLOAT32   = 0x03,

		ALLEGRO_AUDIO_DEPTH_UNSIGNED  = 0x08,

		/* For convenience */
		ALLEGRO_AUDIO_DEPTH_UINT8  = ALLEGRO_AUDIO_DEPTH_INT8 | ALLEGRO_AUDIO_DEPTH_UNSIGNED,
		ALLEGRO_AUDIO_DEPTH_UINT16 = ALLEGRO_AUDIO_DEPTH_INT16 | ALLEGRO_AUDIO_DEPTH_UNSIGNED,
		ALLEGRO_AUDIO_DEPTH_UINT24 = ALLEGRO_AUDIO_DEPTH_INT24 | ALLEGRO_AUDIO_DEPTH_UNSIGNED
	}

	public enum ALLEGRO_CHANNEL_CONF : c_int
	{
	   /* Speaker configuration (mono, stereo, 2.1, 3, etc). With regards to
		* behavior, most of this code makes no distinction between, say, 4.1 and
		* 5 speaker setups.. they both have 5 "channels". However, users would
		* like the distinction, and later when the higher-level stuff is added,
		* the differences will become more important. (v>>4)+(v&0xF) should yield
		* the total channel count.
		*/
		ALLEGRO_CHANNEL_CONF_1   = 0x10,
		ALLEGRO_CHANNEL_CONF_2   = 0x20,
		ALLEGRO_CHANNEL_CONF_3   = 0x30,
		ALLEGRO_CHANNEL_CONF_4   = 0x40,
		ALLEGRO_CHANNEL_CONF_5_1 = 0x51,
		ALLEGRO_CHANNEL_CONF_6_1 = 0x61,
		ALLEGRO_CHANNEL_CONF_7_1 = 0x71

	}

	public const c_int ALLEGRO_MAX_CHANNELS = 8;

	public enum ALLEGRO_PLAYMODE : c_int
	{
		ALLEGRO_PLAYMODE_ONCE = 0x100,
		ALLEGRO_PLAYMODE_LOOP = 0x101,
		ALLEGRO_PLAYMODE_BIDIR = 0x102,
		_ALLEGRO_PLAYMODE_STREAM_ONCE = 0x103, /* internal */
		_ALLEGRO_PLAYMODE_STREAM_ONEDIR = 0x104, /* internal */
		ALLEGRO_PLAYMODE_LOOP_ONCE = 0x105,
		_ALLEGRO_PLAYMODE_STREAM_LOOP_ONCE = 0x106, /* internal */
	}

	public enum ALLEGRO_MIXER_QUALITY : c_int
	{
		ALLEGRO_MIXER_QUALITY_POINT   = 0x110,
		ALLEGRO_MIXER_QUALITY_LINEAR  = 0x111,
		ALLEGRO_MIXER_QUALITY_CUBIC   = 0x112
	}

	public const float ALLEGRO_AUDIO_PAN_NONE = -1000.0f;

	public struct ALLEGRO_SAMPLE;

	[CRepr]
	public struct ALLEGRO_SAMPLE_ID
	{
		c_int _index;
		c_int _id;
	}

	public struct ALLEGRO_SAMPLE_INSTANCE;
	public struct ALLEGRO_AUDIO_STREAM;
	public struct ALLEGRO_MIXER;
	public struct ALLEGRO_VOICE;
	public struct ALLEGRO_AUDIO_DEVICE;

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_KCM_AUDIO_SRC
	public struct ALLEGRO_AUDIO_RECORDER;
#endif

	/* Sample functions */
	[CLink] public static extern ALLEGRO_SAMPLE* al_create_sample(void* buf, c_uint samples, c_uint freq, ALLEGRO_AUDIO_DEPTH depth, ALLEGRO_CHANNEL_CONF chan_conf, bool free_buf);
	[CLink] public static extern void al_destroy_sample(ALLEGRO_SAMPLE* spl);

	/* Sample instance functions */
	[CLink] public static extern ALLEGRO_SAMPLE_INSTANCE* al_create_sample_instance(ALLEGRO_SAMPLE* data);
	[CLink] public static extern void al_destroy_sample_instance(ALLEGRO_SAMPLE_INSTANCE* spl);

	[CLink] public static extern c_uint al_get_sample_frequency(ALLEGRO_SAMPLE* spl);
	[CLink] public static extern c_uint al_get_sample_length(ALLEGRO_SAMPLE* spl);
	[CLink] public static extern ALLEGRO_AUDIO_DEPTH al_get_sample_depth(ALLEGRO_SAMPLE* spl);
	[CLink] public static extern ALLEGRO_CHANNEL_CONF al_get_sample_channels(ALLEGRO_SAMPLE* spl);
	[CLink] public static extern void* al_get_sample_data(ALLEGRO_SAMPLE* spl);

	[CLink] public static extern c_uint al_get_sample_instance_frequency(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern c_uint al_get_sample_instance_length(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern c_uint al_get_sample_instance_position(ALLEGRO_SAMPLE_INSTANCE* spl);

	[CLink] public static extern float al_get_sample_instance_speed(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern float al_get_sample_instance_gain(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern float al_get_sample_instance_pan(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern float al_get_sample_instance_time(ALLEGRO_SAMPLE_INSTANCE* spl);

	[CLink] public static extern ALLEGRO_AUDIO_DEPTH al_get_sample_instance_depth(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern ALLEGRO_CHANNEL_CONF al_get_sample_instance_channels(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern ALLEGRO_PLAYMODE al_get_sample_instance_playmode(ALLEGRO_SAMPLE_INSTANCE* spl);

	[CLink] public static extern bool al_get_sample_instance_playing(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern bool al_get_sample_instance_attached(ALLEGRO_SAMPLE_INSTANCE* spl);

	[CLink] public static extern bool al_set_sample_instance_position(ALLEGRO_SAMPLE_INSTANCE* spl, c_uint val);
	[CLink] public static extern bool al_set_sample_instance_length(ALLEGRO_SAMPLE_INSTANCE* spl, c_uint val);

	[CLink] public static extern bool al_set_sample_instance_speed(ALLEGRO_SAMPLE_INSTANCE* spl, float val);
	[CLink] public static extern bool al_set_sample_instance_gain(ALLEGRO_SAMPLE_INSTANCE* spl, float val);
	[CLink] public static extern bool al_set_sample_instance_pan(ALLEGRO_SAMPLE_INSTANCE* spl, float val);

	[CLink] public static extern bool al_set_sample_instance_playmode(ALLEGRO_SAMPLE_INSTANCE* spl, ALLEGRO_PLAYMODE val);

	[CLink] public static extern bool al_set_sample_instance_playing(ALLEGRO_SAMPLE_INSTANCE* spl, bool val);
	[CLink] public static extern bool al_detach_sample_instance(ALLEGRO_SAMPLE_INSTANCE* spl);

	[CLink] public static extern bool al_set_sample(ALLEGRO_SAMPLE_INSTANCE* spl, ALLEGRO_SAMPLE* data);
	[CLink] public static extern ALLEGRO_SAMPLE* al_get_sample(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern bool al_play_sample_instance(ALLEGRO_SAMPLE_INSTANCE* spl);
	[CLink] public static extern bool al_stop_sample_instance(ALLEGRO_SAMPLE_INSTANCE* spl);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_KCM_AUDIO_SRC
	[CLink] public static extern bool al_set_sample_instance_channel_matrix(ALLEGRO_SAMPLE_INSTANCE* spl, float* matrix);
#endif

	/* Stream functions */
	[CLink] public static extern ALLEGRO_AUDIO_STREAM* al_create_audio_stream(size_t buffer_count, c_uint samples, c_uint freq, ALLEGRO_AUDIO_DEPTH depth, ALLEGRO_CHANNEL_CONF chan_conf);
	[CLink] public static extern void al_destroy_audio_stream(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern void al_drain_audio_stream(ALLEGRO_AUDIO_STREAM* stream);

	[CLink] public static extern c_uint al_get_audio_stream_frequency(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern c_uint al_get_audio_stream_length(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern c_uint al_get_audio_stream_fragments(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern c_uint al_get_available_audio_stream_fragments(ALLEGRO_AUDIO_STREAM* stream);

	[CLink] public static extern float al_get_audio_stream_speed(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern float al_get_audio_stream_gain(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern float al_get_audio_stream_pan(ALLEGRO_AUDIO_STREAM* stream);

	[CLink] public static extern ALLEGRO_CHANNEL_CONF al_get_audio_stream_channels(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern ALLEGRO_AUDIO_DEPTH al_get_audio_stream_depth(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern ALLEGRO_PLAYMODE al_get_audio_stream_playmode(ALLEGRO_AUDIO_STREAM* stream);

	[CLink] public static extern bool al_get_audio_stream_playing(ALLEGRO_AUDIO_STREAM* spl);
	[CLink] public static extern bool al_get_audio_stream_attached(ALLEGRO_AUDIO_STREAM* spl);
	[CLink] public static extern uint64_t al_get_audio_stream_played_samples(ALLEGRO_AUDIO_STREAM* stream);

	[CLink] public static extern void* al_get_audio_stream_fragment(ALLEGRO_AUDIO_STREAM* stream);

	[CLink] public static extern bool al_set_audio_stream_speed(ALLEGRO_AUDIO_STREAM* stream, float val);
	[CLink] public static extern bool al_set_audio_stream_gain(ALLEGRO_AUDIO_STREAM* stream, float val);
	[CLink] public static extern bool al_set_audio_stream_pan(ALLEGRO_AUDIO_STREAM* stream, float val);

	[CLink] public static extern bool al_set_audio_stream_playmode(ALLEGRO_AUDIO_STREAM* stream, ALLEGRO_PLAYMODE val);

	[CLink] public static extern bool al_set_audio_stream_playing(ALLEGRO_AUDIO_STREAM* stream, bool val);
	[CLink] public static extern bool al_detach_audio_stream(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern bool al_set_audio_stream_fragment(ALLEGRO_AUDIO_STREAM* stream, void* val);

	[CLink] public static extern bool al_rewind_audio_stream(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern bool al_seek_audio_stream_secs(ALLEGRO_AUDIO_STREAM* stream, double time);
	[CLink] public static extern double al_get_audio_stream_position_secs(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern double al_get_audio_stream_length_secs(ALLEGRO_AUDIO_STREAM* stream);
	[CLink] public static extern bool al_set_audio_stream_loop_secs(ALLEGRO_AUDIO_STREAM* stream, double start, double end);

	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_audio_stream_event_source(ALLEGRO_AUDIO_STREAM* stream);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_KCM_AUDIO_SRC
	[CLink] public static extern bool al_set_audio_stream_channel_matrix(ALLEGRO_AUDIO_STREAM* stream, float* matrix);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM* al_play_audio_stream(char* filename);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM* al_play_audio_stream_f(ALLEGRO_FILE* fp, char* ident);
#endif

	/* Mixer functions */
	[CLink] public static extern ALLEGRO_MIXER* al_create_mixer(c_uint freq, ALLEGRO_AUDIO_DEPTH depth, ALLEGRO_CHANNEL_CONF chan_conf);
	[CLink] public static extern void al_destroy_mixer(ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_attach_sample_instance_to_mixer(ALLEGRO_SAMPLE_INSTANCE* stream, ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_attach_audio_stream_to_mixer(ALLEGRO_AUDIO_STREAM* stream, ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_attach_mixer_to_mixer(ALLEGRO_MIXER* stream, ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_set_mixer_postprocess_callback(ALLEGRO_MIXER* mixer, function void(void* buf, c_uint samples, void* data) cb, void* data);

	[CLink] public static extern c_uint al_get_mixer_frequency(ALLEGRO_MIXER* mixer);
	[CLink] public static extern ALLEGRO_CHANNEL_CONF al_get_mixer_channels(ALLEGRO_MIXER* mixer);
	[CLink] public static extern ALLEGRO_AUDIO_DEPTH al_get_mixer_depth(ALLEGRO_MIXER* mixer);
	[CLink] public static extern ALLEGRO_MIXER_QUALITY al_get_mixer_quality(ALLEGRO_MIXER* mixer);
	[CLink] public static extern float al_get_mixer_gain(ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_get_mixer_playing(ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_get_mixer_attached(ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_mixer_has_attachments(ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_set_mixer_frequency(ALLEGRO_MIXER* mixer, c_uint val);
	[CLink] public static extern bool al_set_mixer_quality(ALLEGRO_MIXER* mixer, ALLEGRO_MIXER_QUALITY val);
	[CLink] public static extern bool al_set_mixer_gain(ALLEGRO_MIXER* mixer, float gain);
	[CLink] public static extern bool al_set_mixer_playing(ALLEGRO_MIXER* mixer, bool val);
	[CLink] public static extern bool al_detach_mixer(ALLEGRO_MIXER* mixer);

	/* Voice functions */
	[CLink] public static extern ALLEGRO_VOICE* al_create_voice(c_uint freq, ALLEGRO_AUDIO_DEPTH depth, ALLEGRO_CHANNEL_CONF chan_conf);
	[CLink] public static extern void al_destroy_voice(ALLEGRO_VOICE* voice);
	[CLink] public static extern bool al_attach_sample_instance_to_voice(ALLEGRO_SAMPLE_INSTANCE* stream, ALLEGRO_VOICE* voice);
	[CLink] public static extern bool al_attach_audio_stream_to_voice(ALLEGRO_AUDIO_STREAM* stream, ALLEGRO_VOICE* voice);
	[CLink] public static extern bool al_attach_mixer_to_voice(ALLEGRO_MIXER* mixer, ALLEGRO_VOICE* voice);
	[CLink] public static extern void al_detach_voice(ALLEGRO_VOICE* voice);

	[CLink] public static extern c_uint al_get_voice_frequency(ALLEGRO_VOICE* voice);
	[CLink] public static extern c_uint al_get_voice_position(ALLEGRO_VOICE* voice);
	[CLink] public static extern ALLEGRO_CHANNEL_CONF al_get_voice_channels(ALLEGRO_VOICE* voice);
	[CLink] public static extern ALLEGRO_AUDIO_DEPTH al_get_voice_depth(ALLEGRO_VOICE* voice);
	[CLink] public static extern bool al_get_voice_playing(ALLEGRO_VOICE* voice);
	[CLink] public static extern bool al_voice_has_attachments(ALLEGRO_VOICE* voice);
	[CLink] public static extern bool al_set_voice_position(ALLEGRO_VOICE* voice, c_uint val);
	[CLink] public static extern bool al_set_voice_playing(ALLEGRO_VOICE* voice, bool val);

	/* Misc. audio functions */
	[CLink] public static extern bool al_install_audio();
	[CLink] public static extern void al_uninstall_audio();
	[CLink] public static extern bool al_is_audio_installed();
	[CLink] public static extern uint32_t al_get_allegro_audio_version();

	[CLink] public static extern size_t al_get_channel_count(ALLEGRO_CHANNEL_CONF conf);
	[CLink] public static extern size_t al_get_audio_depth_size(ALLEGRO_AUDIO_DEPTH conf);

	[CLink] public static extern void al_fill_silence(void* buf, c_uint samples, ALLEGRO_AUDIO_DEPTH depth, ALLEGRO_CHANNEL_CONF chan_conf);

	[CLink] public static extern c_int al_get_num_audio_output_devices();
	[CLink] public static extern ALLEGRO_AUDIO_DEVICE* al_get_audio_output_device(c_int index);
	[CLink] public static extern char* al_get_audio_device_name(ALLEGRO_AUDIO_DEVICE* device);

	/* Simple audio layer */
	[CLink] public static extern bool al_reserve_samples(c_int reserve_samples);
	[CLink] public static extern ALLEGRO_MIXER* al_get_default_mixer();
	[CLink] public static extern bool al_set_default_mixer(ALLEGRO_MIXER* mixer);
	[CLink] public static extern bool al_restore_default_mixer();
	[CLink] public static extern bool al_play_sample(ALLEGRO_SAMPLE* data, float gain, float pan, float speed, ALLEGRO_PLAYMODE loop, ALLEGRO_SAMPLE_ID* ret_id);
	[CLink] public static extern void al_stop_sample(ALLEGRO_SAMPLE_ID* spl_id);
	[CLink] public static extern void al_stop_samples();
	[CLink] public static extern ALLEGRO_VOICE* al_get_default_voice();
	[CLink] public static extern void al_set_default_voice(ALLEGRO_VOICE* voice);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_KCM_AUDIO_SRC
	[CLink] public static extern ALLEGRO_SAMPLE_INSTANCE* al_lock_sample_id(ALLEGRO_SAMPLE_ID* spl_id);
	[CLink] public static extern void al_unlock_sample_id(ALLEGRO_SAMPLE_ID* spl_id);
#endif

	/* File type handlers */
	[CLink] public static extern bool al_register_sample_loader(char* ext, function ALLEGRO_SAMPLE*(char* filename) loader);
	[CLink] public static extern bool al_register_sample_saver(char* ext, function bool(char* filename, ALLEGRO_SAMPLE* spl) saver);
	[CLink] public static extern bool al_register_audio_stream_loader(char* ext, function ALLEGRO_AUDIO_STREAM*(char* filename, size_t buffer_count, c_uint samples) stream_loader);

	[CLink] public static extern bool al_register_sample_loader_f(char* ext, function ALLEGRO_SAMPLE*(ALLEGRO_FILE* fp) loader);
	[CLink] public static extern bool al_register_sample_saver_f(char* ext, function bool(ALLEGRO_FILE* fp, ALLEGRO_SAMPLE* spl) saver);
	[CLink] public static extern bool al_register_audio_stream_loader_f(char* ext, function ALLEGRO_AUDIO_STREAM*(ALLEGRO_FILE* fp, size_t buffer_count, c_uint samples) stream_loader);

	[CLink] public static extern bool al_register_sample_identifier(char* ext, function bool(ALLEGRO_FILE* fp) identifier);

	[CLink] public static extern ALLEGRO_SAMPLE* al_load_sample(char* filename);
	[CLink] public static extern bool al_save_sample(char* filename, ALLEGRO_SAMPLE* spl);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM* al_load_audio_stream(char* filename, size_t buffer_count, c_uint samples);

	[CLink] public static extern ALLEGRO_SAMPLE* al_load_sample_f(ALLEGRO_FILE* fp, char* ident);
	[CLink] public static extern bool al_save_sample_f(ALLEGRO_FILE* fp, char* ident, ALLEGRO_SAMPLE* spl);
	[CLink] public static extern ALLEGRO_AUDIO_STREAM* al_load_audio_stream_f(ALLEGRO_FILE* fp, char* ident, size_t buffer_count, c_uint samples);

	[CLink] public static extern char* al_identify_sample_f(ALLEGRO_FILE* fp);
	[CLink] public static extern char* al_identify_sample(char* filename);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_KCM_AUDIO_SRC
	/* Recording functions */
	[CLink] public static extern ALLEGRO_AUDIO_RECORDER*  al_create_audio_recorder(size_t fragment_count, c_uint samples, c_uint freq, ALLEGRO_AUDIO_DEPTH depth, ALLEGRO_CHANNEL_CONF chan_conf);
	[CLink] public static extern bool al_start_audio_recorder(ALLEGRO_AUDIO_RECORDER* r);
	[CLink] public static extern void al_stop_audio_recorder(ALLEGRO_AUDIO_RECORDER* r);
	[CLink] public static extern bool al_is_audio_recorder_recording(ALLEGRO_AUDIO_RECORDER* r);
	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_audio_recorder_event_source(ALLEGRO_AUDIO_RECORDER* r);
	[CLink] public static extern ALLEGRO_AUDIO_RECORDER_EVENT* al_get_audio_recorder_event(ALLEGRO_EVENT* event);
	[CLink] public static extern void al_destroy_audio_recorder(ALLEGRO_AUDIO_RECORDER* r);
#endif
}