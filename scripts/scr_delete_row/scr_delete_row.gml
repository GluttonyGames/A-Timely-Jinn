///scr_delete_row(grid, row)
///@arg grid
///@arg row
var grid = argument0;
var row = argument1;
var w = ds_grid_width(grid);
var h = ds_grid_height(grid);
    
for(var i = row+1; i < h; i++){
    if(i > 0){
        for(var j = 1; j < w; j++){
            ds_grid_set(grid, j, i-1, ds_grid_get(grid, j, i));
        }
    }
}
    
if(h > 1)
    ds_grid_resize(grid, w, h-1);