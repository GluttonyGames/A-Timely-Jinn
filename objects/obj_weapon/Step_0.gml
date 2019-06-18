/// Set stats
image_index = weapon_id;
image_speed = 0;

switch(weapon_id) {
	case 0: // Sword
		weapon_damage = 10;
		weapon_spread = 90;
		weapon_shield = 45;
		weapon_distance = 24;
		weapon_durability = 100;
		weapon_knockback = 20;
		weapon_reload = 30;
		weapon_weight = 2;
		break;
	case 1: // Big Sword
		weapon_damage = 30;
		weapon_spread = 100;
		weapon_shield = 50;
		weapon_distance = 32;
		weapon_durability = 125;
		weapon_knockback = 40;
		weapon_reload = 3 * 60;
		weapon_weight = 6;
		break;
	case 2: // Little Sword
		weapon_damage = 15;
		weapon_spread = 60;
		weapon_shield = 15;
		weapon_distance = 15;
		weapon_durability = 200;
		weapon_knockback = 4;
		weapon_reload = 1 * 60;
		weapon_weight = 1;
		break;
	case 3: // Axe
		weapon_damage = 30;
		weapon_spread = 145;
		weapon_shield = 45;
		weapon_distance = 32;
		weapon_durability = 100;
		weapon_knockback = 60;
		weapon_reload = 4 * 60;
		weapon_weight = 4;
		break;
	case 4: // Double Axe
		weapon_damage = 35;
		weapon_spread = 359;
		weapon_shield = 45;
		weapon_distance = 32;
		weapon_durability = 110;
		weapon_knockback = 70;
		weapon_reload = 6 * 60;
		weapon_weight = 6;
		break;
	case 5: // Large Knife
		weapon_damage = 15;
		weapon_spread = 70;
		weapon_shield = 45;
		weapon_distance = 28;
		weapon_durability = 100;
		weapon_knockback = 60;
		weapon_reload = 4 * 60;
		weapon_weight = 4;
		break;
	case 6: // Large Block
		weapon_damage = 45;
		weapon_spread = 145;
		weapon_shield = 45;
		weapon_distance = 32;
		weapon_durability = 120;
		weapon_knockback = 60;
		weapon_reload = 7 * 60;
		weapon_weight = 7;
		break;
	case 7: // Large Fork
		weapon_damage = 8;
		weapon_spread = 5;
		weapon_shield = 5;
		weapon_distance = 42;
		weapon_durability = 70;
		weapon_knockback = 20;
		weapon_reload = 30;
		weapon_weight = 1;
		break;
}