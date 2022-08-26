/// @description Insert description here
// You can write your code in this editor

var spawn_health = random(100) > 30;

if(spawn_health){
	//instance_create_layer(x,y,rooMain, objHealthPowerup);
	objSpawner.SpawnHealth(self);
}