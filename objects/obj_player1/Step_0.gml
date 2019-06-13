/// @description Move and do other stuff

var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

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
} else {
	image_speed = 0.7;
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

check_timer --;
if (mouse_wheel_down() && check_timer < 0) {
	check_timer = 20;
	if (current_weapon > 0) {
		current_weapon --;
		reload_ = held_weapons[# current_weapon, 7];
	}
} else if (mouse_wheel_up() && check_timer < 0) {
	check_timer = 20;
	if (current_weapon < 32) {
		if (ds_grid_get(held_weapons, current_weapon+1, 0) != -1) {
			current_weapon ++;
			reload_ = held_weapons[# current_weapon, 7];
		}
	}
}

reload_ --;
if (reload_ <= 0) {
	if (mouse_check_button_pressed(mb_left)) {
		var number_of_enemies = instance_number(obj_enemy);
		for (var i = 0; i < number_of_enemies; i++) {
			var enemy = instance_find(obj_enemy, i);
			var enemy_angle = point_direction(x, y, enemy.x, enemy.y);
			var enemy_distance = point_distance(x, y, enemy.x, enemy.y);
			if (enemy_distance <= held_weapons[# current_weapon, 4]) {
				var direction_ = point_direction(x, x, mouse_x, mouse_y);
				if (direction_-(held_weapons[# current_weapon, 2]/2) < enemy_angle) {
					if (direction_+(held_weapons[# current_weapon, 2]/2) > enemy_angle) {
						enemy.health_ -= held_weapons[# current_weapon, 1];
						held_weapons[# current_weapon, 5] -= 1;
						var knock_x = lengthdir_x(held_weapons[# current_weapon, 6], enemy_angle+180);
						var knock_y = lengthdir_y(held_weapons[# current_weapon, 6], enemy_angle+180);
						enemy.x += knock_x;
						enemy.y += knock_y;
						reload_ = held_weapons[# current_weapon, 7];
					}
				}
			}
		}
	}
}