/// @description Movement controls
// TODO: add terrain?

if(health <= 0){
	show_debug_message("Game Over!");
	room_restart();
}

if(alarm[0] == -1){
	alarm[0] = room_speed * 5;;
}

key_up    = keyboard_check(vk_up)     or keyboard_check(ord("W")) or gamepad_axis_value(4, gp_axislv) < -0.5;
key_down  = keyboard_check(vk_down)   or keyboard_check(ord("S")) or gamepad_axis_value(4, gp_axislv) >  0.5;
key_left  = keyboard_check(vk_left)   or keyboard_check(ord("A")) or gamepad_axis_value(4, gp_axislh) < -0.5;
key_right = keyboard_check(vk_right)  or keyboard_check(ord("D")) or gamepad_axis_value(4, gp_axislh) >  0.5;
key_shift = keyboard_check(vk_shift)  or gamepad_button_check(4, gp_face1);
key_space = keyboard_check(vk_space)  or gamepad_button_check(4, gp_face2);

// Shoot:
if(key_space and can_shoot){
	instance_create_layer(objCanon.x, objCanon.y,rooMain, objBullet);
	alarm[1] = room_speed * 1;
	can_shoot = false;
}

// Rotation:
if (key_left) rd = 1;
if (key_right) rd = -1;

if (key_left or key_right) and !(key_left and key_right) {
	if !(key_shift) {
		image_angle += rd*rspeed;
		objCanon.image_angle += rd*rspeed;
	}
	else
	{
		objCanon.image_angle += rd*canonSpeed;
	}
}

if (key_shift) {
	// Do not run the code in the following lines,
	// if the shift key is pressed.
	return;
}

// Forward / backward movement:
if (key_up) d = 1;
if (key_down) d = -1;

if (key_up or key_down) and !(key_up and key_down) {
	// Increase by acc towards d*v_max
	if (abs(v_current) < v_max) {
		v_current += d*acc;
	}
}
else {
	// Go towards zero.
	if (v_current != 0) {
		v_current -= sign(v_current)*acc;
	}
}

// Some trigonometry to get new x,y coordinates.
x += dcos(-image_angle)*v_current;
y += dsin(-image_angle)*v_current;

// Keep offset consistent with rotation.
objCanon.x = x;
objCanon.y = y;
objCanon.x += -dcos(-image_angle)*canon_offset;
objCanon.y += -dsin(-image_angle)*canon_offset;