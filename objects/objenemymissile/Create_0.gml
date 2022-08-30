/// @description Insert description here
// You can write your code in this editor

spd = 1;
max_spd = 10;
acc = 0.2;

instantiator = 0;
enemy = self;

image_angle = objHull.image_angle;

iterator = 1;

dir_vec = new Vector2(1,0);
dir_vec.Rotate(image_angle);

max_angle = 90;

damage = 5;

image_xscale = 3.5;
image_yscale = 3.5;