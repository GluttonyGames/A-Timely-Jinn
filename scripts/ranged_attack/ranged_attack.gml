///@arg player
///@arg weapon_array
///@arg current_weapon
///@arg direction
var player_ = argument0;
var weapon_array_ = argument1;
var current_weapon_ = argument2;
var direction_ = argument3;

var projectile = instance_create_layer(player_.x, player_.y, "Instances", obj_projectile);
projectile.projectile_type = 0;
projectile.distance = weapon_array_[# current_weapon_, W_DISTANCE];

var variance = random_range(-weapon_array_[# current_weapon_, W_SPREAD], weapon_array_[# current_weapon_, W_SPREAD]);
projectile.projectile_direction = direction_ + variance;

player_.reload_ = weapon_array_[# current_weapon_, W_RELOAD]; // Reset reload based on current weapon