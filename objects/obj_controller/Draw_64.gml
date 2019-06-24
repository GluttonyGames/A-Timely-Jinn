//DRAW GUI
var window_width = window_get_width();
var window_height = window_get_height();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_big_text);
draw_set_alpha(.5);
draw_set_color(c_gray);
if (new_controller) {
	draw_rectangle(window_width/2-800, window_height/2-150, window_width/2+800, window_height/2+150, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(window_width/2, window_width/2-80, "NEW CONTROLLER DETECTED!");
	draw_text(window_width/2, window_width/2, "Press left bumper for player 1");
	draw_text(window_width/2, window_width/2+80, "Press right bumper for player 2");
} else if (menu_active) {
	draw_set_alpha(.5);
	draw_set_color(c_gray);
	draw_rectangle(0, 0, window_width, window_height, false);
	draw_set_color(c_white);
	switch (menu_item_active) {
		case 0:
			draw_set_alpha(1);
			draw_text(window_width/2, window_height/2-200, "-- MENU --");
			draw_text(window_width/2, window_height/2, "- SAVE -");
			draw_set_alpha(.7);
			draw_text(window_width/2, window_height/2+100, "- EXIT -");
			break;
		case 1:
			draw_set_alpha(1);
			draw_text(window_width/2, window_height/2-200, "-- MENU --");
			draw_text(window_width/2, window_height/2+100, "- EXIT -");
			draw_set_alpha(.7);
			draw_text(window_width/2, window_height/2, "- SAVE -");
			break;
	}
}
draw_set_font(fnt_text);
draw_set_color(c_white);
draw_set_alpha(1);