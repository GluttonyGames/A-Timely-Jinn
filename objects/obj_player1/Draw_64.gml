/// @description GUI

// Debug drawing
draw_text(10, 10, current_weapon);

var enemy = instance_find(obj_enemy, 0);
var enemy_angle = point_direction(x, y, enemy.x, enemy.y); // Get angle between player and enemy
var enemy_distance = point_distance(x, y, enemy.x, enemy.y); // Get distance between player and enemy
var direction_ = point_direction(x, y, mouse_x, mouse_y); // Get direction of mouse from player
draw_text(10, 25, enemy_angle);
draw_text(10, 40, enemy_distance);
draw_text(10, 55, direction_);

// Hotbar
draw_set_alpha(1); // Top black bar
draw_rectangle_color(0, view_get_hport(0)-26, view_get_wport(0)-1, view_get_hport(0)-24-1, c_black, c_black, c_black, c_black, false);
draw_set_alpha(.8); // Main gray rectangle
draw_rectangle_color(0, view_get_hport(0)-24, view_get_wport(0)-1, view_get_hport(0)-1, c_gray, c_gray, c_gray, c_gray, false);
draw_set_alpha(.2); // Center white square
draw_rectangle_color((view_get_wport(0)/2)-12, view_get_hport(0)-24, (view_get_wport(0)/2)+12-1, view_get_hport(0)-1, c_white, c_white, c_white, c_white, false);
draw_set_alpha(1);

if (number_of_weapons != 0) {
	for(var i=0; i < number_of_weapons; i++) {
		var index = held_weapons[# i, W_ID];
		var base_x = view_get_wport(0)/2;
		var base_y = view_get_hport(0)-12;
		var shift_x = 22*current_weapon
		var final_x = (base_x)+(22*i)-shift_x
		if ((final_x+8) < view_get_wport(0)) {
			draw_sprite_ext(spr_weapon, index, final_x, base_y, 1, 1, 0, c_white, 1);
		}
	}
}

// Healthbar
draw_set_alpha(1);
draw_rectangle_color(2, view_get_hport(0)-28, 54, view_get_hport(0)-34, c_black, c_black, c_black, c_black, false);
var x_ = round(53*(health_/100))
draw_rectangle_color(3, view_get_hport(0)-29, x_, view_get_hport(0)-33, c_blue, c_blue, c_blue, c_blue, false);