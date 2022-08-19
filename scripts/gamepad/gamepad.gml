// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetGamepadID(){
	for(var i = 0; i < 12; i++){
		var s = gamepad_get_guid(i);
		//if(s != "none"){
		//	return i;
		//}
		show_debug_message("ID: "+ string(i) + " " + s);
	}
}