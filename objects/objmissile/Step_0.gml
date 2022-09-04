/// @description Insert description here
// You can write your code in this editor

if(instance_exists(enemy) && !place_meeting(x,y,objPlayer)){
	dir_vec = GetNewDirection("objMissile");
}
else{
	dir_vec.Normalize();
	dir_vec.Scale(spd);
}

image_angle = dir_vec.GetAngle();

x += dir_vec.x;
y -= dir_vec.y;

effect_create_above(ef_smoke, x - dir_vec.x, y + dir_vec.y,0.5, c_white);

if(iterator > iterator_target){
	iterator -= iterator_speed;
}

if(spd < max_spd){
	spd += acc;
}