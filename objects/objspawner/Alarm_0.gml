/// @description Spawn Enemies

var num = random(difficulty * 10);


if(num <= 5){
	SpawnEnemy(objEnemy);
}
else if (num <= 10){
	SpawnEnemy(objGravityHand);
}
else if (num <= 20){
	SpawnEnemy(objEnemy2);
}
else{
	SpawnEnemy(objHull);
}

//SpawnEnemy(objEnemy);

//if(difficulty > 2){
//	SpawnEnemy(objEnemy2);
//}

