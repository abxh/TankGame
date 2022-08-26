enemy_health = 100;
spd = 3;



range_go = 200;

range_shoot = 600;

canon = instance_create_layer(x,y,"insEnemy", objCanon);

// Offset canon by a little bit.
canon_offset = 8;
canon.x = x - canon_offset;
canon.y = y;

// Variables related to rotation:
image_angle = point_direction(x,y,objPlayer.x, objPlayer.y);


rspeed = 0.5;

canon_speed = 2;

acc = 0.3;

can_shoot = true;

loading_val = 0;

max_angle = 10;