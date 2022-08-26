/// @description Insert description here
// You can write your code in this editor

difficulty = 1;

SpawnHealth = function(pos){
	instance_create_layer(pos.x, pos.y, "insPowerup", objHealthPowerup);
}

SpawnEnemy = function(enemy_type){
	var camera = view_get_camera(0);
	var cam_width = camera_get_view_width(camera);
	var cam_height = camera_get_view_height(camera);

	// The distance from the center to a corner
	var len = sqrt((cam_width*cam_width)/4 + (cam_height*cam_height)/4);

	// generates a random angle
	var rand_angle = random_range(0,360);

	// Vector contains the position of the new enemy
	var vec = new Vector2(0,1);
	vec.Rotate(rand_angle);

	// Scales vector so enemies spawns outside the screen
	vec.Scale(len);
	
	
	show_debug_message("New enemy spawned");
	instance_create_layer(vec.x + objHull.x, vec.y + objHull.y, "insEnemy", enemy_type);
}