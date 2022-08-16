/// @description Movement controls
// TODO: add terrain?

//draw_healthbar(0, 50, 50, 0, health*10, c_black, c_red, c_lime, 0, true, true);


if(health <= 0){
	show_debug_message("Game Over!");
	room_restart();
}
key_up    = keyboard_check(vk_up)     or keyboard_check(ord("W"));
key_down  = keyboard_check(vk_down)   or keyboard_check(ord("S"));
key_left  = keyboard_check(vk_left)   or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right)  or keyboard_check(ord("D"));
key_shift = keyboard_check(vk_shift);

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

if(alarm[0] == -1){
	alarm[0] = room_speed * 5;;
}