// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetClosestEnemy(){
	var enemies = [0];
	var closestEnemy;
	
	for(var i = 0; i < instance_number(objEnemy);i++){
		enemies[i] = instance_find(objEnemy, i);
	}
	closestEnemy = enemies[0];
	
	for(var i = 1; i < instance_number(objEnemy);i++){
		//var distance = sqrt((objHull.x-enemies[i].x)*(objHull.x-enemies[i].x) + (objHull.y - enemies[i].y)*(obj));
		if(distance_to_object(enemies[i]) < distance_to_object(closestEnemy) ){
			closestEnemy = enemies[i];
		}
	}
	
	return closestEnemy;
}

function GetNewDirection(){
	// self is the function caller which is always objMissile
	
	var vec1 = new Vector2(x - objHull.x, y - objHull.y);
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
		
		ret.Normalize();
		ret.Scale(self.spd);
	}
	else{
		ret = self.dir_vec;
	}
	
	return ret;
}