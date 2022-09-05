/// @description Insert description here
// You can write your code in this editor

enemy_health = 3;

spd = 3;

// Extreamley hacky code so we can inheriet
// Step event from objEnemyParent
min_range_go = 0;
max_range_go = 0;

range_go = 0;
range_shoot = 0;

status = "find_path";

can_shoot = false;
bullets_count = 0;


damage = 10;

direction = point_direction(x,y, objPlayer.x, objPlayer.y);

image_angle = direction;

killed_by_player = true;

image_yscale = 1.5;
image_xscale = 1.5;