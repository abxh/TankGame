/// @description 

window_set_caption("Nature's Revenge")

globalvar NAME;
globalvar POINTS;
globalvar LOADINGSTATE;

LOADINGSTATE = 0;

room_goto(rooTitle);
layer_destroy(rooStartup);