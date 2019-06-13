/// @description Draw tile location
//draw_text(10,10,global.tile_id);

draw_set_color(c_white);

var center_top_x = view_get_wport(0)+2

draw_rectangle_color(center_top_x-34, -1, center_top_x+34, 67, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(center_top_x-32, 1, center_top_x+32, 65, c_gray, c_gray, c_gray, c_gray, false);

var p1x = (view_get_wport(0)-32)+(obj_player1.x/16)+2;
var p1y = (obj_player1.y/16)+1;
draw_rectangle_color(p1x, p1y, p1x+2, p1y+2, c_blue, c_blue, c_blue, c_blue, false);

var p2x = (view_get_wport(0)-32)+(obj_player2.x/16)+2;
var p2y = (obj_player2.y/16)+1;
draw_rectangle_color(p2x-1, p2y-1, p2x+1, p2y+1, c_green, c_green, c_green, c_green, false);