event_inherited();

// Additional states used by this subtype.
CHARGE = STATE_END;
ATTACK = STATE_END + 1;
STATE_END = STATE_END + 2;

CHARGE_TIME_MIN = 0.3;
CHARGE_TIME_MAX = 2;
CHARGE_GROUND_FRICTION = 250;
CHARGE_AIR_FRICTION_MIN = 0;
CHARGE_AIR_FRICTION_MAX = 250;
CHARGE_JUMP_VELOCITY = 100;

ATTACK_TIME = 0.25;
ATTACK_GROUND_FRICTION = 400;
ATTACK_AIR_FRICTION = 0;

ATTACK_GROUND_VELOCITY_Y = 100;
ATTACK_GROUND_VELOCITY_X = 300;

ATTACK_JUMP_VELOCITY_Y = 150;
ATTACK_JUMP_VELOCITY_X = 250;
ATTACK_FALL_SPEED = 550;

sprite_stand = spr_player_axe_stand;
sprite_walk = spr_player_axe_walk;
sprite_jump = spr_player_axe_jump;
sprite_fall = spr_player_axe_fall;
sprite_charge = spr_player_axe_charge;
sprite_attack = spr_player_axe_attack;

charge_timer = 0;
attack_timer = 0;
