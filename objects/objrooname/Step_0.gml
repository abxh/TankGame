/// @description 

key_up    = keyboard_check(vk_up)     or keyboard_check(ord("W")) or gamepad_axis_value(4, gp_axislv) < -0.5;
key_down  = keyboard_check(vk_down)   or keyboard_check(ord("S")) or gamepad_axis_value(4, gp_axislv) >  0.5;
key_left  = keyboard_check(vk_left)   or keyboard_check(ord("A")) or gamepad_axis_value(4, gp_axislh) < -0.5;
key_right = keyboard_check(vk_right)  or keyboard_check(ord("D")) or gamepad_axis_value(4, gp_axislh) >  0.5;
key_shift = keyboard_check_pressed(vk_shift)  or gamepad_button_check_pressed(4, gp_face1);
key_space = keyboard_check_pressed(vk_space)  or gamepad_button_check_pressed(4, gp_face2);

if (alarm[0] == -1) alarm[0] = room_speed / 16;
/* objRooName/Alarm_0.gml
if (key_left and selected > selected_row * rowMaxSize) {
	selected-=1;
}
if (key_right and selected < (selected_row+1) * rowMaxSize - 1) {
	selected+=1;
}
*/
if (alarm[1] == -1) alarm[1] = room_speed / 8;
/* objRooName/Alarm_1.gml
if (key_up and (selected_row-1) >= 0) {
	selected-=rowMaxSize;
	selected_row-=1;
}
if (key_down and (selected_row+1) < rows) {
	selected+=rowMaxSize;
	selected_row+=1;
}
*/

if (key_shift and nameCharList_selected >= 0) {
	nameCharList_selected-=1;
	ds_list_replace(nameCharList, nameCharList_selected, "_");
}

if (key_space and nameCharList_selected < nameSize) {
	selected_char = ds_list_find_value(alphabetCharList, selected);
	ds_list_replace(nameCharList, nameCharList_selected, selected_char);
	nameCharList_selected+=1;
}

if (nameCharList_selected == nameSize) {
	NAME = "";
	for (i=0; i < nameSize; i++) {
		NAME += ds_list_find_value(nameCharList, i)
	}
	room_goto(rooHighScore);
	layer_destroy(rooName);
}