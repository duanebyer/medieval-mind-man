event_inherited();

CHARGE = STATE_END;
STATE_END = STATE_END + 1;

WALK_SPEED = 30;
CHARGE_TIME = 1;
AGGRO_DISTANCE = 600;
ATTACK_DISTANCE_MIN = 200;
ATTACK_DISTANCE_MAX = 450;
ATTACK_COOLDOWN = 2;
CHECK_WALL_DISTANCE = 20;
CHECK_VOID_DISTANCE = 70;

ATTACK_KNOCKBACK_X = 100;
ATTACK_KNOCKBACK_Y = 100;

MAX_PROJECTILE_SPEED = 1000;

hp = 2;
damage = 1;

charge_timer = 0;
cooldown_timer = 0;

dir = 1;

mass = 2.5;

fire_x = 0;
fire_y = 0;

sprite_dead = spr_mortar;
sprite_hitstun = spr_mortar;
