event_inherited();

WALK_SPEED = 120;
CHECK_WALL_DISTANCE = 10;
CHECK_VOID_DISTANCE = 32;

hp = 3;
damage = 1;

dir = choose(-1, 1);	//current direction of the enemy
velocity_x = dir * 180;				//the horizontal speed
velocity_y = 0;				//the vertical speed

sprite_normal = spr_blob;
sprite_dead = spr_blob_dead;
sprite_hitstun = spr_blob_hitstun;
