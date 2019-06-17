/// @description draw health
if (health_ > 0) {
	draw_text(x, y+25, health_);
	draw_self();
} else {
	draw_sprite_ext(spr_enemy, 0, x, y, .5, .5, 0, c_white, .7)
}