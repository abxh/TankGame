/// @description Insert description here
// You can write your code in this editor

//draw_circle_colour(x, y, 100, c_white, c_black, false);

var cam = view_get_camera(0);
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
	
if(instance_exists(enemy) && enemy != 0){
	draw_circle(enemy.x - cam_x, enemy.y - cam_y, 50, true);
}