/// @description Initial parameters for the bat
// You can write your code in this editor

// Inherit the parent event
event_inherited();

gravity_enabled = false;
max_fall_speed = NORMAL_FALL_SPEED;

hp = 1;						//health of the enemy
damage = 1;					//damage inflicted by enemy
velocity_x = 3;				//the horizontal speed
velocity_y = 0;				//the vertical speed

sprite_dead = spr_bat_dead;
sprite_hitstun = spr_bat_hitstun;

hitstun_time = 1;
hitstun_timer = 0;
hitstun_friction_air = 500;
hitstun_friction_ground = 1500;