/// @description 

var hx = 1000;
var hy = 20;

draw_healthbar(hx, hy, hx+580 , hy+30,(health/MAXHEALTH)*100, c_black, c_red, c_lime, 0, true, true);

// stamina bar
draw_healthbar(hx, hy + 45, hx+580, hy+75, (stamina/10)*100, c_black, c_black, c_aqua, 0, true, true);

draw_set_font(fntClearSansMedium);
draw_text(20,hy,    "Level "+string(floor(objSpawner.level)));

draw_set_font(fntClearSansSmall);
draw_text(20,hy+20, "\nPoints: "+string(points)
				   +"\nMissile Damage: "+string(MISSILEDAMAGE));
				   

// Draw outline on selceted enemy
var cam_x = camera_get_view_x(camera);
var cam_y = camera_get_view_y(camera);

var front_enemy = GetFrontEnemy();
if(front_enemy != noone){
	draw_circle(front_enemy.x - cam_x, front_enemy.y - cam_y, 30, true);
}