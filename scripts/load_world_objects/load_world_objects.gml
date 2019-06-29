/// Load world from json file
///@arg world_id
///@arg tile_id
///@arg instance_layer_id

var _world_id = argument0;
var _tile_id = argument1;
var _instance_layer_id = argument2;

with (obj_enemy) instance_destroy();
with (obj_weapon) instance_destroy();

var _filename = "object_" + string(_world_id) + "_" + string(_tile_id) + ".object"
if (file_exists(_filename)) {
	
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _wrapper = json_decode(_string);
	var _list = _wrapper[? "ROOT"];
	
	for (var i = 0; i < ds_list_size(_list); i++) {
		var _map = _list[| i];
		
		var _object = _map[? "obj"];
		switch (_object) {
			case "obj_enemy":
				var _x = _map[? "x"];
				var _y = _map[? "y"];
				var _health = _map[? "health"];
				var _object_id = instance_create_layer(_x, _y, _instance_layer_id, asset_get_index(_object));
				_object_id.health_ = _health;
				break;
			case "obj_weapon":
				var _x = _map[? "x"];
				var _y = _map[? "y"];
				var _id = _map[? "id"];
				var _durability = _map[? "durability"];
				var _damage = _map[? "damage"];
				var _spread = _map[? "spread"];
				var _shield = _map[? "shield"];
				var _distance = _map[? "distance"];
				var _knockback = _map[? "knockback"];
				var _reload = _map[? "reload"];
				var _weight = _map[? "weight"];
				var _type = _map[? "type"];
				var _object_id = instance_create_layer(_x, _y, _instance_layer_id, asset_get_index(_object));
				_object_id.weapon_id = _id;
				_object_id.weapon_durability = _durability;
				_object_id.weapon_damage = _damage;
				_object_id.weapon_spread = _spread;
				_object_id.weapon_shield = _shield;
				_object_id.weapon_distance = _distance;
				_object_id.weapon_knockback = _knockback;
				_object_id.weapon_reload = _reload;
				_object_id.weapon_weight = _weight;
				_object_id.weapon_type = _type;
				break;
		}
	}
	
	ds_map_destroy(_wrapper);
	show_debug_message("LOADED")
} else {
	show_debug_message("NO OBJECT DATA FOUND")
}