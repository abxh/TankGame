/// @description Insert description here
// You can write your code in this editor

function shoot(){
	instance_create_layer(self.x, self.y, "insBullet", objEnemyBullet);
}

function reload(){
	alarm[0] = room_speed * 1;
	bullets_count = magazine_size;
}

direction = point_direction(x,y,objHull.x, objHull.y);
image_angle = direction;

var dist = sqrt((x-objHull.x)*(x-objHull.x)+(y-objHull.y)*(y-objHull.y));

if(dist < range_go){
	speed = 0;
}

if(dist > range_shoot){
	speed = 3;
}

if(speed == 0 and bullets_count > 0 and can_shoot){
	shoot();
	alarm[0] = room_speed * 0.3;
	can_shoot = false;
	bullets_count--;
}

if (bullets_count <= 0 and can_shoot){
	can_shoot = false;
	reload();
}
