/// @description Insert description here
// You can write your code in this editor

direction = point_direction(x,y,objHull.x, objHull.y);
image_angle = direction;

dist = sqrt((x-objHull.x)*(x-objHull.x)+(y-objHull.y)*(y-objHull.y));

if(dist < range_go){
	speed = 0;
}

if(dist > range_shoot){
	speed = 3;
}

if(speed == 0 && can_shoot){
	instance_create_layer(self.x,self.y,rooMain, objEnemyBullet);
	alarm[0] = room_speed * 1;
	can_shoot = false;
}