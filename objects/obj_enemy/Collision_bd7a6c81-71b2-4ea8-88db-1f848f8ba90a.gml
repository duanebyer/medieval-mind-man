///@description 
hp -= other.damage;
if (hp >= 0) {
	state = HIT_STUN;
	hitstun_timer = 0;
} else {
	state = HIT_DEAD;
}
velocity_x = other.hitstun_velocity_x;
velocity_y = other.hitstun_velocity_y;
