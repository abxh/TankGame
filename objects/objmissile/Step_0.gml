/// @description Insert description here
// You can write your code in this editor

dir_vec = GetNewDirection();

image_angle = dir_vec.GetAngle();

x += dir_vec.x;
y -= dir_vec.y;

if(iterator > 0.75){
	iterator -= 0.002;
}

if(spd < max_spd){
	spd += acc;
}