/// @description Move and do other stuff
if (obj_controller.menu_active) exit;
var _x_input, _y_input

if (pad_index = -1) {
	_x_input = keyboard_check(vk_right) - keyboard_check(vk_left);
	_y_input = keyboard_check(vk_down) - keyboard_check(vk_up);
} else {
	_x_input = gamepad_axis_value(pad_index, gp_axislh);
	_y_input = gamepad_axis_value(pad_index, gp_axislv);
}

x_speed_ += _x_input * acceleration_;
y_speed_ += _y_input * acceleration_;

var _speed = point_distance(0,0, x_speed_, y_speed_);
var _direction = point_direction(0,0, x_speed_, y_speed_);

if (_speed > max_speed_) {
	x_speed_ = lengthdir_x(max_speed_, _direction);
	y_speed_ = lengthdir_y(max_speed_, _direction);
}

if (_x_input == 0) {
	x_speed_ = lerp(x_speed_, 0, friction_);
}

if (_y_input == 0) {
	y_speed_ = lerp(y_speed_, 0, friction_);
}

if (_x_input == 0 && _y_input == 0) {
	image_speed = 0;
	image_index = 0;
	walking = false;
} else {
	image_speed = 0.7;
	walking = true;
}

if (walking != was_walking && walking) {
	audio_play_sound(snd_walk_0, 25, true);
	was_walking = walking;
} else if (walking != was_walking && !walking) {
	audio_pause_sound(snd_walk_0);
	was_walking = walking;
}

x += x_speed_;

if (x_speed_ > 0) {
	// Collide right
	image_xscale = 1;
	if (grid_place_meeting(self, obj_world_loader.grid_)) {
		x = bbox_right&~(CELL_WIDTH-1);
		x -= bbox_right-x;
		x_speed_ = 0;
	}
} else if (x_speed_ < 0){
	// Collide left
	image_xscale = -1;
	if (grid_place_meeting(self, obj_world_loader.grid_)) {
		x = bbox_left&~(CELL_WIDTH-1);
		x += CELL_WIDTH+x-bbox_left;
		x_speed_ = 0;
	}
}

y += y_speed_;

if (y_speed_ > 0) {
	// Collide down
	if (grid_place_meeting(self, obj_world_loader.grid_)) {
		y = bbox_bottom&~(CELL_HEIGHT-1);
		y -= bbox_bottom-y;
		y_speed_ = 0;
	}
} else if (y_speed_ < 0){
	// Collide up
	if (grid_place_meeting(self, obj_world_loader.grid_)) {
		y = bbox_top&~(CELL_HEIGHT-1);
		y += CELL_HEIGHT+y-bbox_top;
		y_speed_ = 0;
	}
}

_x_input = 0;
_y_input = 0;

var _xx = lerp(0, knockback_x, .2);
knockback_x -= _xx;
x += _xx;

var _yy = lerp(0, knockback_y, .2);
knockback_y -= _yy;
y += _yy;

check_timer --;
if (pad_index != -1) {
	if (gamepad_button_check(pad_index, gp_shoulderl) && check_timer < 0) {
		check_timer = 10;
		if (current_weapon > 0) {
			current_weapon --;
			reload_ = held_weapons[# current_weapon, W_RELOAD];
		}
	} else if (gamepad_button_check(pad_index, gp_shoulderr) && check_timer < 0) {
		check_timer = 10;
		if (current_weapon < 32) {
			if (current_weapon < number_of_weapons-1) {
				current_weapon ++;
				reload_ = held_weapons[# current_weapon, W_RELOAD];
			}
		}
	}
} else {
	if (mouse_wheel_up() && check_timer < 0) {
		check_timer = 10;
		if (current_weapon > 0) {
			current_weapon --;
			reload_ = held_weapons[# current_weapon, W_RELOAD];
		}
	} else if (mouse_wheel_down() && check_timer < 0) {
		check_timer = 10;
		if (current_weapon < 32) {
			if (current_weapon < number_of_weapons-1) {
				current_weapon ++;
				reload_ = held_weapons[# current_weapon, W_RELOAD];
			}
		}
	}
}

if (reload_ > -1) {
	reload_--;
} else {
	if (pad_index != -1) {
		if(!gamepad_button_check(pad_index, gp_shoulderrb)) exit;
	} else {
		if(!mouse_check_button_pressed(mb_left)) exit;
	}
	var _range = held_weapons[# current_weapon, W_DISTANCE];
	var _stick_dir = 0;
	if (pad_index != -1) {
		if (gamepad_axis_value(pad_index, gp_axisrh) != 0 || gamepad_axis_value(pad_index, gp_axisrv) != 0) {
			_stick_dir = point_direction(0, 0, gamepad_axis_value(pad_index, gp_axisrh), -gamepad_axis_value(pad_index, gp_axislv));
		}
	} else {
		_stick_dir = point_direction(x, y, mouse_x, mouse_y); // Get direction of mouse from player
	}
	var _cone_range = held_weapons[# current_weapon, W_SPREAD] / 2; //Half the cone's angle

	if (held_weapons[# current_weapon, W_TYPE] == TYPE_RANGED) {
		ranged_attack(self, held_weapons, current_weapon, _stick_dir);
	} else {
		with(obj_enemy)
		{ // Repeat for every enemy in room
			//Check all the corners
			var _hit = false;
    
			if(abs(angle_difference(_stick_dir,point_direction(other.x,other.y,bbox_left,bbox_top))) <= _cone_range &&
				    point_distance(other.x,other.y,bbox_left,bbox_top) <= _range)
				    _hit=true;
			else if(abs(angle_difference(_stick_dir,point_direction(other.x,other.y,bbox_left,bbox_bottom))) <= _cone_range &&
				    point_distance(other.x,other.y,bbox_left,bbox_bottom) <= _range)
				    _hit=true;
			else if(abs(angle_difference(_stick_dir,point_direction(other.x,other.y,bbox_right,bbox_top))) <= _cone_range &&
				    point_distance(other.x,other.y,bbox_right,bbox_top) <= _range)
				    _hit=true;
			else if(abs(angle_difference(_stick_dir,point_direction(other.x,other.y,bbox_right,bbox_bottom))) <= _cone_range &&
				    point_distance(other.x,other.y,bbox_right,bbox_bottom) <= _range)
				    _hit=true;
    
			if(!_hit) continue; //None of the corners are within our cone
  
			//If we got this far, we got a hit!
			melee_attack(other, id, other.held_weapons, other.current_weapon);
		}
		with(obj_player1)
		{ // Repeat for every enemy in room
			//Check all the corners
			var _hit = false;
    
			if(abs(angle_difference(_stick_dir,point_direction(other.x,other.y,bbox_left,bbox_top))) <= _cone_range &&
				    point_distance(other.x,other.y,bbox_left,bbox_top) <= _range)
				    _hit=true;
			else if(abs(angle_difference(_stick_dir,point_direction(other.x,other.y,bbox_left,bbox_bottom))) <= _cone_range &&
				    point_distance(other.x,other.y,bbox_left,bbox_bottom) <= _range)
				    _hit=true;
			else if(abs(angle_difference(_stick_dir,point_direction(other.x,other.y,bbox_right,bbox_top))) <= _cone_range &&
				    point_distance(other.x,other.y,bbox_right,bbox_top) <= _range)
				    _hit=true;
			else if(abs(angle_difference(_stick_dir,point_direction(other.x,other.y,bbox_right,bbox_bottom))) <= _cone_range &&
				    point_distance(other.x,other.y,bbox_right,bbox_bottom) <= _range)
				    _hit=true;
    
			if(!_hit) continue; //None of the corners are within our cone
  
			//If we got this far, we got a hit!
			melee_attack(other, id, other.held_weapons, other.current_weapon);
		}
	}
}