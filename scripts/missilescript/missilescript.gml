// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetClosestEnemy(){
	var enemies = [0];
	var closestEnemy;
	
	for(var i = 0; i < instance_number(objEnemyParent);i++){
		enemies[i] = instance_find(objEnemyParent, i);
	}
	closestEnemy = enemies[0];
	
	for(var i = 1; i < instance_number(objEnemyParent);i++){
		//var distance = sqrt((objHull.x-enemies[i].x)*(objHull.x-enemies[i].x) + (objHull.y - enemies[i].y)*(obj));
		if(distance_to_object(enemies[i]) < distance_to_object(closestEnemy) ){
			closestEnemy = enemies[i];
		}
	}
	
	return closestEnemy;
}

function GetFrontEnemy(){
	var enemies = [0];
	var frontEnemy;
	
	var count = instance_number(objEnemyParent);
	
	for(var i = 0; i < count; i++){
		enemies[i] = instance_find(objEnemyParent, i);
	}
	frontEnemy = enemies[0];
	
	var dir_closest = new Vector2(1,0);
	
	dir_closest.Rotate(point_direction(x, y, enemies[0].x, enemies[0].y));
	
	var dir = new Vector2(1,0);
	
	dir.Rotate(objPlayer.image_angle);
	
	for(var i = 0; i < count; i++){
		var dir_current = new Vector2(1,0);
		
		if(Angle(dir, dir_current) < Angle(dir, dir_closest))
		{
			dir_closest = new Vector2(1,0);
			
			dir_closest.Rotate(point_direction(x, y, enemies[i].x, enemies[i].y));
			frontEnemy = enemies[i];
		}
	}
	show_debug_message(Angle(dir, dir_closest));
	return frontEnemy;
}

function GetNewDirection(){
	// self is the function caller which is always objMissile
	
	if(!instance_exists(enemy)){ // Prevents game from crashing
		return new Vector2(x - objPlayer.y, y - objPlayer.y);
	}
	
	var vec1 = new Vector2(x - objPlayer.x, y - objPlayer.y);
	var vec2 = new Vector2(enemy.x - x, enemy.y - y);
	
	var ret;
	
	if(Angle(vec1, vec2) < max_angle){
		var dir1 = new Vector2(1,0);
		dir1.Rotate(self.image_angle);

		var dir2 = new Vector2(1,0);
		dir2.Rotate(point_direction(self.x,self.y, self.enemy.x, self.enemy.y));

		dir2.Scale(1 - self.iterator);

		dir1.Scale(self.iterator);
	
		ret = Add(dir1, dir2);
	}
	else{
		ret = self.dir_vec;
	}
	
	ret.Normalize();
	ret.Scale(self.spd);
	return ret;
}