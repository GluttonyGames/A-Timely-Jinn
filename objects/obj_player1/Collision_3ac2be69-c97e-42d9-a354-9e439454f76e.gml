/// @description Collide
if (held_weapons[0,0] == -1) {
	held_weapons[0,0] = other.weapon_id;
} else {
	var n = array_height_2d(held_weapons)		/// [id, damage, spread, shield, distance]
	held_weapons[n+1,0] = other.weapon_id;
	held_weapons[n+1,1] = other.weapon_damage;
	held_weapons[n+1,2] = other.weapon_spread;
	held_weapons[n+1,3] = other.weapon_shield;
	held_weapons[n+1,4] = other.weapon_distance;
}