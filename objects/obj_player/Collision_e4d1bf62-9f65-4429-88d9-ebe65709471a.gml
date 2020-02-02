if (other.state != other.DEAD && other.state != other.HITSTUN && self.state != HITSTUN) {
	if (!other.is_reflected) {
		instance_create_depth(x, y, depth - 20, obj_hurtflash);
		var shake = instance_create_depth(x, y, depth, obj_screenshake);
		shake.amount = 6;
		self.state = HITSTUN;
		self.hp -= other.damage;
		self.hitstun_timer = 0;
		self.velocity_y = -HITSTUN_VELOCITY_Y;
		self.velocity_x = -sign(other.x - self.x) * HITSTUN_VELOCITY_X;
		if (other.is_projectile) {
			with(other) {
				instance_destroy();
			}
		} else {
			with (other) {
				state = HITSTUN;
				hitstun_timer = self.hitstun_time / 2;
				velocity_x = -sign(other.x - self.x) * other.HITSTUN_VELOCITY_X / mass;
			}
		}
		if (self.hp == 0) {
			for (var i = 0; i < 5; ++i) {
				var ix = instance_create_depth(x + random(200) - 100, y + random(200) - 100, depth - 20, obj_hurtflash);
				ix.image_xscale = 0.2;
				ix.image_yscale = 0.2;
			}
		}
	}
}
