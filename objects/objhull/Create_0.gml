event_inherited();

function shoot(){
	var instance = instance_create_layer(canon.x,canon.y,"insEnemy", objEnemyMissile);
	instance.instantiator = self;
	can_shoot = false;
	alarm[0] = room_speed * reload_time;
}

function turnHull(deg){
	image_angle += deg;
}

function turnCanon(deg){
	canon.image_angle += deg;
}

camera = view_get_camera(0);

enemy_health = 50*(objSpawner.level / 2)*(objSpawner.level / 2);
enemy_max_health = 50*(objSpawner.level / 2)*(objSpawner.level / 2);
spd_max = 3;

range_go = 500;
range_shoot = 800;

canon = instance_create_layer(x,y,"insEnemy", objCanon);

var target_depth = layer_get_depth("insPlayer");
canon.depth = target_depth;

scale = objSpawner.level;

// Offset canon by a little bit.
canon_offset = 8 * scale;
canon.x = x - canon_offset;
canon.y = y;

// Variables related to rotation:
image_angle = point_direction(x,y,objPlayer.x, objPlayer.y);

canon_speed = 2;
hull_turn_spd = 2;
acc = 0.3;

can_shoot = true;

max_angle = 10;
max_hull_angle = 10;

image_yscale = scale;
image_xscale = scale;

canon.image_yscale = scale;
canon.image_xscale = scale;

reload_time = 3;
