event_inherited();

// Additional states used by this subtype.
CHARGE = STATE_END;
FLY = STATE_END + 1;
ATTACK = STATE_END + 2;
STATE_END = STATE_END + 3;

CHARGE_TIME_MIN = 0.2;
CHARGE_TIME_MAX = 0.8;
CHARGE_FRICTION_GROUND = 1200;
CHARGE_FRICTION_AIR = 1000;

FLY_SPEED_MIN = 600;
FLY_SPEED_MAX = 800;
FLY_DISTANCE_MIN = 200;
FLY_DISTANCE_MAX = 300;
FLY_ECCENTRICITY = 0.6;

ATTACK_TIME = 0.4;
ATTACK_FRICTION = 2500;

can_charge = true;

charge_timer = 0;
fly_speed = 0;
fly_distance = 0;
fly_distance_end = 0;
fly_dir_x = 0;
fly_dir_y = 0;

sprite_stand = spr_player_gun_stand;
sprite_walk = spr_player_gun_walk;
sprite_jump = spr_player_gun_jump;
sprite_fall = spr_player_gun_fall;
sprite_charge = spr_player_gun_charge;
sprite_fly_up = spr_player_gun_fly_up;
sprite_fly_right = spr_player_gun_fly_right;
sprite_fly_down = spr_player_gun_fly_down;
sprite_attack = spr_player_gun_attack;
