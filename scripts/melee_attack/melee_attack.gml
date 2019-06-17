///melee_attack(player, enemy, weapon_array, current_weapon);
///@arg player
///@arg enemy
///@arg weapon_array
///@arg current_weapon
var player_ = argument0;
var enemy_ = argument1;
var weapon_array_ = argument2;
var current_weapon_ = argument3;
var enemy_angle_ = point_direction(player_.x, player_.y, enemy_.x, enemy_.y); // Get angle between player and enemy

enemy_.health_ -= weapon_array_[# current_weapon_, W_DAMAGE]; // Subtract health from enemy
weapon_array_[# current_weapon_, W_DURABILITY] -= 1; // Subtract damage from weapon durability
var knock_x = lengthdir_x(weapon_array_[# current_weapon_, W_KNOCKBACK], enemy_angle_+180); // Calculate x-coord of knockback
var knock_y = lengthdir_y(weapon_array_[# current_weapon_, W_KNOCKBACK], enemy_angle_+180); // Calculate y-coord of knockback
enemy_.knockback_x -= knock_x; // Set x-coord of knockback
enemy_.knockback_y -= knock_y; // Set y-coord  of knockback
player_.reload_ = weapon_array_[# current_weapon_, W_RELOAD]; // Reset reload based on current weapon