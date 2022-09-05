/// @description

health+=5
if(health > MAXHEALTH){ // prevent health being above maxhealth
	health = MAXHEALTH;
}

instance_destroy(self);