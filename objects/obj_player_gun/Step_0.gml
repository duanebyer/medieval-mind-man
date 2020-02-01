event_inherited();

if (self.state == NORMAL) {
	if (!place_free(x, y + 1)) {
		self.can_charge = true;
	}
	if (intent_attack_pressed() && self.can_charge) {
		self.state = CHARGE;
		self.can_charge = false;
		self.charge_timer = 0;
	}
}

if (self.state == CHARGE) {
	self.gravity_enabled = false;
	var fric = 0;
	if (place_free(x, y + 1)) {
		fric = CHARGE_FRICTION_AIR;
	} else {
		fric = CHARGE_FRICTION_GROUND;
	}
	var velocity_change = fric * DELTA_T;
	var velocity_mag = sqrt(sqr(self.velocity_x) + sqr(self.velocity_y));
	if (velocity_mag <= velocity_change) {
		self.velocity_x = 0;
		self.velocity_y = 0;
	} else {
		self.velocity_x -= velocity_change * self.velocity_x / velocity_mag;
		self.velocity_y -= velocity_change * self.velocity_y / velocity_mag;
	}
	if (!intent_attack() && self.charge_timer >= CHARGE_TIME_MIN || self.charge_timer >= CHARGE_TIME_MAX) {
		var move_dir_x = 0;
		var move_dir_y = 0;
		if (intent_left()) {
			move_dir_x -= 1;
		}
		if (intent_right()) {
			move_dir_x += 1;
		}
		if (intent_up()) {
			move_dir_y -= 1;
		}
		if (intent_down()) {
			move_dir_y += 1;
		}
		if (!place_free(x + move_dir_x * FLY_SPEED_MAX * DELTA_T, y)) {
			move_dir_x = 0;
		}
		if (!place_free(x, y + move_dir_y * FLY_SPEED_MAX * DELTA_T)) {
			move_dir_y = 0;
		}
		var move_dir_mag = sqrt(sqr(move_dir_x) + sqr(move_dir_y));
		if (move_dir_mag == 0) {
			self.state = NORMAL;
		} else {
			self.state = FLY;
			var charge_frac = (self.charge_timer - CHARGE_TIME_MIN) / (CHARGE_TIME_MAX - CHARGE_TIME_MIN);
			self.fly_distance = 0;
			self.fly_distance_end = lerp(
				FLY_DISTANCE_MIN,
				FLY_DISTANCE_MAX,
				charge_frac);
			self.fly_speed = lerp(
				FLY_SPEED_MIN,
				FLY_SPEED_MAX,
				charge_frac);
			self.fly_dir_x = move_dir_x / move_dir_mag;
			self.fly_dir_y = move_dir_y / move_dir_mag;
			self.fly_distance_end = 1 / sqrt(sqr(self.fly_dir_x / self.fly_distance_end) + sqr(self.fly_dir_y / (FLY_ECCENTRICITY * self.fly_distance_end)));
		}
	}
	self.charge_timer += DELTA_T;
	
	if (self.sprite_index != self.sprite_charge) {
		self.sprite_index = self.sprite_charge;
		self.image_speed = self.image_number / CHARGE_TIME_MAX * DELTA_T;
		self.image_index = 0;
	}
}

if (self.state == FLY) {
	self.gravity_enabled = false;
	self.velocity_x = self.fly_dir_x * self.fly_speed;
	self.velocity_y = self.fly_dir_y * self.fly_speed;
	var has_collision = !place_free(x + self.velocity_x * DELTA_T, y + self.velocity_y * DELTA_T);
	if (has_collision || intent_attack_pressed() || self.fly_distance >= self.fly_distance_end) {
		self.state = ATTACK;
		self.attack_timer = 0;
	}
	self.fly_distance += self.fly_speed * DELTA_T;
	
	self.image_speed = 1;
	if (self.fly_dir_x == 0) {
		if (self.fly_dir_y == 1) {
			self.sprite_index = self.sprite_fly_down;
		} else {
			self.sprite_index = self.sprite_fly_up;
		}
	} else {
		self.sprite_index = self.sprite_fly_right;
		self.image_angle = -45 * sign(self.fly_dir_y) * sign(self.fly_dir_x);
		self.image_xscale = sign(self.fly_dir_x);
	}
}

if (self.state == ATTACK) {
	self.gravity_enabled = false;

	var velocity_change = ATTACK_FRICTION * DELTA_T;
	var velocity_mag = sqrt(sqr(self.velocity_x) + sqr(self.velocity_y));
	if (velocity_mag <= velocity_change) {
		self.velocity_x = 0;
		self.velocity_y = 0;
	} else {
		self.velocity_x -= velocity_change * self.velocity_x / velocity_mag;
		self.velocity_y -= velocity_change * self.velocity_y / velocity_mag;
	}
	if (self.attack_timer >= ATTACK_TIME) {
		self.state = NORMAL;
	}
	self.attack_timer += DELTA_T;
	
	if (self.sprite_index != self.sprite_attack) {
		// Correct the image angle after the charge.
		self.image_angle = 0;
		self.sprite_index = self.sprite_attack;
		self.image_speed = self.image_number / ATTACK_TIME * DELTA_T;
		self.image_index = 0;
	}
}
