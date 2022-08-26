/// @description Set Variables
// https://www.youtube.com/watch?v=u4zGiH_2lgY
// Music by Karl Casey @ White Bat Audio

// Place at the middle of camera 0:
camera = view_get_camera(0);
x=camera_get_view_x(camera) + camera_get_view_width(camera)/2;
y=camera_get_view_y(camera) + camera_get_view_height(camera)/2;

image_speed   = 0 // Stop animation loop.
middle_frame1 = 2 // both legs beside each other.
middle_frame2 = 6 // both legs beside each other.

a_rate = 0.1;   // acceleration pr. frame.
v_mag = 0; // current speed.
v_max = 2; // maximum speed

image_angle = 0;
r_speed = 45;
