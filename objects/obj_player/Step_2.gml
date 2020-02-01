var delta_x = self.velocity_x * DELTA_T;
var delta_y = self.velocity_y * DELTA_T;

if (self.gravity_enabled) {
	if (self.velocity_y < self.max_fall_speed && place_free(x, y + 1)) {
		self.velocity_y += GRAVITY * DELTA_T;
	}
}

// Move horizontally.
if (!place_free(x + delta_x, y)) {
	for (var i = 0; i < delta_x; ++i) {
		if (place_free(x + sign(delta_x), y)) {
			self.x += sign(delta_x);
		} else {
			break;
		}
	}
	self.velocity_x = 0;
} else {
	self.x += delta_x;
}

// Move vertically.
if (!place_free(x, y + delta_y)) {
	for (var i = 0; i < delta_y; ++i) {
		if (place_free(x, y + sign(delta_y))) {
			self.y += sign(delta_y);
		} else {
			break;
		}
	}
	self.velocity_y = 0;
} else {
	self.y += delta_y;
}
