///@arg direction
var direction_ = argument0;

switch(direction_) {
	case "north":
		return global.tile_id - 16;
	case "south":
		return global.tile_id + 16;
	case "east":
		return global.tile_id + 1;
	case "west":
		return global.tile_id - 1;
}