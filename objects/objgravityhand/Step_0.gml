/// @description Insert description here
// You can write your code in this editor

if(enemy_health <= 0){
	instance_destroy(self);
}

direction = point_direction(x,y,objPlayer.x, objPlayer.y);

image_angle = direction;