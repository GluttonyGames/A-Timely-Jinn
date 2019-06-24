///scr_delete_colomn(grid, col)
///@arg grid
///@arg col
var grid = argument0;
var col = argument1;
 
var w = ds_grid_width(grid);
var h = ds_grid_height(grid);
 
ds_grid_set_grid_region(grid, grid, col+1, 0, w-1, h-1, col, 0);
if (w > 1) {
	ds_grid_resize(grid, w-1, h);
} else {
	ds_grid_set_region(grid, 0, 0, 0, global.weapon_stats-1, -1);	
}