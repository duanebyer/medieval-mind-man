event_inherited();

damage = 1;
hitstun_velocity_x = 900;
hitstun_velocity_y = -400;
var shake = instance_create_depth(x, y, depth, obj_screenshake);
shake.amount = 4;
