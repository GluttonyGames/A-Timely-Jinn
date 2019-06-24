/// @description Move and hit walls
var _x_speed = lengthdir_x(projectile_speed, projectile_direction);
var _y_speed = lengthdir_y(projectile_speed, projectile_direction);

if (!hit_wall && distance > 0) {
	distance -= 1;
	x += _x_speed;
	y += _y_speed;
}

if (grid_place_meeting(self, obj_world_loader.grid_)) {
	hit_wall = true;	
}

exist_timer --;
if (exist_timer <= 0) {
	instance_destroy(self);
}