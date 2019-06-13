/// @description Move towards player
var angle_ = point_direction(x,y, obj_player1.x, obj_player1.y);
var x_speed_ = lengthdir_x(spd_, angle_);
var y_speed_ = lengthdir_y(spd_, angle_);

var x_new = x + x_speed_
var y_new = y + y_speed_
if (grid_xy_meeting(x_new, y_new, obj_world_loader.grid_)) {
	x_speed_ = 0;
	y_speed_ = 0;
} 

x += x_speed_;
y += y_speed_;