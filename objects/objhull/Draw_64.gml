/// @description Health bar

// absolute x,y position of camera
var cam_pos_x = camera_get_view_x(camera);
var cam_pos_y = camera_get_view_y(camera);

// relate position of objHull to camera
var x_cam = x - cam_pos_x;
var y_cam = y - cam_pos_y;


var x_1 = x_cam-100;
var y_1 = y_cam+100;

var x_2 =x_cam+100;
var y_2 = y_cam+120;

var pc = (enemy_health/enemy_max_health) * 100;


draw_healthbar(x_1, y_1, x_2, y_2, pc, c_black, c_maroon, c_red, 0, true, true);

