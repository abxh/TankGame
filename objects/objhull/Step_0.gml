/// @description Movement controls

function shoot(){
	can_shoot = false;
}

function turnHull(deg){
	image_angle += deg;
}

function turnCanon(deg){
	canon.image_angle += deg;
}

if(enemy_health <= 0){
	instance_destroy(canon);
	instance_destroy(self);
	return;
}


var dist = point_distance(x,y,objPlayer.x, objPlayer.y);

var dir_to_player = point_direction(x,y,objPlayer.x, objPlayer.y);

direction = image_angle;

var v1 = new Vector2(1,0);
v1.Rotate(dir_to_player);

var v2 = new Vector2(1,0);
v2.Rotate(canon.image_angle);

var v_hull = new Vector2(1,0);
v_hull.Rotate(image_angle);

var canon_player_angle = Angle(v1, v2);

var hull_player_angle = Angle(v1, v_hull);


// Determinant can be used to get direction to turn
var s = Det(v1, v2) != 0 ? 
	sign(Det(v1, v2)) : 1;	// prevents canon from being still 
							//when in opposite direction of player
							
var s_hull = Det(v1, v_hull) != 0 ?
	sign(Det(v1, v_hull)) : 1;

// acelleration
if(dist > range_shoot && speed < spd){
	speed += acc;
}

// hull direction control
if(speed > 0){
	if(hull_player_angle > self.max_hull_angle){
		turnHull(-hull_turn_spd*s_hull);
	}
}

// Canon control
if(dist < range_shoot && speed < 1){
	if(canon_player_angle > self.max_angle){
		turnCanon(-canon_speed*s);
		//canon.image_angle -= canon_speed * s;
	}
	else if (can_shoot){
		shoot();
	}
}

// deacceleration
if(dist <= range_go){
	if(speed > 0){
		speed -= acc;
	}
}

// Keep offset consistent with rotation.
canon.x = x;
canon.y = y;
canon.x += dcos(-image_angle)*canon_offset;
canon.y += dsin(-image_angle)*canon_offset;