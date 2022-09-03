/// @description 

key_shift = keyboard_check_pressed(vk_shift)  or gamepad_button_check_pressed(4, gp_face1);

if (key_shift) {
	room_goto(rooTitle);
	layer_destroy(rooHighScore);
}