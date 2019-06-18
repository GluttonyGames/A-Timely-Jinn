//DRAW GUI
if (new_controller) {
	draw_set_alpha(.5);
	draw_set_color(c_gray);
	draw_rectangle(window_get_width()/2-800, window_get_height()/2-150, window_get_width()/2+800, window_get_height()/2+150, false);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_big_text);
	draw_text(window_get_width()/2, window_get_height()/2-80, "NEW CONTROLLER DETECTED!");
	draw_text(window_get_width()/2, window_get_height()/2, "Press left bumper for player 1");
	draw_text(window_get_width()/2, window_get_height()/2+80, "Press right bumper for player 2");
	draw_set_font(fnt_text);
}