/// @description Draw tile location
var window_width = window_get_width();
var center_top_x = window_width/2

var bbox_thickness = 8;
var distance_to_edge = 16;
var minimap_size = floor(window_width/8);
var player_size = 6;

draw_set_color(c_white);
draw_rectangle_color(center_top_x-minimap_size/2, distance_to_edge, center_top_x+minimap_size/2, minimap_size+distance_to_edge, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(center_top_x-minimap_size/2+bbox_thickness, distance_to_edge+bbox_thickness, center_top_x+minimap_size/2-bbox_thickness, minimap_size+distance_to_edge-bbox_thickness, c_gray, c_gray, c_gray, c_gray, false);

var p1x = (window_width/2-minimap_size/2+bbox_thickness)+(obj_player1.x/room_width)*(minimap_size-bbox_thickness*2);
var p1y = (obj_player1.y/room_height)*(minimap_size-bbox_thickness*2)+bbox_thickness+distance_to_edge;
draw_rectangle_color(p1x-player_size, p1y-player_size, p1x+player_size, p1y+player_size, c_blue, c_blue, c_blue, c_blue, false);

var p2x = (window_width/2-minimap_size/2+bbox_thickness)+(obj_player2.x/room_width)*(minimap_size-bbox_thickness*2);
var p2y = (obj_player2.y/room_height)*(minimap_size-bbox_thickness*2)+bbox_thickness+distance_to_edge;
draw_rectangle_color(p2x-player_size, p2y-player_size, p2x+player_size, p2y+player_size, c_green, c_green, c_green, c_green, false);