/// @description Spawn Enemies

width = room_height;
height = room_width;

camera = view_get_camera(0);
cam_width = camera_get_view_width(camera);
cam_height = camera_get_view_height(camera);

// The distance from the center to a corner
len = sqrt((cam_width*cam_width)/4 + (cam_height*cam_height)/4);

// generates a random angle
rand_angle = random_range(0,360);

// Vector contains the position of the new enemy
vec = new Vector2(0,1);
vec.Rotate(rand_angle);

// Scales vector so enemies spawns outside the screen
vec.Scale(len);

instance_create_layer(vec.x + objHull.x,vec.y + objHull.y, rooMain, objEnemy);

show_debug_message("Enemy created");