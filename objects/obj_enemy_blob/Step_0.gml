event_inherited();

if (state == NORMAL) {
	gravity_enabled = true;
	max_fall_speed = NORMAL_FALL_SPEED;
	if (!place_free(x, y + 1)) {
		if (!place_free(x + dir * CHECK_WALL_DISTANCE, y)) {
			dir *= -1;
		}
		if (place_free(x + dir * CHECK_VOID_DISTANCE, y + 1)) {
			dir *= -1;
		}
	}
	velocity_x = dir * WALK_SPEED;
}
