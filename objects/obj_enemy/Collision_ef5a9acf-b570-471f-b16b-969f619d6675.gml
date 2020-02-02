if (other.is_projectile && other.is_reflected) {
		hp -= other.damage;
		if (hp >= 0) {
			state = HITSTUN;
			hitstun_timer = 0;
		} else {
			state = DEAD;
		}
		velocity_x = sign(other.velocity_x) * 400;
		velocity_y = -300;

		var flash = instance_create_depth(x, y, depth - 1, obj_flash);
		var angle = -radtodeg(arctan2(velocity_y, velocity_x));
		flash.image_angle = angle;
		with(other) {
			instance_destroy();
		}
}
if (abs(self.velocity_x - other.velocity_x) <= 10) {
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
