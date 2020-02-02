NORMAL = 1;
HITSTUN = 2;
DEAD = 3;
STATE_END = 4;

GRAVITY = 1000;
NORMAL_FALL_SPEED = 450;

DELTA_T = 1 / room_speed;

state = NORMAL;

gravity_enabled = true;
max_fall_speed = NORMAL_FALL_SPEED;		//D: do we need this?

hp = 3;				//health of the enemy
damage = 1;
velocity_x = 0;				//the horizontal speed
velocity_y = 0;				//the vertical speed

sprite_dead = noone;
sprite_hitstun = noone;

hitstun_time = 1.5;
hitstun_timer = 0;
hitstun_friction_air = 500;
hitstun_friction_ground = 1500;

y -= 1;
