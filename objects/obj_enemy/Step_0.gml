/// @description Moves the Bad Guy
// You can write your code in this editor
x += dir * velocity_x;

if (place_free(x, y)){
	y += velocity_y * DELTA_T
	if (velocity_y < MAX_FALL_SPEED){
		velocity_y += GRAVITY * DELTA_T;	
	}
}
else{
	if (dir == 1 && place_free(x+sprite_width, y+1)){
		x = (x & $ffffffc0)
		dir *= -1
	}
	else if (dir == -1 && place_free(x-sprite_width, y+1)){
		x = (x & $ffffffc0)
		dir *= -1
	}
}