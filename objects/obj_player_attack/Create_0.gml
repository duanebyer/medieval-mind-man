damage = 1;
hitstun_velocity_x = 240;
hitstun_velocity_y = 120;

if (instance_exists(obj_player)) {
	self.image_xscale = obj_player.image_xscale;
}
