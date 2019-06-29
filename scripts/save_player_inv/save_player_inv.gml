///@arg player
var _player = argument0;

var _weapons_list = ds_list_create();

for (var i = 0; i < _player.number_of_weapons-1; i++) {
	var _weapon_map = ds_map_create();
	ds_list_add(_weapons_list, _weapon_map);
	ds_list_mark_as_map(_weapons_list, ds_list_size(_weapons_list)-1);
	
	ds_map_add(_weapon_map, "id", _player.held_weapons[# i, W_ID]);
	ds_map_add(_weapon_map, "damage", _player.held_weapons[# i, W_DAMAGE]);
	ds_map_add(_weapon_map, "spread", _player.held_weapons[# i, W_SPREAD]);
	ds_map_add(_weapon_map, "shield", _player.held_weapons[# i, W_SHIELD]);
	ds_map_add(_weapon_map, "distance", _player.held_weapons[# i, W_DISTANCE]);
	ds_map_add(_weapon_map, "durability", _player.held_weapons[# i, W_DURABILITY]);
	ds_map_add(_weapon_map, "knockback", _player.held_weapons[# i, W_KNOCKBACK]);
	ds_map_add(_weapon_map, "reload", _player.held_weapons[# i, W_RELOAD]);
	ds_map_add(_weapon_map, "weight", _player.held_weapons[# i, W_WEIGHT]);
	ds_map_add(_weapon_map, "type", _player.held_weapons[# i, W_TYPE]);
	
}