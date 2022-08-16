// shoot
if(can_shoot){
	instance_create_layer(objCanon.x, objCanon.y,rooMain, objBullet);
	alarm[1] = room_speed * 1;
	can_shoot = false;
}