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

function spawn_powerups() {
	var powerups = [objHealthPowerup, objDamagePowerup];
	var powerup_id = floor(random(100)) % array_length(powerups);
	
	objSpawner.SpawnPowerup(self, powerups[powerup_id]);
}
