using System;
using System.Collections;
using System.Diagnostics;
using System.IO;
using System.Interop;
using System.Text;

using static allegro.allegro;

namespace example;

static class Program
{
	public const int NUM_BUTTONS = 5;

	static int actual_buttons;

	static c_int atexit(function void())
	{
		return 0;
	}

	static void draw_mouse_button(int but, bool down)
	{
		int[NUM_BUTTONS] offset = .(0, 70, 35, 105, 140);
		ALLEGRO_COLOR grey;
		ALLEGRO_COLOR black;
		int x;
		int y;

		x = 400 + offset[but];
		y = 130;

		grey = al_map_rgb(0xe0, 0xe0, 0xe0);
		black = al_map_rgb(0, 0, 0);

		al_draw_filled_rectangle(x, y, x + 27, y + 42, grey);
		al_draw_rectangle(x + 0.5f, y + 0.5f, x + 26.5f, y + 41.5f, black, 0);
		if (down)
		{
			al_draw_filled_rectangle(x + 2, y + 2, x + 25, y + 40, black);
		}
	}

	static int Main(params String[] args)
	{
		ALLEGRO_DISPLAY* display;
		ALLEGRO_BITMAP* cursor;
		ALLEGRO_EVENT_QUEUE* queue;
		ALLEGRO_EVENT event = ?;
		ALLEGRO_FONT* font;
		c_int mx = 0;
		c_int my = 0;
		c_int mz = 0;
		c_int mw = 0;
		c_int mmx = 0;
		c_int mmy = 0;
		c_int mmz = 0;
		c_int mmw = 0;
		c_int precision = 1;
		bool is_in = true;
		bool[NUM_BUTTONS] buttons = .(false, false, false, false, false);
		int i;
		float p = 0.0f;
		ALLEGRO_COLOR black;

		al_install_system(ALLEGRO_VERSION_INT, => atexit);
		defer al_uninstall_system();

		al_install_keyboard();
		defer al_uninstall_keyboard();

		al_install_mouse();
		defer al_uninstall_mouse();

		al_init_primitives_addon();
		al_init_image_addon();
		al_init_font_addon();

		actual_buttons = al_get_mouse_num_buttons();
		if (actual_buttons > NUM_BUTTONS)
			actual_buttons = NUM_BUTTONS;

		al_set_new_display_flags((.)ALLEGRO_DISPLAY_FLAGS.ALLEGRO_RESIZABLE);
		display = al_create_display(640, 480);

		if (display == null)
		{
			Debug.WriteLine("Error creating display\n");
		}

		// Resize the display - this is to excercise the resizing code wrt.
		// the cursor display boundary, which requires some special care on some
		// platforms (such as OSX).
		al_resize_display(display, (.)(640 * 1.5f), (.)(480 * 1.5f));

		al_hide_mouse_cursor(display);

		cursor = al_load_bitmap("data/cursor.tga");
		if (cursor == null)
		{
			Debug.WriteLine("Error loading cursor.tga\n");
		}

		font = al_load_font("data/fixed_font.tga", 1, 0);
		if (font == null)
		{
			Debug.WriteLine("data/fixed_font.tga not found\n");
		}

		black = al_map_rgb_f(0, 0, 0);

		queue = al_create_event_queue();
		al_register_event_source(queue, al_get_mouse_event_source());
		al_register_event_source(queue, al_get_keyboard_event_source());
		al_register_event_source(queue, al_get_display_event_source(display));

		//test_variadic(font, "test");

		while (true)
		{
			if (al_is_event_queue_empty(queue))
			{
				al_clear_to_color(al_map_rgb(0xff, 0xff, 0xc0));
				for (i = 0; i < actual_buttons; i++)
				{
					draw_mouse_button(i, buttons[i]);
				}
				al_draw_bitmap(cursor, mx, my, 0);
				al_set_blender((.)ALLEGRO_BLEND_OPERATIONS.ALLEGRO_ADD, (.)ALLEGRO_BLEND_MODE.ALLEGRO_ONE, (.)ALLEGRO_BLEND_MODE.ALLEGRO_INVERSE_ALPHA);
				/*al_draw_textf(font, black, 5, 5, 0, "dx %i, dy %i, dz %i, dw %i", mmx, mmy, mmz, mmw);
				al_draw_textf(font, black, 5, 25, 0, "x %i, y %i, z %i, w %i", mx, my, mz, mw);
				al_draw_textf(font, black, 5, 45, 0, "p = %g", p);
				al_draw_textf(font, black, 5, 65, 0, is_in ? "in" : "out", 0);
				al_draw_textf(font, black, 5.0f, 85.0f, 0, "wheel precision (PgUp/PgDn) %d", precision);*/
				al_set_blender((.)ALLEGRO_BLEND_OPERATIONS.ALLEGRO_ADD, (.)ALLEGRO_BLEND_MODE.ALLEGRO_ONE, (.)ALLEGRO_BLEND_MODE.ALLEGRO_INVERSE_ALPHA);
				mmx = mmy = mmz = 0;
				al_flip_display();
			}

			al_wait_for_event(queue, &event);
			switch (event.type) {
			case .ALLEGRO_EVENT_MOUSE_AXES:
				mx = event.mouse.x;
				my = event.mouse.y;
				mz = event.mouse.z;
				mw = event.mouse.w;
				mmx = event.mouse.dx;
				mmy = event.mouse.dy;
				mmz = event.mouse.dz;
				mmw = event.mouse.dw;
				p = event.mouse.pressure;
				break;

			case .ALLEGRO_EVENT_MOUSE_BUTTON_DOWN:
				if (event.mouse.button - 1 < NUM_BUTTONS)
				{
					buttons[event.mouse.button - 1] = true;
				}
				p = event.mouse.pressure;
				break;

			case .ALLEGRO_EVENT_MOUSE_BUTTON_UP:
				if (event.mouse.button - 1 < NUM_BUTTONS)
				{
					buttons[event.mouse.button - 1] = false;
				}
				p = event.mouse.pressure;
				break;

			case .ALLEGRO_EVENT_MOUSE_ENTER_DISPLAY:
				is_in = true;
				break;

			case .ALLEGRO_EVENT_MOUSE_LEAVE_DISPLAY:
				is_in = false;
				break;

			case .ALLEGRO_EVENT_KEY_DOWN:
				if (event.keyboard.keycode == (.)ALLEGRO_KEY_CODE.ALLEGRO_KEY_ESCAPE)
				{
					return 1;
				}
				break;

			case .ALLEGRO_EVENT_KEY_CHAR:
				if (event.keyboard.keycode == (.)ALLEGRO_KEY_CODE.ALLEGRO_KEY_PGUP)
				{
					precision++;
					al_set_mouse_wheel_precision(precision);
				}
				else if (event.keyboard.keycode == (.)ALLEGRO_KEY_CODE.ALLEGRO_KEY_PGDN)
				{
					precision--;
					if (precision < 1)
						precision = 1;
					al_set_mouse_wheel_precision(precision);
				}
				break;

			case .ALLEGRO_EVENT_DISPLAY_RESIZE:
				al_acknowledge_resize(event.display.source);
				break;

			case .ALLEGRO_EVENT_DISPLAY_CLOSE:
				return 0;
			default:
				break;
			}
		}

		return 0;
	}
}