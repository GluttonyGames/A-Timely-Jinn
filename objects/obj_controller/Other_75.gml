show_debug_message("Event = " + async_load[? "event_type"]);        // Debug cocde so you can see which event has been
show_debug_message("Pad = " + string(async_load[? "pad_index"]));   // triggered and the pad associated with it.

switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     // A game pad has been discovered
    var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
    gamepad_set_axis_deadzone(pad, 0.2);       // Set the "deadzone" for the axis
    gamepad_set_button_threshold(pad, 0.1);    // Set the "threshold" for the triggers
    // Setup Gamepad
	new_controller = true;
	new_controller_id = pad;
    break;
	
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
    var pad = async_load[? "pad_index"];       // Get the pad index
    // Notify Player
	if (pad == player1_pad_id) {
		player1_pad_id = -1;
		obj_player1.pad_index = -1;
	} else if (pad == player2_pad_id) {
		player2_pad_id = -1;
		obj_player2.pad_index = -1;
	}
	new_controller = false;
	new_controller_id = -1;
    break;
}