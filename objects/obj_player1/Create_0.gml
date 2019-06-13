/// @description Initalize
x_speed_ = 0;
y_speed_ = 0;
max_speed_ = 2;
acceleration_ = 1;
friction_ = 1;

current_weapon = 0;
held_weapons = ds_grid_create(9,32);
ds_grid_set_region(held_weapons, 0, 0, 8, 31, -1);
number_of_weapons = 0;

check_timer = 20;

health_ = 100;

reload_ = 0;