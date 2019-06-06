/// @description Draw minimap
draw_rectangle_color((window_get_width()/2)-34, 0, (window_get_width()/2)+34, 34, c_black, c_black, c_black, c_black, false);
draw_rectangle_color((window_get_width()/2)-32, 2, (window_get_width()/2)+32, 32, c_gray, c_gray, c_gray, c_gray, false);

var p1x1 = ((window_get_width()/2)-32)+(obj_player1.x/32);
var p1y1 = 2+(obj_player1.y/32);
draw_rectangle_color(p1x1, p1y1, p1x1+2, p1y1+2, c_blue, c_blue, c_blue, c_blue, false)

var p2x1 = ((window_get_width()/2)-32)+(obj_player2.x/32);
var p2y1 = 2+(obj_player2.y/32);
draw_rectangle_color(p2x1, p2y1, p2x1+2, p2y1+2, c_green, c_green, c_green, c_green, false)