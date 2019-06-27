///@arg world_id
///@arg tile_id
var _world_id = argument0;
var _tile_id = argument1;

var map = ds_map_create();

//Step 2: Create lists that will hold all our objects. Create one per object type
var enemy_list = ds_list_create();
var weapon_list = ds_list_create();

//Step 3: Add those lists to the map. We use ds_map_add_list() to tell GM this is a list we are adding, not just a number. This is used hen dealing with JSon.
ds_map_add_list(map, "enemys", enemy_list);
ds_map_add_list(map, "weapons", weapon_list);

//Step 4: Go through all bob, then homer objects and add them to the lists. We will represent them with maps
//Lets start with all bob objects
with(obj_enemy) {
    //Step 4.1: Create a map to represent this instance
    var instance_map = ds_map_create(); //This map represetns this instance
    ds_map_add(instance_map, "x", x); //Store the x variable
    ds_map_add(instance_map, "y", y); //Store the y variable
    ds_map_add(instance_map, "health", health_); //Store the image angle variable

    //Step 4.2: Add that map to bob_list. There is no ds_list_add_map, so we have to use mark_as_map
	var pos = ds_list_size(enemy_list);
	//ds_list_add_map(bob_list, instance_map); //Add the map index
	ds_list_mark_as_map(enemy_list, pos);
	instance_destroy(self);
}

//Lets add homer objects now
with(obj_weapon) {
    //Step 4.3: Create a map to represent this instance
    var instance_map = ds_map_create(); //This map represetns this instance
    ds_map_add(instance_map, "x", x); //Store the z variable
    ds_map_add(instance_map, "y", y); //Store the z variable
	ds_map_add(instance_map, "id", weapon_id); //Store the z variable

    //Step 4.4: Add that map to homer_list. There is no ds_list_add_map, so we have to use mark_as_map
    var pos = ds_list_size(obj_weapon);
    //ds_list_add_map(homer_list, instance_map); //Add the map index
    ds_list_mark_as_map(weapon_list, pos);
	instance_destroy(self);
}

//Step 5: Create JSon and save it
var json = json_encode(map);
var file = file_text_open_write("objects_" + _world_id + "_" + _tile_id + ".json");
file_text_write_string(file, json);
show_debug_message("Wrote to JSON")
file_text_close(file);

//Step 6: Free the map, along with all its children
ds_map_destroy(map);