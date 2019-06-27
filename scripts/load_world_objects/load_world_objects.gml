/// Load world from json file
///@arg world_id
///@arg tile_id
///@arg instance_layer_id
var _world_id = argument0;
var _tile_id = argument1;
var _instance_layer_id = argument2;
var file = file_text_open_read("objects_" + _world_id + "_" + _tile_id + ".json");
show_debug_message("Read from JSON")
var json= "";
while (!file_text_eof(file)) {
    json+= file_text_read_string(file);
    file_text_readln(file);
}
file_text_close(file);

//Step 2: Decode the json into a map
var map = json_decode(json);
//Step 3: get the object lists
var enemy_list = ds_map_find_value(map, "enemys");
var weapon_list = ds_map_find_value(map, "weapons");

//Step 4: Go through the list, creating the objects:
//lets start with enemy
for(var i = 0; i < ds_list_size(enemy_list); i++) {
    var instance_map = ds_list_find_value(enemy_list, i); //Get the map representing this instance
    var instance = instance_create_layer(0, 0, _instance_layer_id, obj_enemy);
    instance.x = ds_map_find_value(instance_map, "x");
    instance.y = ds_map_find_value(instance_map, "y");
    instance.health_ = ds_map_find_value(instance_map, "health");
}

//Now lets deal with weapons
for(var i = 0; i < ds_list_size(weapon_list); i++) {
    var instance_map = ds_list_find_value(enemy_list, i); //Get the map representing this instance
    var instance = instance_create_layer(0, 0, _instance_layer_id, obj_weapon);
    instance.x = ds_map_find_value(instance_map, "x");
    instance.y = ds_map_find_value(instance_map, "y");
	instance.weapon_id = ds_map_find_value(instance_map, "id");
}
//Step 6: free the map
ds_map_destroy(map);