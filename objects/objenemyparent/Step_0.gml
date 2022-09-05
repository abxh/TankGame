/// @description Insert description here
// You can write your code in this editor

function shoot(){
	instance_create_layer(self.x, self.y, "insEnemy", objEnemyBullet);
	var dir = new Vector2(1,0);
	dir.Scale(30);
	dir.Rotate(direction);
	
	effect_create_above(ef_smoke, x + dir.x, y - dir.y, 0.5, c_white);
}

function reload(){
	alarm[0] = room_speed * reload_time;
	bullets_count = magazine_size;
}

if(enemy_health <= 0){
	instance_destroy(self);
}

if(alarm[1] == -1){
	alarm[1] = room_speed * 1;
}


if(point_distance(x,y,objPlayer.x, objPlayer.y) <= range_go){
	path_end();
	status = "idle";
}

image_angle = point_direction(x,y,objPlayer.x, objPlayer.y);

var dist = sqrt((x-objPlayer.x)*(x-objPlayer.x)+(y-objPlayer.y)*(y-objPlayer.y));

if(dist > range_shoot && status == "idle"){
	range_go = random_range(min_range_go, max_range_go);
	status = "find_path";
}

if(status == "idle" and bullets_count > 0 and can_shoot){
	shoot();
	alarm[0] = room_speed * 0.3;
	can_shoot = false;
	bullets_count--;
}

if (bullets_count <= 0 and can_shoot){
	can_shoot = false;
	reload();
}