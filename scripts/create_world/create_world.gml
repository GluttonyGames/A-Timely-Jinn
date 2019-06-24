///@arg world_id
///@arg tile_id
///@arg wall_map_id
///@arg grid_id
var world_id_ = argument0;
var tile_id_ = argument1;
var wall_map_id_ = argument2;
var grid_id_ = argument3;
var instance_layer_id = layer_get_id("Instances");

ini_open("world_" + string(world_id_) + "_" + string(tile_id_) + ".world");
for	(var i = 0; i < 32; i++) {
	obj_world_loader.tiledata[i] = ini_read_string("tiles", i, "-1");
	obj_world_loader.objectdata[i] = ini_read_string("objects", i, "-1");
}

if (tiledata[0] == "-1" || objectdata[0] == "-1") {
	show_message("Level files currupt or un-imported, for help go to www.placeholder.com/gamefiles");
	ini_write_string("tiles", 0, "-1");
	ini_write_string("objects", 0, "-1");
	ini_close();
	
} else {
	for (var _y = 0; _y < 32; _y++) {
		var tilerow = string_split(tiledata[_y], ",");
		for (var _x = 0; _x < 32; _x++) {
			ds_grid_set(grid_id_, _x, _y, tilerow[_x]);
			tilemap_set(wall_map_id_, tilerow[_x], _x, _y);
		}
	}
	
	for (var _y = 0; _y < array_length_1d(objectdata); _y++) {
		var objectrow = string_split(objectdata[_y], ","); // type, x, y, object, meta...
		switch (objectrow[0]) {
			case "weapon": // META :: id
				var instance = instance_create_layer(objectrow[1], objectrow[2], instance_layer_id, obj_weapon);
				instance.weapon_id = objectrow[4];
				break;
			case "enemy":
				var instance = instance_create_layer(objectrow[1], objectrow[2], instance_layer_id, obj_enemy);
				break;
		}
	}
}
ini_close();