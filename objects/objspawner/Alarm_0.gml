/// @description Spawn Enemies

//var num = random(difficulty * 10);

var num = random(30 * difficulty);

if(num <= 20){
	SpawnEnemy(objEnemy);
}
else if (num <= 25){
	SpawnEnemy(objGravityHand);
}
else{
	SpawnEnemy(objEnemy2);
}

// objHull spawner is in alarm 1