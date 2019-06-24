/// @description Initalize
x_speed_ = 0;
y_speed_ = 0;
max_speed_ = 2;
acceleration_ = 1;
friction_ = 1;

current_weapon = 0;
held_weapons = ds_grid_create(1,global.weapon_stats);
ds_grid_set_region(held_weapons, 0, 0, 0, global.weapon_stats-1, -1);
number_of_weapons = 0;

check_timer = 20;

health_ = 100;

reload_ = 0;

color = c_gray;
alpha = 1;

pad_index = -1; // No controller, notify player
angle = 0;

walking = false;
was_walking = false;