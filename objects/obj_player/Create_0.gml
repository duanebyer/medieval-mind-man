// Player states.

NORMAL = 1;
HITSTUN = 2;
STATE_END = 4;
DEAD = 3;
death_timer = 0;

GRAVITY = 1000;
NORMAL_FALL_SPEED = 450;

WALK_ACCELERATION = 1500;
WALK_FRICTION = 2000;
WALK_SPEED = 230;

JUMP_FRICTION = 1400;
JUMP_MIN_SPEED = 100;
JUMP_MAX_SPEED = 500;

HITSTUN_VELOCITY_X = 500;
HITSTUN_VELOCITY_Y = 300;
HITSTUN_TIME = 0.3;
HITSTUN_FRICTION_AIR = 600;
HITSTUN_FRICTION_GROUND = 1200;

DELTA_T = 1 / room_speed;

state = NORMAL;

sprite_stand = spr_player_axe_stand;
sprite_walk = spr_player_axe_walk;
sprite_jump = spr_player_axe_jump;
sprite_fall = spr_player_axe_fall;

gravity_enabled = true;
max_fall_speed = NORMAL_FALL_SPEED;

hitstun_timer = 0;

velocity_x = 0;
velocity_y = 0;

hp = 3