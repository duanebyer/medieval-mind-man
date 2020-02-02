if (self.state == NORMAL) {
	self.gravity_enabled = true;
	self.max_fall_speed = NORMAL_FALL_SPEED;
	
	var move_dir = 0;
	if (intent_left()) {
		move_dir -= 1;
	}
	if (intent_right()) {
		move_dir += 1;
	}

	if (move_dir != 0 && move_dir * self.velocity_x < WALK_SPEED) {
		self.velocity_x += move_dir * WALK_ACCELERATION * DELTA_T;
	}

	if (sign(self.velocity_x) != move_dir) {
		var delta_velocity_x = WALK_FRICTION * DELTA_T;
		if (abs(delta_velocity_x) > abs(self.velocity_x)) {
			self.velocity_x = 0;
		} else {
			self.velocity_x += -sign(self.velocity_x) * delta_velocity_x;
		}
	}

	if (intent_jump_pressed() && !place_free(x, y + 1)) {
		self.velocity_y = -JUMP_MAX_SPEED;
	}
	if (!intent_jump() && self.velocity_y < -JUMP_MIN_SPEED && self.velocity_y > -0.96 * JUMP_MAX_SPEED) {
		self.velocity_y += JUMP_FRICTION * DELTA_T;
	}

	self.image_speed = 1;
	if (!place_free(x, y + 1)) {
		if (move_dir == 0) {
			self.sprite_index = self.sprite_stand;
		} else {
			self.sprite_index = self.sprite_walk;
			self.image_xscale = move_dir;
		}
	} else {
		if (self.velocity_y < 0) {
			if (self.sprite_index != self.sprite_jump) {
				self.sprite_index = self.sprite_jump;
				self.image_index = 0;
			} else {
				if (self.image_index >= self.image_number - 1) {
					self.image_index = self.image_number - 1;
					self.image_speed = 0;
				}
			}
		} else {
			self.sprite_index = self.sprite_fall;
		}
		if (move_dir != 0) {
			self.image_xscale = move_dir;
		}
	}
}
