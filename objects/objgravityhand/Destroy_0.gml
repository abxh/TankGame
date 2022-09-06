/// @description Insert description here
// You can write your code in this editor

if(killed_by_player){ // only spawn powerups when killed by player
	var spawn_powerup = random(100) > 50;

	if(spawn_powerup) spawn_powerups()

	objPlayer.points += 5;
}
else{
	
	effect_create_above(ef_explosion, x, y, 0.5, c_orange);
}