if (abs(self.velocity_x - other.velocity_x) <= 50) {
	if (other.x == self.x) {
		if (place_free(self.x + 1, y)) {
			self.x += 1;
		} else if (place_free(self.x - 1, y)) {
			self.x -= 1;
		}
	}

	if (other.x != self.x) {
		var displacement = -200 * DELTA_T * sign(other.x - self.x);
		if (place_free(self.x + displacement, y)) {
			self.x += displacement;
		}
	}
}
