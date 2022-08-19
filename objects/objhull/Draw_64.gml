/// @description Health bar

cam_width = camera_get_view_width(camera);
cam_height = camera_get_view_height(camera);

draw_healthbar(cam_width/2 - 50, cam_height/2-100, cam_width/2 + 50, cam_height/2 - 80, health*10, c_black, c_red, c_lime, 0, true, true);