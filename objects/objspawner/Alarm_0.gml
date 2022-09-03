/// @description Spawn Enemies

var num = random(difficulty * 10);


if(num <= 5){
	SpawnEnemy(objEnemy);
}
else if (num <= 15){
	SpawnEnemy(objEnemy2);
}
else if (num <= 25){
	SpawnEnemy(objGravityHand);
}
else{
	SpawnEnemy(objHull);
}

//SpawnEnemy(objEnemy);

//if(difficulty > 2){
//	SpawnEnemy(objEnemy2);
//}

