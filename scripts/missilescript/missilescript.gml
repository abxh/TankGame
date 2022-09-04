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
	var frontEnemy = noone;
	
	var count = instance_number(objEnemyParent);
	
	if(count = 0){
		return noone;
	}
	
	for(var i = 0; i < count; i++){
		enemies[i] = instance_find(objEnemyParent, i);
	}
	//frontEnemy = enemies[0];
	
	var dir_closest = new Vector2(1,0);
	
	dir_closest.Rotate(point_direction(x, y, enemies[0].x, enemies[0].y));
	
	var dir = new Vector2(1,0);
	
	dir.Rotate(objPlayer.image_angle);
	
	var cam = view_get_camera(0);
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_width = camera_get_view_width(cam);
	var cam_height = camera_get_view_height(cam);
	
	for(var i = 0; i < count; i++){
		var in_view = point_in_rectangle(enemies[i].x, enemies[i].y, cam_x, cam_y, cam_x + cam_width, cam_y + cam_height);
		if(!in_view){
			continue;
		}
		if(i = 0) frontEnemy = enemies[0];
		
		var dir_current = new Vector2(1,0);
		dir_current.Rotate(point_direction(x, y, enemies[i].x, enemies[i].y))
		
		if(Angle(dir, dir_current) < Angle(dir, dir_closest))
		{
			//dir_closest = new Vector2(1,0);
			dir_closest = dir_current;
			
			//dir_closest.Rotate(point_direction(x, y, enemies[i].x, enemies[i].y));
			frontEnemy = enemies[i];
		}
	}
	return frontEnemy;
}

function GetNewDirection(obj_caller){
	
	if(obj_caller != "objMissile" && obj_caller != "objEnemyMissile"){
		throw("Bad object caller string");
	}
	
	var is_player = obj_caller == "objMissile";
	
	var vec1;
	var vec2;
	
	var enemy_in_frame = true;
	
	if(is_player){
		vec1 = self.dir_vec;
		
		vec2 = new Vector2(enemy.x - x, y - enemy.y);
	}
	else{
		vec1 = dir_vec;
		
		vec2 = new Vector2(objPlayer.x - x, y - objPlayer.y);
	}
	
	var ret;
	
	if(Angle(vec1, vec2) < max_angle && enemy_in_frame){
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
