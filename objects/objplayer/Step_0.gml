/// @description Movement controls

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

// Rotation:
var dkey = false;
var r    = new Vector2(0,0);
if (key_up)    { r = Add(r, new Vector2( 0, 1)); dkey = true; }
if (key_down)  { r = Add(r, new Vector2( 0,-1)); dkey = true; }
if (key_right) { r = Add(r, new Vector2( 1, 0)); dkey = true; }
if (key_left)  { r = Add(r, new Vector2(-1, 0)); dkey = true; }

// Movement:
