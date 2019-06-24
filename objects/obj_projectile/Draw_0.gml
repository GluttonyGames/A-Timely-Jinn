/// @description Draw projectile
switch (projectile_type) {
	case 0:
		draw_sprite_ext(spr_arrow, 0, x, y, 1, 1, projectile_direction, c_white, 1);
		break;
}