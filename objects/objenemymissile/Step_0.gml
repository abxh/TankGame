/// @description Insert description here

if(!angle_set){ // Runs only once
	// nessecary because instantiator is not set at Create event
	image_angle = instantiator.canon.image_angle;
	
	dir_vec = new Vector2(1,0);
	dir_vec.Rotate(image_angle);
	angle_set = true;
}

if(instance_exists(enemy) && !place_meeting(x,y,instantiator.canon)){
	dir_vec = GetNewDirection("objEnemyMissile");
}
else{
	dir_vec.Normalize();
	dir_vec.Scale(spd);
}

image_angle = dir_vec.GetAngle();

x += dir_vec.x;
y -= dir_vec.y;

if(iterator > iterator_target){
	iterator -= iterator_speed;
}

if(spd < max_spd){
	spd += acc;
}