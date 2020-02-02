event_inherited();

var tempMag;
var player;

if (state == NORMAL) {
	DIVE_TIMER = 0;
	velocity_y = 0;
	gravity_enabled = false;
	if (!place_free(x + dir * CHECK_WALL_DISTANCE, y)) {
		dir *= -1;
	}
	else if (XWIDTH < dir * (x - XCENTER)){
		x -= 1;
		dir *= -1;
	}
	velocity_x = dir * velocity_mag;
	image_xscale = dir;
	player = instance_find(obj_player, 0);
	if (point_distance(x, y, player.x, player.y) <= BAT_DISTANCE){
		state = DIVE;	
		if (velocity_x < 0){
			dir = -1	
		}
		velocity_x = player.x - self.x;
		velocity_y = player.y - self.y;
		tempMag = sqrt(sqr(velocity_x) + sqr(velocity_y) + 1);
		velocity_x = velocity_x * dive_speed / tempMag;
		velocity_y = 0;
	}
}
if (state == DIVE) {
	gravity_enabled = true;
	DIVE_TIMER += DELTA_T;
	if (DIVE_TIMER > DIVE_TIMEOUT || !place_free(x, y+1)){
		state = AFTERDIVE;
		DIVE_TIMER = 0
	}
	else if (!place_free(x+1, y) || !place_free(x-1, y)){
		state = AFTERDIVE;
		dir *= -1;
		image_xscale = dir; //last addition
		DIVE_TIMER = 0
	}
}
if (state == AFTERDIVE){
	gravity_enabled = false;
	velocity_y = -75
	AFTERDIVE_TIMER += DELTA_T;
	if (AFTERDIVE_TIMER > AFTERDIVE_TIMEOUT){
		state = NORMAL;
		AFTERDIVE_TIMER = 0;
	}
	XCENTER = x;
}