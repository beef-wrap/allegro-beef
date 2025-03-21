using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public struct ALLEGRO_FILECHOOSER;

	public struct ALLEGRO_TEXTLOG;

	public struct ALLEGRO_MENU;

	[CRepr]
	public struct ALLEGRO_MENU_INFO
	{
		char* caption;
		uint16_t id;
		c_int flags;
		ALLEGRO_BITMAP* icon;
	}

	// #define ALLEGRO_MENU_SEPARATOR             { NULL,         -1, 0, NULL }
	// #define ALLEGRO_START_OF_MENU(caption, id) { caption "->", id, 0, NULL }
	// #define ALLEGRO_END_OF_MENU                { NULL,          0, 0, NULL }

	[CLink] public static extern bool al_init_native_dialog_addon();
	[CLink] public static extern bool al_is_native_dialog_addon_initialized();
	[CLink] public static extern void al_shutdown_native_dialog_addon();

	[CLink] public static extern ALLEGRO_FILECHOOSER* al_create_native_file_dialog(char* initial_path, char* title, char* patterns, c_int mode);
	[CLink] public static extern bool al_show_native_file_dialog(ALLEGRO_DISPLAY* display, ALLEGRO_FILECHOOSER* dialog);
	[CLink] public static extern c_int al_get_native_file_dialog_count(ALLEGRO_FILECHOOSER* dialog);
	[CLink] public static extern char* al_get_native_file_dialog_path(ALLEGRO_FILECHOOSER* dialog, size_t index);
	[CLink] public static extern void al_destroy_native_file_dialog(ALLEGRO_FILECHOOSER* dialog);

	[CLink] public static extern c_int al_show_native_message_box(ALLEGRO_DISPLAY* display, char* title, char* heading, char* text, char* buttons, c_int flags);

	[CLink] public static extern ALLEGRO_TEXTLOG* al_open_native_text_log(char* title, c_int flags);
	[CLink] public static extern void al_close_native_text_log(ALLEGRO_TEXTLOG* textlog);
	[CLink] public static extern void al_append_native_text_log(ALLEGRO_TEXTLOG* textlog, char* format, ...);
	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_native_text_log_event_source(ALLEGRO_TEXTLOG* textlog);

	/* creating/modifying menus */
	[CLink] public static extern ALLEGRO_MENU* al_create_menu();
	[CLink] public static extern ALLEGRO_MENU* al_create_popup_menu();
	[CLink] public static extern ALLEGRO_MENU* al_build_menu(ALLEGRO_MENU_INFO* info);
	[CLink] public static extern c_int al_append_menu_item(ALLEGRO_MENU* parent, char* title, uint16_t id, c_int flags, ALLEGRO_BITMAP* icon, ALLEGRO_MENU* submenu);
	[CLink] public static extern c_int al_insert_menu_item(ALLEGRO_MENU* parent, c_int pos, char* title, uint16_t id, c_int flags, ALLEGRO_BITMAP* icon, ALLEGRO_MENU* submenu);
	[CLink] public static extern bool al_remove_menu_item(ALLEGRO_MENU* menu, c_int pos);
	[CLink] public static extern ALLEGRO_MENU* al_clone_menu(ALLEGRO_MENU* menu);
	[CLink] public static extern ALLEGRO_MENU* al_clone_menu_for_popup(ALLEGRO_MENU* menu);
	[CLink] public static extern void al_destroy_menu(ALLEGRO_MENU* menu);

	/* properties */
	[CLink] public static extern char* al_get_menu_item_caption(ALLEGRO_MENU* menu, c_int pos);
	[CLink] public static extern void al_set_menu_item_caption(ALLEGRO_MENU* menu, c_int pos, char* caption);
	[CLink] public static extern c_int al_get_menu_item_flags(ALLEGRO_MENU* menu, c_int pos);
	[CLink] public static extern void al_set_menu_item_flags(ALLEGRO_MENU* menu, c_int pos, c_int flags);
	[CLink] public static extern ALLEGRO_BITMAP* al_get_menu_item_icon(ALLEGRO_MENU* menu, c_int pos);
	[CLink] public static extern void al_set_menu_item_icon(ALLEGRO_MENU* menu, c_int pos, ALLEGRO_BITMAP* icon);

#if ALLEGRO_UNSTABLE || ALLEGRO_INTERNAL_UNSTABLE || ALLEGRO_NATIVE_DIALOG_SRC
	[CLink] public static extern c_int al_toggle_menu_item_flags(ALLEGRO_MENU *menu, c_int pos, c_int flags);
#endif

	/* querying menus */
	[CLink] public static extern ALLEGRO_MENU* al_find_menu(ALLEGRO_MENU* haystack, uint16_t id);
	[CLink] public static extern bool al_find_menu_item(ALLEGRO_MENU* haystack, uint16_t id, ALLEGRO_MENU** menu, c_int* index);

	/* menu events */
	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_get_default_menu_event_source();
	[CLink] public static extern ALLEGRO_EVENT_SOURCE* al_enable_menu_event_source(ALLEGRO_MENU* menu);
	[CLink] public static extern void al_disable_menu_event_source(ALLEGRO_MENU* menu);

	/* displaying menus */
	[CLink] public static extern ALLEGRO_MENU* al_get_display_menu(ALLEGRO_DISPLAY* display);
	[CLink] public static extern bool al_set_display_menu(ALLEGRO_DISPLAY* display, ALLEGRO_MENU* menu);
	[CLink] public static extern bool al_popup_menu(ALLEGRO_MENU* popup, ALLEGRO_DISPLAY* display);
	[CLink] public static extern ALLEGRO_MENU* al_remove_display_menu(ALLEGRO_DISPLAY* display);

	[CLink] public static extern uint32_t al_get_allegro_native_dialog_version();

	public enum ALLEGRO_FILECHOOSER_OPTIONS : c_int
	{
		ALLEGRO_FILECHOOSER_FILE_MUST_EXIST = 1,
		ALLEGRO_FILECHOOSER_SAVE            = 2,
		ALLEGRO_FILECHOOSER_FOLDER          = 4,
		ALLEGRO_FILECHOOSER_PICTURES        = 8,
		ALLEGRO_FILECHOOSER_SHOW_HIDDEN     = 16,
		ALLEGRO_FILECHOOSER_MULTIPLE        = 32
	}

	public enum ALLEGRO_MESSAGEBOX : c_int
	{
		ALLEGRO_MESSAGEBOX_WARN             = 1 << 0,
		ALLEGRO_MESSAGEBOX_ERROR            = 1 << 1,
		ALLEGRO_MESSAGEBOX_OK_CANCEL        = 1 << 2,
		ALLEGRO_MESSAGEBOX_YES_NO           = 1 << 3,
		ALLEGRO_MESSAGEBOX_QUESTION         = 1 << 4
	}

	public enum ALLEGRO_TEXTLOG_OPTIONS : c_int
	{
		ALLEGRO_TEXTLOG_NO_CLOSE            = 1 << 0,
		ALLEGRO_TEXTLOG_MONOSPACE           = 1 << 1
	}

	public enum ALLEGRO_NATIVE_DIALOG_EVENT : c_int
	{
		ALLEGRO_EVENT_NATIVE_DIALOG_CLOSE   = 600,
		ALLEGRO_EVENT_MENU_CLICK            = 601
	}

	public enum ALLEGRO_MENU_ITEM_STATE : c_int
	{
		ALLEGRO_MENU_ITEM_ENABLED            = 0,
		ALLEGRO_MENU_ITEM_CHECKBOX           = 1,
		ALLEGRO_MENU_ITEM_CHECKED            = 2,
		ALLEGRO_MENU_ITEM_DISABLED           = 4
	}
}