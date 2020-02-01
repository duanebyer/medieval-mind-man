event_inherited();

if (self.state == NORMAL) {
	if (intent_attack_pressed()) {
		self.state = CHARGE;
		self.charge_timer = 0;
	}
}

if (self.state == CHARGE) {
	self.gravity_enabled = true;
	var velocity_change_x = CHARGE_FRICTION * DELTA_T;
	if (abs(self.velocity_x) <= velocity_change_x) {
		self.velocity_x = 0;
	} else {
		self.velocity_x += -sign(self.velocity_x) * velocity_change_x;
	}
	if (!intent_attack() && self.charge_timer > CHARGE_TIME_MIN) {
		self.state = ATTACK;
		self.attack_timer = 0;
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
	var velocity_change_x = ATTACK_FRICTION * DELTA_T;
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
