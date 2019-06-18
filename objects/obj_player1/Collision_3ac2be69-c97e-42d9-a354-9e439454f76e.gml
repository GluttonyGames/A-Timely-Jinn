/// @description Collide
if (number_of_weapons < 32) {
	if (held_weapons[# 0, 0] == -1) {
		held_weapons[# 0, W_ID] = other.weapon_id;
		held_weapons[# 0, W_DAMAGE] = other.weapon_damage;
		held_weapons[# 0, W_SPREAD] = other.weapon_spread;
		held_weapons[# 0, W_SHIELD] = other.weapon_shield;
		held_weapons[# 0, W_DISTANCE] = other.weapon_distance;
		held_weapons[# 0, W_DURABILITY] = other.weapon_durability;
		held_weapons[# 0, W_KNOCKBACK] = other.weapon_knockback;
		held_weapons[# 0, W_RELOAD] = other.weapon_reload;
		held_weapons[# 0, W_WEIGHT] = other.weapon_weight;
	} else {
		var n = number_of_weapons	/// [id, damage, spread, shield, distance]
		ds_grid_resize(held_weapons, n+1, 9);
		held_weapons[# n, W_ID] = other.weapon_id;
		held_weapons[# n, W_DAMAGE] = other.weapon_damage;
		held_weapons[# n, W_SPREAD] = other.weapon_spread;
		held_weapons[# n, W_SHIELD] = other.weapon_shield;
		held_weapons[# n, W_DISTANCE] = other.weapon_distance;
		held_weapons[# n, W_DURABILITY] = other.weapon_durability;
		held_weapons[# n, W_KNOCKBACK] = other.weapon_knockback;
		held_weapons[# n, W_RELOAD] = other.weapon_reload;
		held_weapons[# n, W_WEIGHT] = other.weapon_weight;
	}
	number_of_weapons ++;
	instance_destroy(other);
	
	// ***WARNING***
	// Add saving functionality
}