/// @description Insert description here
// You can write your code in this editor

difficulty = 1;
level = 1;

SpawnPowerup = function(pos, powerup){
	instance_create_layer(pos.x, pos.y, "insPlayer", powerup);
}

SpawnEnemy = function(enemy_type){
	var camera = view_get_camera(0);
	var cam_width = camera_get_view_width(camera);
	var cam_height = camera_get_view_height(camera);
	
	// The distance from the center to a corner + 20 for padding
	var len = point_distance(0, 0, cam_width, cam_height)
	
	// generates a random angle
	var rand_angle = random_range(0,360);

	// Vector contains the position of the new enemy
	var vec = new Vector2(0,1);
	vec.Rotate(rand_angle);

	// Scales vector so enemies spawns outside the screen
	vec.Scale(len);
	
	var redo_spawn = collision_circle(vec.x + objPlayer.x, vec.y + objPlayer.y, 25, objForest, true, false);
	
	redo_spawn = redo_spawn || vec.x + objPlayer.x < 0;
	redo_spawn = redo_spawn || vec.x + objPlayer.x > room_width;
	
	redo_spawn = redo_spawn || vec.y + objPlayer.y < 0;
	redo_spawn = redo_spawn || vec.y + objPlayer.y > room_height;
	
	
	if(redo_spawn){
		SpawnEnemy(enemy_type); // do until its right
	}
	else{
		show_debug_message("New enemy spawned");
		instance_create_layer(vec.x + objPlayer.x, vec.y + objPlayer.y, "insEnemy", enemy_type);
	}
}