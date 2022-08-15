/// @description

// Place at the center:
x=1366/2;
y=768/2;

// Offset canon by a little bit.
canon_offset = 8;
objCanon.x = 1366/2 - canon_offset;
objCanon.y = 768/2;

// Variables related to rotation:
image_angle = 0;
rspeed = 0.5;

canonSpeed = 1;

// Variables related to forward/backward movement:
v_current = 0;
v_max = 2;
acc = v_max / 10;

// Alarm event for spawning enemies
alarm[0]=room_speed*5;