/// @description Reset alarm.

if(alarm[0] == -1){
	alarm[0] = room_speed * 5 * 1/difficulty ;
}

if(alarm[1] == -1){
	alarm[1] = room_speed * 7;
}