/// @description Set Variables

// Health stuff
health = MAXHEALTH;
points = 0;
scale = 3.5;

// Place at the middle of camera 0:
camera = view_get_camera(0);
x=camera_get_view_x(camera) + camera_get_view_width(camera)/2;
y=camera_get_view_y(camera) + camera_get_view_height(camera)/2;

image_angle = 0;
r_approach  = 0;
r_precision = 10;


// Movement-related:
a_rate  = 0.1;
spd     = 0;
spd_max = 3;

a_rate_sprint = 0.2;
spd_max_sprint = 6;

stamina = 10;
stamina_use_rate = 0.05;
stamina_gain_rate = 0.01;

can_run = true;
running = false;
run_cooldown_time = 2;

// weapon-related
can_shoot = true;
reload_time = 0.5;

incrementer = 0;

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