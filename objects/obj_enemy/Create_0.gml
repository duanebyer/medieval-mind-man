/// @description Creates a bad guy

hp = 3;				//health of the enemy
damage = 1;
dir = choose(-1, 1);	//current direction of the enemy
velocity_x = 3;				//the horizontal speed
velocity_y = 0;				//the vertical speed

HP_DAMAGE_BY_ENEMY = 2

//STUFF COPIED FROM DUANE

NORMAL = 1;
STATE_END = 2;

GRAVITY = 1000;
MAX_FALL_SPEED = 450;

WALK_ACCELERATION = 1400;
WALK_FRICTION = 2000;
WALK_SPEED = 170;

JUMP_FRICTION = 1400;
JUMP_MIN_SPEED = 100;
JUMP_MAX_SPEED = 500;

DELTA_T = 1 / room_speed;

state = NORMAL;