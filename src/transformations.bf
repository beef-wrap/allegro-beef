using System;
using System.Interop;

namespace allegro;

extension allegro
{
	[CRepr]
	public struct ALLEGRO_TRANSFORM
	{
		float[4][4] m;
	}

	/* Transformations*/
	[CLink] public static extern void al_use_transform(ALLEGRO_TRANSFORM* trans);
	[CLink] public static extern void al_use_projection_transform(ALLEGRO_TRANSFORM* trans);
	[CLink] public static extern void al_copy_transform(ALLEGRO_TRANSFORM* dest, ALLEGRO_TRANSFORM* src);
	[CLink] public static extern void al_identity_transform(ALLEGRO_TRANSFORM* trans);
	[CLink] public static extern void al_build_transform(ALLEGRO_TRANSFORM* trans, float x, float y, float sx, float sy, float theta);
	[CLink] public static extern void al_build_camera_transform(ALLEGRO_TRANSFORM* trans, float position_x, float position_y, float position_z, float look_x, float look_y, float look_z, float up_x, float up_y, float up_z);
	[CLink] public static extern void al_translate_transform(ALLEGRO_TRANSFORM* trans, float x, float y);
	[CLink] public static extern void al_translate_transform_3d(ALLEGRO_TRANSFORM* trans, float x, float y, float z);
	[CLink] public static extern void al_rotate_transform(ALLEGRO_TRANSFORM* trans, float theta);
	[CLink] public static extern void al_rotate_transform_3d(ALLEGRO_TRANSFORM* trans, float x, float y, float z, float angle);
	[CLink] public static extern void al_scale_transform(ALLEGRO_TRANSFORM* trans, float sx, float sy);
	[CLink] public static extern void al_scale_transform_3d(ALLEGRO_TRANSFORM* trans, float sx, float sy, float sz);
	[CLink] public static extern void al_transform_coordinates(ALLEGRO_TRANSFORM* trans, float* x, float* y);
	[CLink] public static extern void al_transform_coordinates_3d(ALLEGRO_TRANSFORM* trans, float* x, float* y, float* z);
	[CLink] public static extern void al_transform_coordinates_4d(ALLEGRO_TRANSFORM* trans, float* x, float* y, float* z, float* w);
	[CLink] public static extern void al_transform_coordinates_3d_projective(ALLEGRO_TRANSFORM* trans, float* x, float* y, float* z);
	[CLink] public static extern void al_compose_transform(ALLEGRO_TRANSFORM* trans, ALLEGRO_TRANSFORM* other);
	[CLink] public static extern ALLEGRO_TRANSFORM* al_get_current_transform();
	[CLink] public static extern ALLEGRO_TRANSFORM* al_get_current_inverse_transform();
	[CLink] public static extern ALLEGRO_TRANSFORM* al_get_current_projection_transform();
	[CLink] public static extern void al_invert_transform(ALLEGRO_TRANSFORM* trans);
	[CLink] public static extern void al_transpose_transform(ALLEGRO_TRANSFORM* trans);
	[CLink] public static extern c_int al_check_inverse(ALLEGRO_TRANSFORM* trans, float tol);
	[CLink] public static extern void al_orthographic_transform(ALLEGRO_TRANSFORM* trans, float left, float top, float n, float right, float bottom, float f);
	[CLink] public static extern void al_perspective_transform(ALLEGRO_TRANSFORM* trans, float left, float top, float n, float right, float bottom, float f);
	[CLink] public static extern void al_horizontal_shear_transform(ALLEGRO_TRANSFORM* trans, float theta);
	[CLink] public static extern void al_vertical_shear_transform(ALLEGRO_TRANSFORM* trans, float theta);
}