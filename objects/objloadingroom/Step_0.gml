/// @description 

switch (LOADINGSTATE) 
{
	case 0:
	case 1:
		audio_stop_all();
		if (keyboard_check(vk_anykey)) {
			room_goto(rooMain);
			layer_destroy(loadingRoom);
		}
	break;
}
