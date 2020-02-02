if (state == HITSTUN || state == DEAD) {
	gravity_enabled = true;
	max_fall_speed = NORMAL_FALL_SPEED;
	var fric = hitstun_friction_ground;
	if (place_free(x, y + 1)) {
		fric = hitstun_friction_air;
	}
	var velocity_change_x = fric * DELTA_T;
	if (abs(velocity_x) <= velocity_change_x) {
		velocity_x = 0;
	} else {
		velocity_x += -sign(velocity_x) * velocity_change_x;
	}
}

if (state == HITSTUN) {
	if (hitstun_timer >= hitstun_time && !place_free(x, y + 1)) {
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
}
