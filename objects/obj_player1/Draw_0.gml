/// @description Draw weapon stat gui
if ((held_weapons[# 0, W_ID] != -1) && current_weapon < number_of_weapons) {
	
	if (reload_ >= 0) {
		alpha = (held_weapons[# current_weapon, W_RELOAD]-reload_)/held_weapons[# current_weapon, W_RELOAD]-.25
		alpha = clamp(alpha, 0, 1);
		color = c_gray;
	} else {
		alpha = .8;
		color = c_white
	}
	draw_set_alpha(alpha);
	draw_set_color(color);
	if (pad_index = -1) {
		angle = point_direction(x, y, mouse_x, mouse_y);
	} else {
		if (gamepad_axis_value(pad_index, gp_axisrh) != 0 || gamepad_axis_value(pad_index, gp_axisrh) != 0) {
			angle = point_direction(0, 0, gamepad_axis_value(pad_index, gp_axisrh), gamepad_axis_value(pad_index, gp_axisrv));
		}
	}
	
	if (held_weapons[# current_weapon, W_TYPE] == TYPE_MELEE) {
		var w_draw_distance = held_weapons[# current_weapon, W_DISTANCE]
	} else {
		var w_draw_distance = 40;
	}
		
	var x1 = x-(w_draw_distance); // Bounding box first x pos
	var y1 = y-(w_draw_distance); // Bounding box first y pos
	var x2 = x+(w_draw_distance); // Bounding box second x pos
	var y2 = y+(w_draw_distance); // Bounding box second y pos
	var x3 = x+lengthdir_x(w_draw_distance,angle-(held_weapons[# current_weapon, W_SPREAD]/2)); // Angle start pos x
	var y3 = y+lengthdir_y(w_draw_distance,angle-(held_weapons[# current_weapon, W_SPREAD]/2)); // Angle start pos y
	var x4 = x+lengthdir_x(w_draw_distance,angle+(held_weapons[# current_weapon, W_SPREAD]/2)); // Angle end pos x
	var y4 = y+lengthdir_y(w_draw_distance,angle+(held_weapons[# current_weapon, W_SPREAD]/2)); // Angle end pos y
	draw_arc(x1,y1,x2,y2,x3,y3,x4,y4,24); // Offensive arc
	
	draw_set_alpha(.3);
	draw_set_color(c_black);
	//var x1 = x-(held_weapons[# current_weapon, W_DISTANCE]); // Bounding box first x pos
	//var y1 = y-(held_weapons[# current_weapon, W_DISTANCE]); // Bounding box first y pos
	//var x2 = x+(held_weapons[# current_weapon, W_DISTANCE]); // Bounding box second x pos
	//var y2 = y+(held_weapons[# current_weapon, W_DISTANCE]); // Bounding box second y pos
	var x3 = x+lengthdir_x(held_weapons[# current_weapon, W_DISTANCE],angle-(held_weapons[# current_weapon, W_SHIELD]/2)); // Angle start pos x
	var y3 = y+lengthdir_y(held_weapons[# current_weapon, W_DISTANCE],angle-(held_weapons[# current_weapon, W_SHIELD]/2)); // Angle start pos y
	var x4 = x+lengthdir_x(held_weapons[# current_weapon, W_DISTANCE],angle+(held_weapons[# current_weapon, W_SHIELD]/2)); // Angle end pos x
	var y4 = y+lengthdir_y(held_weapons[# current_weapon, W_DISTANCE],angle+(held_weapons[# current_weapon, W_SHIELD]/2)); // Angle end pos y
	draw_arc(x1,y1,x2,y2,x3,y3,x4,y4,24); // Defensive arc
	
	draw_set_alpha(1);
	draw_set_color(c_white);
}
draw_self();