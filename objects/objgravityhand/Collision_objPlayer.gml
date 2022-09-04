/// @description Insert description here
// You can write your code in this editor

killed_by_player = false;

instance_destroy(self);

health -= self.damage;

show_debug_message(health);

effect_create_above(ef_explosion, x, y, 0.5, c_orange);