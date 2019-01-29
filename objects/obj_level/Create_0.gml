/// @description Initialize
randomize();
room_speed = 60;

shadow_surface_ = noone;

// Get the tile layer map id
var _wall_map_id = layer_tilemap_get_id("WallTiles");

// Set up grid
width_ = room_width div CELL_WIDTH; // Use room width to get number of cells
height_ = room_height div CELL_HEIGHT; // Use room height to get number of cells
grid_ = ds_grid_create(width_, height_); // Create a ds grid map with the width and height
ds_grid_set_region(grid_, 0, 0, width_, height_, VOID); // Set it all to VOID (empty) cells

// Create the controller
var _controller_x = width_ div 2;
var _controller_y = height_ div 2;
var _controller_direction = irandom(3);
var _steps = 1600; // The number of floor tiles roughly

//instance_create_layer(room_width/2, room_height/2, "Instances", obj_camera);

instance_create_layer(room_width/2, room_height/2, "Instances", obj_player1);
instance_create_layer(room_width/2, room_height/2, "Instances", obj_player2);

var _direction_change_odds = 1;

repeat (_steps) {
	grid_[# _controller_x, _controller_y] = FLOOR;
	
	// Randomize direction
	if (irandom(_direction_change_odds) == _direction_change_odds) {
		_controller_direction = irandom(3);
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1, _controller_direction * 90);
	var _y_direction = lengthdir_y(1, _controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Keep controller in bounds of room
	if (_controller_x < 2 || _controller_x >= width_ - 2) {
		_controller_x += -_x_direction * 2;
	}
	if (_controller_y < 2 || _controller_y >= height_ - 2) {
		_controller_y += -_y_direction * 2;
	}
}

for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x < width_-1; _x++) {
		if (grid_[# _x, _y] != FLOOR) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			if (_tile_index == 1) {
				grid_[# _x, _y] = FLOOR;
			}
		}
	}
}

for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x < width_-1; _x++) {
		if (grid_[# _x, _y] != FLOOR) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			tilemap_set(_wall_map_id, _tile_index, _x, _y);
		}
	}
}
