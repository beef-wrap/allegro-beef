using System;
using System.Interop;

namespace allegro;

extension allegro
{
	public enum ALLEGRO_PRIM_TYPE : c_int
	{
		ALLEGRO_PRIM_LINE_LIST,
		ALLEGRO_PRIM_LINE_STRIP,
		ALLEGRO_PRIM_LINE_LOOP,
		ALLEGRO_PRIM_TRIANGLE_LIST,
		ALLEGRO_PRIM_TRIANGLE_STRIP,
		ALLEGRO_PRIM_TRIANGLE_FAN,
		ALLEGRO_PRIM_POINT_LIST,
		ALLEGRO_PRIM_NUM_TYPES
	}

	public const c_int ALLEGRO_PRIM_MAX_USER_ATTR = _ALLEGRO_PRIM_MAX_USER_ATTR;

	public enum ALLEGRO_PRIM_ATTR : c_int
	{
		ALLEGRO_PRIM_POSITION = 1,
		ALLEGRO_PRIM_COLOR_ATTR,
		ALLEGRO_PRIM_TEX_COORD,
		ALLEGRO_PRIM_TEX_COORD_PIXEL,
		ALLEGRO_PRIM_USER_ATTR,
		ALLEGRO_PRIM_ATTR_NUM = ALLEGRO_PRIM_USER_ATTR + ALLEGRO_PRIM_MAX_USER_ATTR
	}

	public enum ALLEGRO_PRIM_STORAGE : c_int
	{
		ALLEGRO_PRIM_FLOAT_2,
		ALLEGRO_PRIM_FLOAT_3,
		ALLEGRO_PRIM_SHORT_2,
		ALLEGRO_PRIM_FLOAT_1,
		ALLEGRO_PRIM_FLOAT_4,
		ALLEGRO_PRIM_UBYTE_4,
		ALLEGRO_PRIM_SHORT_4,
		ALLEGRO_PRIM_NORMALIZED_UBYTE_4,
		ALLEGRO_PRIM_NORMALIZED_SHORT_2,
		ALLEGRO_PRIM_NORMALIZED_SHORT_4,
		ALLEGRO_PRIM_NORMALIZED_USHORT_2,
		ALLEGRO_PRIM_NORMALIZED_USHORT_4,
		ALLEGRO_PRIM_HALF_FLOAT_2,
		ALLEGRO_PRIM_HALF_FLOAT_4
	}

	[AllowDuplicates]
	public enum ALLEGRO_LINE_JOIN : c_int
	{
		ALLEGRO_LINE_JOIN_NONE,
		ALLEGRO_LINE_JOIN_BEVEL,
		ALLEGRO_LINE_JOIN_ROUND,
		ALLEGRO_LINE_JOIN_MITER,
		ALLEGRO_LINE_JOIN_MITRE = ALLEGRO_LINE_JOIN_MITER
	}

	public enum ALLEGRO_LINE_CAP : c_int
	{
		ALLEGRO_LINE_CAP_NONE,
		ALLEGRO_LINE_CAP_SQUARE,
		ALLEGRO_LINE_CAP_ROUND,
		ALLEGRO_LINE_CAP_TRIANGLE,
		ALLEGRO_LINE_CAP_CLOSED
	}

	public enum ALLEGRO_PRIM_BUFFER_FLAGS : c_int
	{
		ALLEGRO_PRIM_BUFFER_STREAM       = 0x01,
		ALLEGRO_PRIM_BUFFER_STATIC       = 0x02,
		ALLEGRO_PRIM_BUFFER_DYNAMIC      = 0x04,
		ALLEGRO_PRIM_BUFFER_READWRITE    = 0x08
	}

	public const c_int ALLEGRO_VERTEX_CACHE_SIZE = 256;

	public const c_int ALLEGRO_PRIM_QUALITY = 10;

	[CRepr]
	public struct ALLEGRO_VERTEX_ELEMENT
	{
		c_int attribute;
		c_int storage;
		c_int offset;
	}

	public struct ALLEGRO_VERTEX_DECL;

	[CRepr]
	public struct ALLEGRO_VERTEX
	{
		float x, y, z;
		float u, v;
		ALLEGRO_COLOR color;
	}

	public struct ALLEGRO_VERTEX_BUFFER;

	public struct ALLEGRO_INDEX_BUFFER;

	[CLink] public static extern uint32_t al_get_allegro_primitives_version();

	/*
	* Primary Functions
	*/
	[CLink] public static extern bool al_init_primitives_addon();
	[CLink] public static extern bool al_is_primitives_addon_initialized();
	[CLink] public static extern void al_shutdown_primitives_addon();
	[CLink] public static extern c_int al_draw_prim(void* vtxs, ALLEGRO_VERTEX_DECL* decl, ALLEGRO_BITMAP* texture, c_int start, c_int end, c_int type);
	[CLink] public static extern c_int al_draw_indexed_prim(void* vtxs, ALLEGRO_VERTEX_DECL* decl, ALLEGRO_BITMAP* texture, c_int* indices, c_int num_vtx, c_int type);
	[CLink] public static extern c_int al_draw_vertex_buffer(ALLEGRO_VERTEX_BUFFER* vertex_buffer, ALLEGRO_BITMAP* texture, c_int start, c_int end, c_int type);
	[CLink] public static extern c_int al_draw_indexed_buffer(ALLEGRO_VERTEX_BUFFER* vertex_buffer, ALLEGRO_BITMAP* texture, ALLEGRO_INDEX_BUFFER* index_buffer, c_int start, c_int end, c_int type);

	[CLink] public static extern ALLEGRO_VERTEX_DECL* al_create_vertex_decl(ALLEGRO_VERTEX_ELEMENT* elements, c_int stride);
	[CLink] public static extern void al_destroy_vertex_decl(ALLEGRO_VERTEX_DECL* decl);

	/*
	* Vertex buffers
	*/
	[CLink] public static extern ALLEGRO_VERTEX_BUFFER* al_create_vertex_buffer(ALLEGRO_VERTEX_DECL* decl, void* initial_data, c_int num_vertices, c_int flags);
	[CLink] public static extern void al_destroy_vertex_buffer(ALLEGRO_VERTEX_BUFFER* buffer);
	[CLink] public static extern void* al_lock_vertex_buffer(ALLEGRO_VERTEX_BUFFER* buffer, c_int offset, c_int length, c_int flags);
	[CLink] public static extern void al_unlock_vertex_buffer(ALLEGRO_VERTEX_BUFFER* buffer);
	[CLink] public static extern c_int al_get_vertex_buffer_size(ALLEGRO_VERTEX_BUFFER* buffer);

	/*
	* Index buffers
	*/
	[CLink] public static extern ALLEGRO_INDEX_BUFFER* al_create_index_buffer(c_int index_size, void* initial_data, c_int num_indices, c_int flags);
	[CLink] public static extern void al_destroy_index_buffer(ALLEGRO_INDEX_BUFFER* buffer);
	[CLink] public static extern void* al_lock_index_buffer(ALLEGRO_INDEX_BUFFER* buffer, c_int offset, c_int length, c_int flags);
	[CLink] public static extern void al_unlock_index_buffer(ALLEGRO_INDEX_BUFFER* buffer);
	[CLink] public static extern c_int al_get_index_buffer_size(ALLEGRO_INDEX_BUFFER* buffer);

	/*
	* Utilities for high level primitives.
	*/
	[CLink] public static extern bool al_triangulate_polygon(float* vertices, size_t vertex_stride, c_int* vertex_counts, function void(c_int, c_int, c_int, void*) emit_triangle, void* userdata);

	/*
	* Custom primitives
	*/
	[CLink] public static extern void al_draw_soft_triangle(ALLEGRO_VERTEX* v1, ALLEGRO_VERTEX* v2, ALLEGRO_VERTEX* v3, uintptr_t state, function void(uintptr_t, ALLEGRO_VERTEX*, ALLEGRO_VERTEX*, ALLEGRO_VERTEX*) init, function void(uintptr_t, c_int, c_int, c_int, c_int) first, function void(uintptr_t, c_int) step, function void(uintptr_t, c_int, c_int, c_int) draw);

	[CLink] public static extern void al_draw_soft_line(ALLEGRO_VERTEX* v1, ALLEGRO_VERTEX* v2, uintptr_t state, function void(uintptr_t, c_int, c_int, ALLEGRO_VERTEX*, ALLEGRO_VERTEX*) first, function void(uintptr_t, c_int) step, function void(uintptr_t, c_int, c_int) draw);

	/*
	*High level primitives
	*/
	[CLink] public static extern void al_draw_line(float x1, float y1, float x2, float y2, ALLEGRO_COLOR color, float thickness);
	[CLink] public static extern void al_draw_triangle(float x1, float y1, float x2, float y2, float x3, float y3, ALLEGRO_COLOR color, float thickness);
	[CLink] public static extern void al_draw_rectangle(float x1, float y1, float x2, float y2, ALLEGRO_COLOR color, float thickness);
	[CLink] public static extern void al_draw_rounded_rectangle(float x1, float y1, float x2, float y2, float rx, float ry, ALLEGRO_COLOR color, float thickness);

	[CLink] public static extern void al_calculate_arc(float* dest, c_int stride, float cx, float cy, float rx, float ry, float start_theta, float delta_theta, float thickness, c_int num_points);
	[CLink] public static extern void al_draw_circle(float cx, float cy, float r, ALLEGRO_COLOR color, float thickness);
	[CLink] public static extern void al_draw_ellipse(float cx, float cy, float rx, float ry, ALLEGRO_COLOR color, float thickness);
	[CLink] public static extern void al_draw_arc(float cx, float cy, float r, float start_theta, float delta_theta, ALLEGRO_COLOR color, float thickness);
	[CLink] public static extern void al_draw_elliptical_arc(float cx, float cy, float rx, float ry, float start_theta, float delta_theta, ALLEGRO_COLOR color, float thickness);
	[CLink] public static extern void al_draw_pieslice(float cx, float cy, float r, float start_theta, float delta_theta, ALLEGRO_COLOR color, float thickness);

	[CLink] public static extern void al_calculate_spline(float* dest, c_int stride, float[8] points, float thickness, c_int num_segments);
	[CLink] public static extern void al_draw_spline(float[8] points, ALLEGRO_COLOR color, float thickness);

	[CLink] public static extern void al_calculate_ribbon(float* dest, c_int dest_stride, float* points, c_int points_stride, float thickness, c_int num_segments);
	[CLink] public static extern void al_draw_ribbon(float* points, c_int points_stride, ALLEGRO_COLOR color, float thickness, c_int num_segments);

	[CLink] public static extern void al_draw_filled_triangle(float x1, float y1, float x2, float y2, float x3, float y3, ALLEGRO_COLOR color);
	[CLink] public static extern void al_draw_filled_rectangle(float x1, float y1, float x2, float y2, ALLEGRO_COLOR color);
	[CLink] public static extern void al_draw_filled_ellipse(float cx, float cy, float rx, float ry, ALLEGRO_COLOR color);
	[CLink] public static extern void al_draw_filled_circle(float cx, float cy, float r, ALLEGRO_COLOR color);
	[CLink] public static extern void al_draw_filled_pieslice(float cx, float cy, float r, float start_theta, float delta_theta, ALLEGRO_COLOR color);
	[CLink] public static extern void al_draw_filled_rounded_rectangle(float x1, float y1, float x2, float y2, float rx, float ry, ALLEGRO_COLOR color);

	[CLink] public static extern void al_draw_polyline(float* vertices, c_int vertex_stride, c_int vertex_count, c_int join_style, c_int cap_style, ALLEGRO_COLOR color, float thickness, float miter_limit);

	[CLink] public static extern void al_draw_polygon(float* vertices, c_int vertex_count, c_int join_style, ALLEGRO_COLOR color, float thickness, float miter_limit);
	[CLink] public static extern void al_draw_filled_polygon(float* vertices, c_int vertex_count, ALLEGRO_COLOR color);
	[CLink] public static extern void al_draw_filled_polygon_with_holes(float* vertices, c_int* vertex_counts, ALLEGRO_COLOR color);
}