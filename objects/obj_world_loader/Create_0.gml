/// @description Initialize
randomize();
room_speed = 60;

// Get the tile layer map id
_wall_map_id = layer_tilemap_get_id("WallTiles");

// Set up grid
width_ = room_width div CELL_WIDTH; // Use room width to get number of cells
height_ = room_height div CELL_HEIGHT; // Use room height to get number of cells
grid_ = ds_grid_create(width_, height_); // Create a ds grid map with the width and height

ds_grid_set_region(grid_, 0, 0, width_, height_, 0); // Set it all to VOID (empty) cells

global.world_id = 0;
global.tile_id = 0;
create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
//load_world_objects(global.world_id, global.tile_id, "Instances");

global.weapon_stats = 10;