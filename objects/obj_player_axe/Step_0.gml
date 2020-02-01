event_inherited();

if (self.state == NORMAL) {
	if (intent_attack_pressed()) {
		self.state = CHARGE;
		self.charge_timer = 0;
		if (place_free(x, y + 1) && self.velocity_y >= 0) {
			self.velocity_y = -CHARGE_JUMP_VELOCITY;
		}
	}
}

if (self.state == CHARGE) {
	self.gravity_enabled = true;
	self.max_fall_speed = NORMAL_FALL_SPEED;
	var fric = 0;
	if (!place_free(x, y + 1)) {
		fric = CHARGE_GROUND_FRICTION;
	} else {
		var move_dir = 0;
		if (intent_left()) {
			move_dir -= 1;
		}
		if (intent_right()) {
			move_dir += 1;
		}
		if (move_dir != sign(self.velocity_x)) {
			fric = CHARGE_AIR_FRICTION_MAX;
		} else {
			fric = CHARGE_AIR_FRICTION_MIN;
		}
	}
	var velocity_change_x = fric * DELTA_T;
	if (abs(self.velocity_x) <= velocity_change_x) {
		self.velocity_x = 0;
	} else {
		self.velocity_x += -sign(self.velocity_x) * velocity_change_x;
	}
	if (!intent_attack() && self.charge_timer > CHARGE_TIME_MIN) {
		self.state = ATTACK;
		self.attack_timer = 0;
		if (place_free(x, y + 1)) {
			self.velocity_y = -ATTACK_JUMP_VELOCITY_Y;
			self.velocity_x = image_xscale * ATTACK_JUMP_VELOCITY_X;
		} else {
			self.velocity_y = -ATTACK_GROUND_VELOCITY_Y;
			self.velocity_x = image_xscale * ATTACK_GROUND_VELOCITY_X;
		}
	}
	if (self.charge_timer >= CHARGE_TIME_MAX) {
		self.image_speed = 0;
		self.image_index = self.image_number - 1;
	}
	self.charge_timer += DELTA_T;
	if (self.sprite_index != spr_player_charge) {
		self.sprite_index = spr_player_charge;
		self.image_speed = self.image_number / CHARGE_TIME_MAX * DELTA_T;
		self.image_index = 0;
	}
}

if (self.state == ATTACK) {
	self.gravity_enabled = true;
	self.max_fall_speed = ATTACK_FALL_SPEED;
	var fric = place_free(x, y + 1) ? ATTACK_AIR_FRICTION : ATTACK_GROUND_FRICTION;
	var velocity_change_x = fric * DELTA_T;
	if (abs(self.velocity_x) <= velocity_change_x) {
		self.velocity_x = 0;
	} else {
		self.velocity_x += -sign(self.velocity_x) * velocity_change_x;
	}
	if (self.attack_timer >= ATTACK_TIME) {
		self.image_speed = 0;
		self.image_index = self.image_number - 1;
		if (!place_free(x, y + 1)) {
			self.state = NORMAL;
		}
	}
	self.attack_timer += DELTA_T;
	if (self.sprite_index != spr_player_attack) {
		self.sprite_index = spr_player_attack;
		self.image_speed = self.image_number / ATTACK_TIME * DELTA_T;
		self.image_index = 0;
	}
}
