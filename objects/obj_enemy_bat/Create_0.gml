/// @description Initial parameters for the bat
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//TODO: CHANGE XWIDTH TO CAMERA WIDTH

DIVE = 5;
CHECK_WALL_DISTANCE = 10;	//the amount of distance before the player stops hitting a wall
gravity_enabled = false;
dive_speed = 300;			//speed at which bat travels during dive mode

XCENTER = x;				//represents the center of the interval on where the bat will travel
XWIDTH = room_width * 0.15;			//represents how far the bat will travel from the center point

BAT_DISTANCE = 250

DIVE_TIMEOUT = 2;				//the amount of time we wait before refreshing velocityX/velocityY in dive mode
DIVE_TIMER = 0			//the current time.

AFTERDIVE = 6;
AFTERDIVE_TIMEOUT = 3;
AFTERDIVE_TIMER = 0;

hp = 1;						//health of the enemy
damage = 1;					//damage inflicted by enemy
dir = choose(-1, 1);			//represents the initial direction the bat is facing
velocity_mag = 180;						//the magnitude of normal velocity
velocity_x = velocity_mag * dir;		//the horizontal speed
velocity_y = 0;				//the vertical speed

sprite_dead = spr_bat_dead;
sprite_hitstun = spr_bat_hitstun;

hitstun_time = 1;
hitstun_timer = 0;
hitstun_friction_air = 500;
hitstun_friction_ground = 1500;