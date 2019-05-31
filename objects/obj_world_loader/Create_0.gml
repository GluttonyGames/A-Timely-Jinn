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
ds_grid_set_region(grid_, 0, 0, width_, height_, 0); // Set it all to VOID (empty) cells

global.world_id = 0;
global.tile_id = 0;
ini_open("world_" + string(global.world_id) + "_" + string(global.tile_id) + ".world");
for	(var i = 0; i < 64; i++) {
	tiledata[i] = ini_read_string("tiles", i, "-1");
}

if (tiledata[0] == "-1") {
	show_error("Please import the level files, for help go to www.placeholder.com/gamefiles", false);
	ini_write_string("tiles", 0, "-1");
} else {
	for (var _y = 0; _y < 64; _y++) {
		var tilerow = string_split(tiledata[_y], ",")
		for (var _x = 0; _x < 64; _x++) {
			ds_grid_set(grid_, _x, _y, tilerow[_x]);
			tilemap_set(_wall_map_id, tilerow[_x], _x, _y);
		}
	}
}
ini_close();