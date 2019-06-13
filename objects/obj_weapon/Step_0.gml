/// Set stats
image_index = weapon_id;
image_speed = 0;

switch(weapon_id) {
	case 0: // Sword
		weapon_damage = 10;
		weapon_spread = 90;
		weapon_shield = 45;
		weapon_distance = 48;
		weapon_durability = 100;
		weapon_knockback = 10;
		weapon_reload = 1 * 60;
		weapon_weight = 2;
		break;
	case 1: // Big Sword
		weapon_damage = 30;
		weapon_spread = 100;
		weapon_shield = 50;
		weapon_distance = 64;
		weapon_durability = 125;
		weapon_knockback = 20;
		weapon_reload = 4 * 60;
		weapon_weight = 6;
		break;
	case 2: // Little Sword
		weapon_damage = 15;
		weapon_spread = 60;
		weapon_shield = 15;
		weapon_distance = 30;
		weapon_durability = 200;
		weapon_knockback = 2;
		weapon_reload = 2 * 60;
		weapon_weight = 1;
		break;
	case 3: // Axe
		weapon_damage = 30;
		weapon_spread = 145;
		weapon_shield = 45;
		weapon_distance = 64;
		weapon_durability = 100;
		weapon_knockback = 30;
		weapon_reload = 5 * 60;
		weapon_weight = 4;
		break;
	case 4: // Double Axe
		weapon_damage = 35;
		weapon_spread = 360;
		weapon_shield = 45;
		weapon_distance = 64;
		weapon_durability = 110;
		weapon_knockback = 35;
		weapon_reload = 7 * 60;
		weapon_weight = 6;
		break;
	case 5: // Large Knife
		weapon_damage = 15;
		weapon_spread = 70;
		weapon_shield = 45;
		weapon_distance = 55;
		weapon_durability = 100;
		weapon_knockback = 30;
		weapon_reload = 5 * 60;
		weapon_weight = 4;
		break;
	case 6: // Large Block
		weapon_damage = 45;
		weapon_spread = 145;
		weapon_shield = 45;
		weapon_distance = 64;
		weapon_durability = 120;
		weapon_knockback = 30;
		weapon_reload = 8 * 60;
		weapon_weight = 7;
		break;
	case 7: // Large Fork
		weapon_damage = 8;
		weapon_spread = 5;
		weapon_shield = 5;
		weapon_distance = 85;
		weapon_durability = 70;
		weapon_knockback = 10;
		weapon_reload = 1 * 60;
		weapon_weight = 1;
		break;
}