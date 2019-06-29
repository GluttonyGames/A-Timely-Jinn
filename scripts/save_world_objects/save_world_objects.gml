///@arg world_id
///@arg tile_id
var _world_id = argument0;
var _tile_id = argument1;

var _objects = ds_list_create();

// for every instance, create a map
with (obj_weapon) {
	var _weapon_map = ds_map_create();
	ds_list_add(_objects, _weapon_map);
	ds_list_mark_as_map(_objects, ds_list_size(_objects)-1);
	
	var _object = object_get_name(object_index);
	ds_map_add(_weapon_map, "obj", _object);
	ds_map_add(_weapon_map, "x", x);
	ds_map_add(_weapon_map, "y", y);
	ds_map_add(_weapon_map, "id", weapon_id);
	ds_map_add(_weapon_map, "durability", weapon_durability);
	ds_map_add(_weapon_map, "damage", weapon_damage);
	ds_map_add(_weapon_map, "spread", weapon_spread);
	ds_map_add(_weapon_map, "shield", weapon_shield);
	ds_map_add(_weapon_map, "distance", weapon_distance);
	ds_map_add(_weapon_map, "knockback", weapon_knockback);
	ds_map_add(_weapon_map, "reload", weapon_reload);
	ds_map_add(_weapon_map, "weight", weapon_weight);
	ds_map_add(_weapon_map, "type", weapon_type);
}

with (obj_enemy) {
	var _enemy_map = ds_map_create();
	ds_list_add(_objects, _enemy_map);
	ds_list_mark_as_map(_objects, ds_list_size(_objects)-1);
	
	var _object = object_get_name(object_index);
	ds_map_add(_enemy_map, "obj", _object);
	ds_map_add(_enemy_map, "x", x);
	ds_map_add(_enemy_map, "y", y);
	ds_map_add(_enemy_map, "health", health_);
}

// Wrap root list in ds_map
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _objects);

// Save to string
var _string = json_encode(_wrapper);
var _filename = "object_" + string(_world_id) + "_" + string(_tile_id) + ".object";

var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
var e = buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, _filename);
buffer_delete(_buffer);

ds_map_destroy(_wrapper);
show_debug_message("SAVED");
show_debug_message(e);