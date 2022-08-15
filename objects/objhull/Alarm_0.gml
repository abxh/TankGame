/// @description Insert description here
// You can write your code in this editor

width = 1366;
height = 768;

x_0 = random_range(0,width);
y_0 = random_range(0,height);

instance_create_layer(x_0,y_0,rooMain, objEnemy);

show_debug_message("Enemy created");

// call alarm event every 5 seconds
alarm[0]=room_speed*5;