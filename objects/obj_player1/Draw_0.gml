/// @description Draw weapon stat gui
if ((held_weapons[# 0, 0] != -1) && current_weapon < number_of_weapons) {
	draw_set_alpha(.5);
	if (held_weapons[# current_weapon, 2] != 360) {
		var x1 = x-(held_weapons[# current_weapon, 4]/2);
		var y1 = y-(held_weapons[# current_weapon, 4]/2);
		var x2 = x+(held_weapons[# current_weapon, 4]/2);
		var y2 = y+(held_weapons[# current_weapon, 4]/2);
		var angle = point_direction(x, y, mouse_x, mouse_y);
		var x3 = x+lengthdir_x(held_weapons[# current_weapon, 4],angle-(held_weapons[# current_weapon, 2]/2));
		var y3 = y+lengthdir_y(held_weapons[# current_weapon, 4],angle-(held_weapons[# current_weapon, 2]/2));
		var x4 = x+lengthdir_x(held_weapons[# current_weapon, 4],angle+(held_weapons[# current_weapon, 2]/2));
		var y4 = y+lengthdir_y(held_weapons[# current_weapon, 4],angle+(held_weapons[# current_weapon, 2]/2));
		draw_arc(x1,y1,x2,y2,x3,y3,x4,y4,24); // Offensive arc
	} else {
		var rad = held_weapons[# current_weapon, 4]/2;
		draw_circle_color(x, y, rad, c_white, c_white, true);
	}
	draw_set_alpha(1);
}
draw_self();