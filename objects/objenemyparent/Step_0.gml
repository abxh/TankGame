/// @description Insert description here
// You can write your code in this editor

function shoot(){
	instance_create_layer(self.x, self.y, "insEnemy", objEnemyBullet);
}

function reload(){
	alarm[0] = room_speed * reload_time;
	bullets_count = magazine_size;
}

if(enemy_health <= 0){
	instance_destroy(self);
}

direction = point_direction(x,y,objPlayer.x, objPlayer.y);
image_angle = direction;

var dist = sqrt((x-objPlayer.x)*(x-objPlayer.x)+(y-objPlayer.y)*(y-objPlayer.y));

if(dist < range_go){
	speed = 0;
}

if(dist > range_shoot && speed == 0){
	speed = 3;
	range_go = random_range(min_range_go, max_range_go);
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