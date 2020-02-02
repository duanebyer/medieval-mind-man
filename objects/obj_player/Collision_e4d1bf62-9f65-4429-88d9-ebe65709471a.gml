if (other.state != other.DEAD && other.state != other.HITSTUN && self.state != HITSTUN) {
	self.state = HITSTUN;
	self.hp = -other.damage;
	self.hitstun_timer = 0;
	self.velocity_y = -HITSTUN_VELOCITY_Y;
	self.velocity_x = -sign(other.x - self.x) * HITSTUN_VELOCITY_X;
}
