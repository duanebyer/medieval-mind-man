///@description 
if (state != HITSTUN && state != DEAD) {
	hp -= other.damage;
	if (hp >= 0) {
		state = HITSTUN;
		hitstun_timer = 0;
	} else {
		state = DEAD;
	}
	velocity_x = other.image_xscale * other.hitstun_velocity_x;
	velocity_y = other.image_yscale * other.hitstun_velocity_y;

	instance_create_depth(x, y, depth - 1, obj_flash);
}
