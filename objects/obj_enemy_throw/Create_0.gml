event_inherited();

gravity_enabled = true;
max_fall_speed = NORMAL_FALL_SPEED;		

WALK_SPEED = 18;

hp = 5;				//health of the enemy
damage = 1;
velocity_x = WALK_SPEED * dir;				//the horizontal speed

min_throw_vel = 300
max_throw_vel = 1000

scaleDown = 3;				//all of the big blobs motion will be slowed down by this factor

sprite_normal = spr_throw;
sprite_dead = spr_throw_dead;
sprite_hitstun = spr_throw;			

hitstun_time = 0.5; // enemy should not be hitstunned for long
hitstun_timer = 0;
hitstun_friction_air = 500 * scaleDown; //moves slower through air and ground
hitstun_friction_ground = 1500 * scaleDown;

y -= 1;

CREATE_TIMEOUT = 6;
CREATE_TIMER = 0;
MAX_SPAWN = 10;

WITHIN_RANGE = 700;			//only start spawning when player is in sight

mass = 2;