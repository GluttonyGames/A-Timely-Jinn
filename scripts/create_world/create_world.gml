///@arg world_id
///@arg tile_id
///@arg wall_map_id
///@arg grid_id
var world_id_ = argument0;
var tile_id_ = argument1;
var wall_map_id_ = argument2;
var grid_id_ = argument3;

ini_open("world_" + string(world_id_) + "_" + string(tile_id_) + ".world");
for	(var i = 0; i < 32; i++) {
	tiledata[i] = ini_read_string("tiles", i, "-1");
}

if (tiledata[0] == "-1") {
	show_error("Please import the level files, for help go to www.placeholder.com/gamefiles", false);
	ini_write_string("tiles", 0, "-1");
} else {
	for (var _y = 0; _y < 32; _y++) {
		var tilerow = string_split(tiledata[_y], ",")
		for (var _x = 0; _x < 32; _x++) {
			ds_grid_set(grid_id_, _x, _y, tilerow[_x]);
			tilemap_set(wall_map_id_, tilerow[_x], _x, _y);
		}
	}
}
ini_close();