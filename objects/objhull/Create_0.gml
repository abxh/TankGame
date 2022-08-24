health = global.MAXHEALTH;

// Place at the center
camera = view_get_camera(0);
x=camera_get_view_x(camera) + camera_get_view_width(camera)/2;
y=camera_get_view_y(camera) + camera_get_view_height(camera)/2;


// Offset canon by a little bit.
canon_offset = 8;
objCanon.x = x - canon_offset;
objCanon.y = y;

// Variables related to rotation:
image_angle = 0;
rspeed = 0.5;

canonSpeed = 2;

// Variables related to forward/backward movement:
v_current = 0;
v_max = 2;
acc = v_max / 10;

can_shoot = true;