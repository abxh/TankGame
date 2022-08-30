/// @description Insert description here
// You can write your code in this editor

var spawn_powerup = random(100) > 50;

if(spawn_powerup){
	var powerups = [objHealthPowerup, objDamagePowerup];
	var powerup_count = 2;
	var powerup_to_spawn = floor(random(100));
	
	
	objSpawner.SpawnPowerup(self, powerups[powerup_to_spawn%array_length(powerups)]);
}