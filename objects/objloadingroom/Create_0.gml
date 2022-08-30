/// @description Insert description here
// You can write your code in this editor

globalvar BULLETSPEED;
globalvar MAXHEALTH;
globalvar MISSILEDAMAGE;

BULLETSPEED = 30;
MAXHEALTH = 100;
MISSILEDAMAGE = 3;

room_goto(rooMain);

layer_destroy(loadingRoom);