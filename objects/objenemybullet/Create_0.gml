/// @description Insert description here
// You can write your code in this editor

// Random variation
rand = random_range(-10,10);

direction = point_direction(x,y,objHull.x, objHull.y) + rand;

image_angle = direction - 90;
speed = 30;

alarm[0] = room_speed * 5;