/// @description 

key_space = keyboard_check(vk_space) or gamepad_button_check(4, gp_face2);

if (key_space) {
	room_goto(rooGame);
	layer_destroy(rooTitle);
}