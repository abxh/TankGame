/// @description Movement controls

var speed_multiplier = 1;

if (place_meeting(x,y,objMarsh)){
	speed_multiplier = 0.7;
}

if(health <= 0){
	show_debug_message("Game Over!");
	LOADINGSTATE = 1;
	POINTS = points;
	room_goto(rooName);
	layer_destroy(rooGame);
}

key_up    = keyboard_check(vk_up)     or keyboard_check(ord("W")) or gamepad_axis_value(4, gp_axislv) < -0.5;
key_down  = keyboard_check(vk_down)   or keyboard_check(ord("S")) or gamepad_axis_value(4, gp_axislv) >  0.5;
key_left  = keyboard_check(vk_left)   or keyboard_check(ord("A")) or gamepad_axis_value(4, gp_axislh) < -0.5;
key_right = keyboard_check(vk_right)  or keyboard_check(ord("D")) or gamepad_axis_value(4, gp_axislh) >  0.5;
key_shift = keyboard_check(vk_shift)  or gamepad_button_check(4, gp_face1);
key_space = keyboard_check(vk_space)  or gamepad_button_check(4, gp_face2);


running = key_shift && can_run;


if(running){
	stamina -= stamina_use_rate;
}
else{
	if(stamina < 10){
		stamina += stamina_gain_rate;
	}
	
}

if(stamina <= 0 && can_run){ // Cooldown when stamina bar reaches 0
	can_run = false;
	alarm[1] = room_speed * run_cooldown_time;
}


// Rotation:
var dkey = false;
var r    = new Vector2(0,0);
if (key_up)    { r = Add(r, new Vector2( 0, 1)); dkey = true; }
if (key_down)  { r = Add(r, new Vector2( 0,-1)); dkey = true; }
if (key_right) { r = Add(r, new Vector2( 1, 0)); dkey = true; }
if (key_left)  { r = Add(r, new Vector2(-1, 0)); dkey = true; }

var v = new Vector2(1,0);
if(place_meeting(x + r.x, y - r.y, objEnemyParent)){
	show_debug_message("Colliding with enemy!");
}

if (dkey) r_approach = r.GetAngle(); // Approach even if key is not pressed.

var diff = angle_difference(r_approach, image_angle);
image_angle += diff / r_precision;   // Smooth rotation

// Movement:

var current_max_spd = running ? spd_max_sprint : spd_max;
var current_a_rate  = running ? a_rate_sprint  : a_rate;

current_max_spd *= speed_multiplier;
current_a_rate *= speed_multiplier;

if  (dkey) and (spd < current_max_spd)					spd+=current_a_rate;
if (!(dkey) and (spd > 0)) or (spd > current_max_spd)	spd-=current_a_rate*0.5;

v.Rotate(r_approach);

v.Scale(spd);

if(IsColliding(objForest)){
	var s = collision_normal(x, y, objForest, sprite_width, 5);
	
	v = new Vector2(1, 0);
	v.Rotate(s);
	v.Scale(spd);
}
else if(IsColliding(objEnemyParent)){
	var s = collision_normal(x, y, objEnemyParent, sprite_width, 5);
	
	v = new Vector2(1, 0);
	v.Rotate(s);
	v.Scale(spd);
}

if(IsOutsideRoom(x + v.x, y - v.y)){
	v.Scale(0);
}


x += v.x;
y -= v.y;

if (spd == 0) { image_speed = 0; }
if (spd != 0) { image_speed = spd/spd_max*2; }

// gun control
if(key_space && can_shoot){
	var instance = shoot(objMissile);
	instance.enemy = GetFrontEnemy();
}
