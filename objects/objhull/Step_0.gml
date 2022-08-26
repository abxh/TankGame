/// @description Movement controls

function shoot(){
	
	can_shoot = false;
}

var dist = point_distance(x,y,objPlayer.x, objPlayer.y);

var dir_to_player = point_direction(x,y,objPlayer.x, objPlayer.y);

direction = dir_to_player;
image_angle = dir_to_player;

var v1 = new Vector2(1,0);
v1.Rotate(dir_to_player);

var v2 = new Vector2(1,0);
v2.Rotate(canon.image_angle);


var canon_player_angle = Angle(v1, v2);


var canon_player_angle_diff_s = sign((canon.image_angle - 180) - (dir_to_player - 180));

if(dist > range_shoot && speed < spd){
	speed += acc;
}

if(dist <= range_go){
	if(speed > 0){
		speed -= acc;
	}
	
	if(canon_player_angle > self.max_angle){
		canon.image_angle -= canon_speed * canon_player_angle_diff_s;
	}
	else if (can_shoot){
		shoot();
	}
}
// Keep offset consistent with rotation.
canon.x = x;
canon.y = y;
canon.x += -dcos(-image_angle)*canon_offset;
canon.y += -dsin(-image_angle)*canon_offset;