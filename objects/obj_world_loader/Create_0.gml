/// @description Initialize
global.world_id = 0;
global.tile_id = 0;
var write_dir = game_save_id;
var read_dir = working_directory
var current_dir = write_dir;

if(!directory_exists("savelvl\\")) {
	current_dir = directory_create("savelvl\\");
	program_directory
}