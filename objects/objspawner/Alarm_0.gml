/// @description Spawn Enemies

var num = random(difficulty * 10);


if(num <= 10){
	SpawnEnemy(objEnemy);
}
else if (num <= 20){
	SpawnEnemy(objEnemy2);
}
else if (num <= 30){
	SpawnEnemy(objGravityHand);
}
else{
	SpawnEnemy(objHull);
}

//SpawnEnemy(objEnemy);

//if(difficulty > 2){
//	SpawnEnemy(objEnemy2);
//}

