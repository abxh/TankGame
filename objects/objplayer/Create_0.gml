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
a_rate  = 0.1;
spd     = 0;
spd_max = 3;

