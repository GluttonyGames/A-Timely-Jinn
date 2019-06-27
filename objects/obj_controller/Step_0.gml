/// @description Check for button press

// Assign gamepad id's
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

// Toggle menu
if (gamepad_button_check_pressed(player1_pad_id, gp_start)||gamepad_button_check_pressed(player2_pad_id, gp_start)||keyboard_check_pressed(vk_escape)) {
	menu_active = !menu_active
}

if (menu_active) {
	if (gamepad_button_check_pressed(player1_pad_id, gp_axislv)>0||gamepad_button_check_pressed(player2_pad_id, gp_axislv)>0||keyboard_check_pressed(vk_up)) {
		menu_item_active += 1
		if (menu_item_active > 1) {
			menu_item_active = 0;
		}
	} else if (gamepad_button_check_pressed(player1_pad_id, gp_axislv)<0||gamepad_button_check_pressed(player2_pad_id, gp_axislv)<0||keyboard_check_pressed(vk_down)) {
		menu_item_active -= 1
		if (menu_item_active < 0) {
			menu_item_active = 1;
		}
	} else if (gamepad_button_check_pressed(player1_pad_id, gp_face1)||gamepad_button_check_pressed(player2_pad_id, gp_face1)||keyboard_check_pressed(vk_enter)) {
		switch (menu_item_active) {
			case 0:
				save_world_objects(global.world_id, global.tile_id);
				game_end();
				break;
			case 1:
				game_end();
				break;
		}
	}
}