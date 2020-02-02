event_inherited();

if (self.state == NORMAL) {
	if (intent_attack_pressed()) {
		if (!place_free(x, y + 1)) {
			self.state = CHARGE;
			self.charge_timer = 0;
		} else {
			self.state = ATTACK_AIR;
			instance_create_depth(self.x, self.y, self.depth - 1, obj_axe_slash_air);
			self.velocity_y = -ATTACK_AIR_VELOCITY_Y;
			self.velocity_x = sign(image_xscale) * ATTACK_AIR_VELOCITY_X;
		}
	}
}

if (self.state == CHARGE || self.state == CHARGE_HEAVY) {
	self.gravity_enabled = true;
	self.max_fall_speed = NORMAL_FALL_SPEED;
	var velocity_change_x = CHARGE_FRICTION * DELTA_T;
	if (abs(self.velocity_x) <= velocity_change_x) {
		self.velocity_x = 0;
	} else {
		self.velocity_x += -sign(self.velocity_x) * velocity_change_x;
	}
}

if (self.state == CHARGE) {
	if (place_free(x, y + 1)) {
		self.state = NORMAL;
	}
	if (self.charge_timer > CHARGE_TIME) {
		if (!intent_attack()) {
			self.state = ATTACK;
			self.attack_timer = 0;
			instance_create_depth(self.x, self.y, self.depth - 1, obj_axe_slash);
			self.velocity_y = -ATTACK_VELOCITY_Y;
			self.velocity_x = image_xscale * ATTACK_VELOCITY_X;
		} else {
			self.state = CHARGE_HEAVY;
			self.charge_timer = 0;
		}
	}
	self.charge_timer += DELTA_T;
	if (self.sprite_index != self.sprite_charge) {
		self.sprite_index = self.sprite_charge;
		self.image_speed = self.image_number / CHARGE_TIME * DELTA_T;
		self.image_index = 0;
	}
}

if (self.state == CHARGE_HEAVY) {
	if (place_free(x, y + 1)) {
		self.state = NORMAL;
	}
	if (self.charge_timer >= CHARGE_HEAVY_TIME) {
		if (!intent_attack()) {
			self.state = ATTACK_HEAVY;
			self.attack_timer = 0;
			instance_create_depth(self.x, self.y, self.depth - 1, obj_axe_slash_heavy);
			self.velocity_y = -ATTACK_HEAVY_VELOCITY_Y;
			self.velocity_x = image_xscale * ATTACK_HEAVY_VELOCITY_X;
		}
	}
	self.charge_timer += DELTA_T;
	if (self.charge_timer >= CHARGE_HEAVY_TIME) {
		self.image_speed = 0;
		self.image_index = self.image_number - 1;
	}
	if (self.sprite_index != self.sprite_charge_heavy) {
		self.sprite_index = self.sprite_charge_heavy;
		self.image_speed = self.image_number / CHARGE_HEAVY_TIME * DELTA_T;
		self.image_index = 0;
	}
}

if (self.state == ATTACK || self.state == ATTACK_HEAVY) {
	self.gravity_enabled = true;
	self.max_fall_speed = ATTACK_FALL_SPEED;
	var fric = place_free(x, y + 1) ? ATTACK_AIR_FRICTION : ATTACK_GROUND_FRICTION;
	var velocity_change_x = fric * DELTA_T;
	if (abs(self.velocity_x) <= velocity_change_x) {
		self.velocity_x = 0;
	} else {
		self.velocity_x += -sign(self.velocity_x) * velocity_change_x;
	}
}

if (self.state == ATTACK) {
	if (self.attack_timer >= ATTACK_TIME) {
		self.image_speed = 0;
		self.image_index = self.image_number - 1;
		if (!place_free(x, y + 1)) {
			self.state = NORMAL;
		}
	}
	self.attack_timer += DELTA_T;
	if (self.sprite_index != self.sprite_attack) {
		self.sprite_index = self.sprite_attack;
		self.image_speed = self.image_number / ATTACK_TIME * DELTA_T;
		self.image_index = 0;
	}
}

if (self.state == ATTACK_HEAVY) {
	if (self.attack_timer >= ATTACK_HEAVY_TIME) {
		self.image_speed = 0;
		self.image_index = self.image_number - 1;
		if (!place_free(x, y + 1)) {
			self.state = NORMAL;
		}
	}
	self.attack_timer += DELTA_T;
	if (self.sprite_index != self.sprite_attack_heavy) {
		self.sprite_index = self.sprite_attack_heavy;
		self.image_speed = self.image_number / ATTACK_HEAVY_TIME * DELTA_T;
		self.image_index = 0;
	}
}

if (self.state == ATTACK_AIR) {
	if (!place_free(x, y + 1)) {
		self.state = NORMAL;
	}
	if (self.sprite_index != self.sprite_attack_air) {
		self.sprite_index = self.sprite_attack_air;
		self.image_speed = 1;
		self.image_index = 0;
	}
	if (self.image_index >= self.image_number - 1) {
		self.image_index = self.image_number - 1;
		self.image_speed = 0;
	}
}
