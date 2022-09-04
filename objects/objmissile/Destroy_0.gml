/// @description Insert description here
// You can write your code in this editor

show_debug_message("Missile deleted");

//effect_create_above(ef_explosion, x, y, 0.5, c_orange);
effect_create_above(ef_explosion, x, y, MISSILEDAMAGE/10, c_orange);