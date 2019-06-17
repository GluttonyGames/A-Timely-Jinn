/// @description Draw weapon stat gui
if ((held_weapons[# 0, W_ID] != -1) && current_weapon < number_of_weapons) {
	draw_set_alpha(.5);
	if (held_weapons[# current_weapon, W_SPREAD] != 360) {
		var angle = point_direction(x, y, mouse_x, mouse_y);		
		var x1 = x-(held_weapons[# current_weapon, W_DISTANCE]); // Bounding box first x pos
		var y1 = y-(held_weapons[# current_weapon, W_DISTANCE]); // Bounding box first y pos
		var x2 = x+(held_weapons[# current_weapon, W_DISTANCE]); // Bounding box second x pos
		var y2 = y+(held_weapons[# current_weapon, W_DISTANCE]); // Bounding box second y pos
		var x3 = x+lengthdir_x(held_weapons[# current_weapon, W_DISTANCE],angle-(held_weapons[# current_weapon, W_SPREAD]/2)); // Angle start pos x
		var y3 = y+lengthdir_y(held_weapons[# current_weapon, W_DISTANCE],angle-(held_weapons[# current_weapon, W_SPREAD]/2)); // Angle start pos y
		var x4 = x+lengthdir_x(held_weapons[# current_weapon, W_DISTANCE],angle+(held_weapons[# current_weapon, W_SPREAD]/2)); // Angle end pos x
		var y4 = y+lengthdir_y(held_weapons[# current_weapon, W_DISTANCE],angle+(held_weapons[# current_weapon, W_SPREAD]/2)); // Angle end pos y
		draw_arc(x1,y1,x2,y2,x3,y3,x4,y4,24); // Offensive arc
	} else {
		var rad = held_weapons[# current_weapon, W_DISTANCE];
		draw_circle_color(x, y, rad, c_white, c_white, true);
	}
	draw_set_alpha(1);
}
draw_self();