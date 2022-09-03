/// @description Insert description here
// You can write your code in this editor

killed_by_player = false;

instance_destroy(self);

health -= self.damage;

show_debug_message(health);