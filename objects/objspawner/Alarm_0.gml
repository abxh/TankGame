/// @description Spawn Enemies

//var num = random(difficulty * 10);

var num = random(30);

if(num <= 20){
	SpawnEnemy(objEnemy);
}
else if (num <= 25){
	SpawnEnemy(objGravityHand);
}
else{
	SpawnEnemy(objEnemy2);
}

//else if (num <= 35){
//	SpawnEnemy(objHull);
//}

//SpawnEnemy(objEnemy);

//if(difficulty > 2){
//	SpawnEnemy(objEnemy2);
//}

