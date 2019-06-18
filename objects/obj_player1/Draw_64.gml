/// @description GUI
window_width = window_get_width();
window_height = window_get_height();

// Debug drawing
//draw_text(30, 30, gamepad_axis_value(obj_player2.pad_index, gp_axislh));
//draw_text(30, 100, gamepad_axis_value(obj_player2.pad_index, gp_axislv));
//ds_grid_print(held_weapons, 5, 5);

// Hotbar
var bbox_thickness = 8;
var bbox_inner_height = 128;
var distance_to_edge = 16;
var right_edge_fix = 6;
draw_set_alpha(1);
draw_rectangle_color(distance_to_edge, window_height-distance_to_edge, window_width/2-distance_to_edge-right_edge_fix, window_height-bbox_thickness-distance_to_edge, c_black, c_black, c_black, c_black, false);  // Bottom black bar
draw_rectangle_color(distance_to_edge, window_height-distance_to_edge-bbox_inner_height, window_width/2-distance_to_edge-right_edge_fix, window_height-bbox_thickness-distance_to_edge-bbox_inner_height, c_black, c_black, c_black, c_black, false);  // Top black bar

draw_rectangle_color(distance_to_edge, window_height-distance_to_edge, distance_to_edge+bbox_thickness-2, window_height-distance_to_edge-bbox_inner_height-bbox_thickness, c_black, c_black, c_black, c_black, false);  // Left black bar
draw_rectangle_color(window_width/2-distance_to_edge-right_edge_fix-bbox_thickness+2, window_height-distance_to_edge, window_width/2-distance_to_edge-right_edge_fix, window_height-distance_to_edge-bbox_inner_height-bbox_thickness, c_black, c_black, c_black, c_black, false);  // Right black bar

draw_set_alpha(.8); // Main gray rectangle
draw_rectangle_color(distance_to_edge+bbox_thickness-2, window_height-bbox_inner_height-distance_to_edge, window_width/2-distance_to_edge-right_edge_fix-bbox_thickness+2, window_height-distance_to_edge-bbox_thickness, c_gray, c_gray, c_gray, c_gray, false);

draw_set_alpha(.2); // Center white square
draw_rectangle_color(window_width/4-bbox_inner_height/2+6, window_height-distance_to_edge-bbox_inner_height, window_width/4+bbox_inner_height/2-6, window_height-distance_to_edge-bbox_thickness, c_white, c_white, c_white, c_white, false);
draw_set_alpha(1);

if (number_of_weapons != 0) {
	for(var i=0; i < number_of_weapons; i++) {
		var index = held_weapons[# i, W_ID];
		var base_x = window_width/4;
		var base_y = window_height-distance_to_edge-bbox_inner_height/2-4;
		var shift_x = 7*16*current_weapon
		var final_x = (base_x)+(7*16*i)-shift_x
		if ((final_x+7*16) < window_width/2+bbox_thickness*8) {
			draw_sprite_ext(spr_weapon, index, final_x, base_y, 5, 5, 0, c_white, 1);
		}
	}
}

// Healthbar
var healthbar_length = 400;
var healthbar_width = 40;
var distance_between = 30;
draw_set_alpha(1);
draw_rectangle_color(distance_to_edge, window_height-bbox_thickness-distance_to_edge-bbox_inner_height-distance_between, distance_to_edge+healthbar_length, window_height-bbox_thickness-distance_to_edge-bbox_inner_height-distance_between-healthbar_width, c_black, c_black, c_black, c_black, false);
var x_ = round(healthbar_length*(health_/100)) + bbox_thickness
draw_rectangle_color(distance_to_edge+bbox_thickness, window_height-bbox_thickness-distance_to_edge-bbox_inner_height-distance_between-bbox_thickness, x_, window_height-bbox_thickness-distance_to_edge-bbox_inner_height-distance_between-healthbar_width+bbox_thickness, c_blue, c_blue, c_blue, c_blue, false);