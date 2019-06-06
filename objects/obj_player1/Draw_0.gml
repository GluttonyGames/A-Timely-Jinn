/// @description Draw weapon gui
if (held_weapons[0,0] != -1) {
	var x1 = x-(held_weapons[current_weapon, 4]/2);
	var y1 = y-(held_weapons[current_weapon, 4]/2);
	var x2 = x+(held_weapons[current_weapon, 4]/2);
	var y2 = y+(held_weapons[current_weapon, 4]/2);
	var x3 = x+lengthdir_x(held_weapons[current_weapon, 4],0-(held_weapons[current_weapon, 2]/2))
	var y3 = y+lengthdir_y(held_weapons[current_weapon, 4],0-(held_weapons[current_weapon, 2]/2))
	var x4 = x+lengthdir_x(held_weapons[current_weapon, 4],0+(held_weapons[current_weapon, 2]/2))
	var y4 = y+lengthdir_y(held_weapons[current_weapon, 4],0+(held_weapons[current_weapon, 2]/2))
	draw_arc(x1,y1,x2,y2,x3,y3,x4,y4,24);
}
draw_self();