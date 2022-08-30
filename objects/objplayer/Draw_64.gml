/// @description Insert description here
// You can write your code in this editor

var hx = 1000;
var hy = 20;

draw_healthbar(hx, hy, hx+580 , hy+30,(health/MAXHEALTH)*100, c_black, c_red, c_lime, 0, true, true);

draw_text(hy,hy, "Level "+string(floor(objSpawner.difficulty / 8.6)+1)
				+"\nPoints: "+string(points)
				+"\nMissile Damage: "+string(MISSILEDAMAGE));
	