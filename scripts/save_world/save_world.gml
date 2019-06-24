///@arg world_id
///@arg tile_id
var world_id_ = argument0;
var tile_id_ = argument1;

var write_index = 0;
ini_open("world_" + string(world_id_) + "_" + string(tile_id_) + ".world");

for (var i = 0; i < instance_number(obj_enemy); i++) {
	var enemy_index = instance_find(obj_enemy,i);
	var data = "enemy,"+string(enemy_index.x)+","+string(enemy_index.y)+",obj_enemy"
	ini_write_string("objects", write_index, data); // type, x, y, object, meta...
	instance_destroy(enemy_index);
	write_index += 1;
}

for (var i = 0; i < instance_number(obj_weapon); i++) {
	var weapon_index = instance_find(obj_weapon,i);
	var data = "weapon,"+string(weapon_index.x)+","+string(weapon_index.y)+",obj_weapon,"+string(weapon_index.weapon_id);
	ini_write_string("objects", write_index, data);
	instance_destroy(weapon_index);
	write_index += 1;
}

ini_close();