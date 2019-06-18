///ds_list_print(grid, x, y)
var grid_ = argument0;
var x_ = argument1;
var y_ = argument2;
var h_ = ds_grid_height(grid_);
var w_ = ds_grid_width(grid_);

for (var yy_ = 0; yy_ < h_; yy_++) {
	for (var xx_ = 0; xx_ < w_; xx_++) {
		draw_text(x_ + 30*xx_, y_ + 30*yy_, grid_[# xx_, yy_]);
	}
}