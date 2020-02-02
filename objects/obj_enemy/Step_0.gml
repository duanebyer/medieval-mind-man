if (state == HITSTUN || state == DEAD) {
	gravity_enabled = true;
	max_fall_speed = NORMAL_FALL_SPEED;
	var fric = hitstun_friction_ground;
	if (place_free(x, y + 1)) {
		fric = hitstun_friction_air;
	}
	var velocity_change = fric * DELTA_T;
	var velocity_mag = sqrt(sqr(velocity_x) + sqr(velocity_y));
	if (abs(velocity_mag) <= velocity_change) {
		velocity_x = 0;
		velocity_y = 0;
	} else {
		velocity_x -= velocity_change * velocity_x / velocity_mag;
		velocity_y -= velocity_change * velocity_y / velocity_mag;
	}
}

if (state == HITSTUN) {
	if (hitstun_timer >= hitstun_time) {
		state = NORMAL;
	}
	hitstun_timer += DELTA_T;
	if (sprite_index != sprite_hitstun) {
		sprite_index = sprite_hitstun;
		image_index = 0;
		image_speed = 1;
	}
}

if (state == DEAD) {
	if (sprite_index != sprite_dead) {
		sprite_index = sprite_dead;
		image_index = 0;
		image_speed = 1;
	}
	damage = 0			//ensures dead enemies cannot damage player
}
