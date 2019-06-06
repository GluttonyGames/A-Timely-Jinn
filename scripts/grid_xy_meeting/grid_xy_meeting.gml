///@arg x
///@arg y
///@arg grid
var _x = argument0;
var _y = argument0;
var _grid = argument1;

var _top_right = _grid[# (_x-1) div CELL_WIDTH, _y div CELL_HEIGHT] < 17;
var _top_left = _grid[# _x div CELL_WIDTH, _y div CELL_HEIGHT] < 17;
var _bottom_right = _grid[# (_x-1) div CELL_WIDTH, (_y-1) div CELL_HEIGHT] < 17;
var _bottom_left = _grid[# _x div CELL_WIDTH, (_y-1) div CELL_HEIGHT] < 17;

return _top_right || _top_left || _bottom_left || _bottom_right;