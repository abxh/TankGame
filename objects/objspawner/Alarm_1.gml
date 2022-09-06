/// @description increase difficulty

//difficulty *= 1.05;
difficulty += 0.1;
	
level += 0.2;

if(level % 3 == 0){
	SpawnEnemy(objHull);
}


show_debug_message("Difficulty is now: " + string(difficulty));