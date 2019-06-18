/// @description Check for button press
if (gamepad_button_check_pressed(new_controller_id, gp_shoulderl)) {
	// Set gamepad to player 1
	obj_player1.pad_index = new_controller_id;
	player1_pad_id = new_controller_id;
	new_controller_id = -1;
	new_controller = false;
} else if (gamepad_button_check_pressed(new_controller_id, gp_shoulderr)) {
	obj_player2.pad_index = new_controller_id;
	player2_pad_id = new_controller_id;
	new_controller_id = -1;
	new_controller = false;
}