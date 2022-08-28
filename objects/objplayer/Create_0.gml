/// @description Set Variables
// 
// Music by Karl Casey @ White Bat Audio

// Place at the middle of camera 0:
camera = view_get_camera(0);
x=camera_get_view_x(camera) + camera_get_view_width(camera)/2;
y=camera_get_view_y(camera) + camera_get_view_height(camera)/2;

image_angle = 0;
r_approach  = 0;
r_precision = 10;

// Movement-related:
frame_front1  = 0; // one leg forward, one leg backward
frame_front2  = 6; // one leg backward, one leg forward

a_rate  = 0.5;
spd     = 0;
spd_max = 2;

// Probably should be under loadingRoom
window_set_caption("Planet Robotnik")