/// @description Check for tile movement
if (obj_player1.x < 0) {
	obj_player1.x = room_width;
	obj_player2.x = obj_player1.x;
	obj_player2.y = obj_player1.y;
	save_world_objects(global.world_id, global.tile_id);
	global.tile_id = tile_direction("west");
	create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
	load_world_objects(global.world_id, global.tile_id, layer);
	show_debug_message(global.tile_id);
} else if (obj_player1.x > room_width) {
	obj_player1.x = 0;
	obj_player2.x = obj_player1.x;
	obj_player2.y = obj_player1.y;
	save_world_objects(global.world_id, global.tile_id);
	global.tile_id = tile_direction("east");
	create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
	load_world_objects(global.world_id, global.tile_id, layer);
	show_debug_message(global.tile_id);
} else if (obj_player1.y < 0) {
	obj_player1.y = room_height;
	obj_player2.x = obj_player1.x;
	obj_player2.y = obj_player1.y;
	save_world_objects(global.world_id, global.tile_id);
	global.tile_id = tile_direction("north");
	create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
	load_world_objects(global.world_id, global.tile_id, layer);
	show_debug_message(global.tile_id);
} else if (obj_player1.y > room_height) {
	obj_player1.y = 0;
	obj_player2.x = obj_player1.x;
	obj_player2.y = obj_player1.y;
	save_world_objects(global.world_id, global.tile_id);
	global.tile_id = tile_direction("south");
	create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
	load_world_objects(global.world_id, global.tile_id, layer);
	show_debug_message(global.tile_id);
}

if (obj_player2.x < 0) {
	obj_player2.x = room_width;
	obj_player1.x = obj_player2.x;
	obj_player1.y = obj_player2.y;
	save_world_objects(global.world_id, global.tile_id);
	global.tile_id = tile_direction("west");
	create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
	load_world_objects(global.world_id, global.tile_id, layer);
	show_debug_message(global.tile_id);
} else if (obj_player2.x > room_width) {
	obj_player2.x = 0;
	obj_player1.x = obj_player2.x;
	obj_player1.y = obj_player2.y;
	save_world_objects(global.world_id, global.tile_id);
	global.tile_id = tile_direction("east");
	create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
	load_world_objects(global.world_id, global.tile_id, layer);
	show_debug_message(global.tile_id);
} else if (obj_player2.y < 0) {
	obj_player2.y = room_height;
	obj_player1.x = obj_player2.x;
	obj_player1.y = obj_player2.y;
	save_world_objects(global.world_id, global.tile_id);
	global.tile_id = tile_direction("north");
	create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
	load_world_objects(global.world_id, global.tile_id, layer);
	show_debug_message(global.tile_id);
} else if (obj_player2.y > room_height) {
	obj_player2.y = 0;
	obj_player1.x = obj_player2.x;
	obj_player1.y = obj_player2.y;
	save_world_objects(global.world_id, global.tile_id);
	global.tile_id = tile_direction("south");
	create_world_tiles(global.world_id, global.tile_id, _wall_map_id, grid_);
	load_world_objects(global.world_id, global.tile_id, layer);
	show_debug_message(global.tile_id);
}