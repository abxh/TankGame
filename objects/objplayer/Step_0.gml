/// @description Movement controls

function shoot(projectile){
	can_shoot = false;
	var vec = new Vector2(1,0);
	vec.Scale(16*scale);
	
	var angle = incrementer%2 == 0 ? 90 : -90;
	
	vec.Rotate(image_angle + angle);
	var instance = instance_create_layer(x + vec.x, y - vec.y, "insPlayer", projectile);
	alarm[0] = room_speed * reload_time;
	incrementer++;
	return instance;
}

var function InTerrain(terrain){
	return place_meeting(x,y,terrain);
}

var function GoingToCollide(dir, obj){
	dir.Normalize();
	dir.Scale(2);
	//return collision_circle(x + dir.x, y - dir.y,10,obj,true, false);
	
	return place_meeting(x + dir.x ,y - dir.y, obj)
}

var function IsColliding(obj){
	return place_meeting(x, y, obj);
}

var function IsOutsideRoom(x_pos, y_pos){
	var outside = false;
	
	outside = x_pos < 0 || x_pos > room_width || y_pos < 0 || y_pos > room_height;
	
	return outside;
}

// Code is copy-pasted from https://www.gmlscripts.com/script/collision_normal

/// @func   collision_normal(x, y, obj, radius, spacing)
///
/// @desc   Returns a 2D "surface normal" at a point on or near an
///         instance within a test area. The test area is circular
///         and the detected normal direction is returned in degrees.
///         If no collision is found, (-1) is returned. Uses about
///         pi*(radius*radius)/(spacing*spacing) collision checks.
///
/// @param  {real}      x           x-coordinate of point near an instance
/// @param  {real}      y           y-coordinate of point near an instance
/// @param  {object}    obj         object or instance (or all)
/// @param  {real}      radius      radius of test area (default 4)
/// @param  {real}      spacing     space between each sample (default 1)
///
/// @return {real}      direction pointing away from the detected surface
///
/// GMLscripts.com/license
function collision_normal(x, y, obj, radius=4, spacing=1){
    var nx = 0;
    var ny = 0;
    if (collision_circle(x, y, radius, obj, true, true) != noone) {
        for (var j=spacing; j<=radius; j+=spacing) {
            for (var i=0; i<radius; i+=spacing) {
                if (point_distance(0, 0, i, j) <= radius) {
                    if (collision_point(x+i, y+j, obj, true, true) == noone) { nx += i; ny += j; }
                    if (collision_point(x+j, y-i, obj, true, true) == noone) { nx += j; ny -= i; }
                    if (collision_point(x-i, y-j, obj, true, true) == noone) { nx -= i; ny -= j; }
                    if (collision_point(x-j, y+i, obj, true, true) == noone) { nx -= j; ny += i; }
                }
            }
        }
        if (nx == 0 && ny == 0) return (-1);
        return point_direction(0, 0, nx, ny);
    }
    return (-1);
}

var speed_multiplier = 1;

if(InTerrain(objForest)){
	speed_multiplier = 0.7;
}
else if (InTerrain(objMarsh)){
	speed_multiplier = 0.5;
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
