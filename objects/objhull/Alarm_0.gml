/// @description Insert description here
// You can write your code in this editor

width = 1366;
height = 768;

rand_angle = random_range(0,360);

vec = new Vector2(0,1);
vec.Rotate(rand_angle);

vec.x *= 800;
vec.y *= 600;

instance_create_layer(vec.x + width/2,vec.y + height/2, rooMain, objEnemy);

show_debug_message("Enemy created");

// call alarm event every 5 seconds
alarm[0]=room_speed*5;