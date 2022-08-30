/// @description Movement controls

function shoot(projectile){
	can_shoot = false;
	var instance = instance_create_layer(x,y,"insPlayer", projectile);
	alarm[0] = room_speed * reload_time;
	return instance;
}

if(health <= 0){
	show_debug_message("Game Over!");
	room_restart();
}

key_up    = keyboard_check(vk_up)     or keyboard_check(ord("W")) or gamepad_axis_value(4, gp_axislv) < -0.5;
key_down  = keyboard_check(vk_down)   or keyboard_check(ord("S")) or gamepad_axis_value(4, gp_axislv) >  0.5;
key_left  = keyboard_check(vk_left)   or keyboard_check(ord("A")) or gamepad_axis_value(4, gp_axislh) < -0.5;
key_right = keyboard_check(vk_right)  or keyboard_check(ord("D")) or gamepad_axis_value(4, gp_axislh) >  0.5;
key_shift = keyboard_check(vk_shift)  or gamepad_button_check(4, gp_face1);
key_space = keyboard_check(vk_space)  or gamepad_button_check(4, gp_face2);

// gun control
if(key_space && can_shoot){
	var instance = shoot(objMissile);
	instance.enemy = GetFrontEnemy();
}

// Rotation:
var dkey = false;
var r    = new Vector2(0,0);
if (key_up)    { r = Add(r, new Vector2( 0, 1)); dkey = true; }
if (key_down)  { r = Add(r, new Vector2( 0,-1)); dkey = true; }
if (key_right) { r = Add(r, new Vector2( 1, 0)); dkey = true; }
if (key_left)  { r = Add(r, new Vector2(-1, 0)); dkey = true; }

if (dkey) r_approach = r.GetAngle(); // Approach even if key is not pressed.

var diff = angle_difference(r_approach, image_angle);
image_angle += diff / r_precision;   // Smooth rotation

// Movement:
if  (dkey) and (spd < spd_max) spd+=a_rate;
if !(dkey) and (spd > 0)       spd-=a_rate*0.5;

var v = new Vector2(1,0);
v.Rotate(r_approach);
v.Scale(spd);

x += v.x;
y -= v.y;

if (spd == 0) { image_speed = 0; }
if (spd != 0) { image_speed = spd/spd_max*2; }