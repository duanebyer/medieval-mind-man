draw_self();
if (self.state == HITSTUN && !self.is_projectile) {
	draw_sprite(spr_hitstun, self.hitstun_timer * 6, self.x, self.bbox_top - 32);
}
