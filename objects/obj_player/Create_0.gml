// Player states.

NORMAL = 1;
STATE_END = 2;

GRAVITY = 1000;
NORMAL_FALL_SPEED = 450;

WALK_ACCELERATION = 1400;
WALK_FRICTION = 2000;
WALK_SPEED = 170;

JUMP_FRICTION = 1400;
JUMP_MIN_SPEED = 100;
JUMP_MAX_SPEED = 500;

DELTA_T = 1 / room_speed;

state = NORMAL;

gravity_enabled = true;
max_fall_speed = NORMAL_FALL_SPEED;

velocity_x = 0;
velocity_y = 0;

hp = 10