/// @description Insert description here
// You can write your code in this editor

enemy_health = 3;

spd = 3;

speed = spd;

damage = 10;

direction = point_direction(x,y, objPlayer.x, objPlayer.y);

image_angle = direction;

killed_by_player = true;

image_yscale = 1.5;
image_xscale = 1.5;