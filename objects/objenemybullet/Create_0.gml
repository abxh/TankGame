/// @description Insert description here
// You can write your code in this editor

// Random variation +- 10 degrees in enemy bullet direction
rand = random_range(-10,10);

direction = point_direction(x,y,objPlayer.x, objPlayer.y) + rand;

image_angle = direction - 90;
speed = 30;

// Alarm for deleting object
alarm[0] = room_speed * 5;