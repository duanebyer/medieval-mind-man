event_inherited();

damage = 3;
hitstun_velocity_x = 1000;
hitstun_velocity_y = -500;
var shake = instance_create_depth(x, y, depth, obj_screenshake);
shake.amount = 5;
