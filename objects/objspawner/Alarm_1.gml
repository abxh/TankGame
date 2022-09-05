/// @description increase difficulty

difficulty *= 1.05;
	
//if(difficulty < 3){
//	difficulty += 0.1;
//}
//else{
//	difficulty *= 1.1;
//}

level += 0.1;

if(level % 3 == 0){
	SpawnEnemy(objHull);
}


show_debug_message("Difficulty is now: " + string(difficulty));