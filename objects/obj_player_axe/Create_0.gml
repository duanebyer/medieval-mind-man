event_inherited();

// Additional states used by this subtype.
CHARGE = STATE_END;
ATTACK = STATE_END + 1;
CHARGE_HEAVY = STATE_END + 2;
ATTACK_HEAVY = STATE_END + 3;
ATTACK_AIR = STATE_END + 4;
ATTACK_LANDING = STATE_END + 5;
STATE_END = STATE_END + 6;

CHARGE_TIME = 0.2;
CHARGE_HEAVY_TIME = 1;
CHARGE_FRICTION = 600;

ATTACK_TIME = 0.25;
ATTACK_HEAVY_TIME = 0.4;
ATTACK_LANDING_TIME = 0.3;
ATTACK_GROUND_FRICTION = 400;
ATTACK_AIR_FRICTION = 0;

ATTACK_VELOCITY_Y = 60;
ATTACK_VELOCITY_X = 150;

ATTACK_HEAVY_VELOCITY_Y = 100;
ATTACK_HEAVY_VELOCITY_X = 300;

ATTACK_AIR_VELOCITY_Y = 150;
ATTACK_AIR_VELOCITY_X = 250;
ATTACK_FALL_SPEED = 550;

sprite_stand = spr_player_axe_stand;
sprite_walk = spr_player_axe_walk;
sprite_jump = spr_player_axe_jump;
sprite_fall = spr_player_axe_fall;
sprite_charge = spr_player_axe_charge;
sprite_charge_heavy = spr_player_axe_charge_heavy;
sprite_attack = spr_player_axe_attack;
sprite_attack_heavy = spr_player_axe_attack_heavy;
sprite_attack_air = spr_player_axe_attack_air;
sprite_attack_landing = spr_player_axe_attack_landing;

charge_timer = 0;
attack_timer = 0;
