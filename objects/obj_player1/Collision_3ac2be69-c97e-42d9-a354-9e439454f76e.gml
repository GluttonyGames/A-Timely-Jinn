/// @description Collide
if (number_of_weapons < 32) {
	if (held_weapons[# 0, 0] == -1) {
		held_weapons[# 0, 0] = other.weapon_id;
		held_weapons[# 0, 1] = other.weapon_damage;
		held_weapons[# 0, 2] = other.weapon_spread;
		held_weapons[# 0, 3] = other.weapon_shield;
		held_weapons[# 0, 4] = other.weapon_distance;
		held_weapons[# 0, 5] = other.weapon_durability;
		held_weapons[# 0, 6] = other.weapon_knockback;
		held_weapons[# 0, 7] = other.weapon_reload;
		held_weapons[# 0, 8] = other.weapon_weight;
	} else {
		var n = number_of_weapons	/// [id, damage, spread, shield, distance]
		held_weapons[# n, 0] = other.weapon_id;
		held_weapons[# n, 1] = other.weapon_damage;
		held_weapons[# n, 2] = other.weapon_spread;
		held_weapons[# n, 3] = other.weapon_shield;
		held_weapons[# n, 4] = other.weapon_distance;
		held_weapons[# n, 5] = other.weapon_durability;
		held_weapons[# n, 6] = other.weapon_knockback;
		held_weapons[# n, 7] = other.weapon_reload;
		held_weapons[# n, 8] = other.weapon_weight;
	}
	number_of_weapons ++;
	instance_destroy(other);
}