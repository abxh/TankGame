/// @description Powerup dropping

// Always spawn powerup when dead
// unless inside objForest
if(place_meeting(x,y, objForest)){
	return;
}

spawn_powerups()

objPlayer.points += 20;
