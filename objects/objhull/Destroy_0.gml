/// @description Powerup dropping

// always spawn powerup when dead
// Unless inside objForest
if(place_meeting(x,y, objForest)){
	return;
}

var powerups = [objHealthPowerup, objDamagePowerup];
var powerup_to_spawn = floor(random(100));

objSpawner.SpawnPowerup(self, powerups[powerup_to_spawn%array_length(powerups)]);


objPlayer.points += 20;