using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct ALLEGRO_CONFIG;
	public struct ALLEGRO_CONFIG_SECTION;
	public struct ALLEGRO_CONFIG_ENTRY;

	[CLink] public static extern ALLEGRO_CONFIG* al_create_config();
	[CLink] public static extern void al_add_config_section(ALLEGRO_CONFIG* config, char* name);
	[CLink] public static extern void al_set_config_value(ALLEGRO_CONFIG* config, char* section, char* key, char* value);
	[CLink] public static extern void al_add_config_comment(ALLEGRO_CONFIG* config, char* section, char* comment);
	[CLink] public static extern char* al_get_config_value(ALLEGRO_CONFIG* config, char* section, char* key);
	[CLink] public static extern ALLEGRO_CONFIG* al_load_config_file(char* filename);
	[CLink] public static extern ALLEGRO_CONFIG* al_load_config_file_f(ALLEGRO_FILE* filename);
	[CLink] public static extern bool al_save_config_file(char* filename, ALLEGRO_CONFIG* config);
	[CLink] public static extern bool al_save_config_file_f(ALLEGRO_FILE* file, ALLEGRO_CONFIG* config);
	[CLink] public static extern void al_merge_config_into(ALLEGRO_CONFIG* master, ALLEGRO_CONFIG* add);
	[CLink] public static extern ALLEGRO_CONFIG* al_merge_config(ALLEGRO_CONFIG* cfg1, ALLEGRO_CONFIG* cfg2);
	[CLink] public static extern void al_destroy_config(ALLEGRO_CONFIG* config);
	[CLink] public static extern bool al_remove_config_section(ALLEGRO_CONFIG* config, char* section);
	[CLink] public static extern bool al_remove_config_key(ALLEGRO_CONFIG* config, char* section, char* key);
	[CLink] public static extern char* al_get_first_config_section(ALLEGRO_CONFIG* config, ALLEGRO_CONFIG_SECTION** iterator);
	[CLink] public static extern char* al_get_next_config_section(ALLEGRO_CONFIG_SECTION** iterator);
	[CLink] public static extern char* al_get_first_config_entry(ALLEGRO_CONFIG* config, char* section, ALLEGRO_CONFIG_ENTRY** iterator);
	[CLink] public static extern char* al_get_next_config_entry(ALLEGRO_CONFIG_ENTRY** iterator);

}