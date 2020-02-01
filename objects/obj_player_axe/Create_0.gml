event_inherited();

// Additional states used by this subtype.
CHARGE = STATE_END;
ATTACK = STATE_END + 1;
STATE_END = STATE_END + 2;

CHARGE_TIME_MIN = 0.5;
CHARGE_TIME_MAX = 2;
CHARGE_FRICTION = 250;

ATTACK_TIME = 0.4;
ATTACK_FRICTION = 400;

charge_timer = 0;
attack_timer = 0;
