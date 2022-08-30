/// @description Insert description here

dir_vec = GetNewDirection();

dir_vec.Scale(-1);

x += dir_vec.x;
y -= dir_vec.y;

if(iterator > 0.75){
	iterator -= 0.002;
}

if(spd < max_spd){
	spd += acc;
}