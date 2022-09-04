/// @description Insert description here
// You can write your code in this editor

health -= damage;
effect_create_above(ef_spark, x, y, 0.5, c_orange);
instance_destroy(self);