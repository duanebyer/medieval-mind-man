event_inherited();

if (state == NORMAL) {
	gravity_enabled = true;
	max_fall_speed = NORMAL_FALL_SPEED;
	
	velocity_x = 0;
	var distance_x = 100000;
	var dir = 0;
	if (instance_exists(obj_player)) {
		distance_x = obj_player.x - self.x;
		dir = sign(distance_x);
		if (dir == 0) {
			dir = 1;
		}
	}
	var walk_dir = 0;
	if (abs(distance_x) <= AGGRO_DISTANCE) {
		if (abs(distance_x) <= ATTACK_DISTANCE_MIN) {
			walk_dir = -dir;
		}
		if (abs(distance_x) >= ATTACK_DISTANCE_MAX) {
			walk_dir = dir;
		}
		if (cooldown_timer <= ATTACK_COOLDOWN) {
			var dis = abs(distance_x) - 0.5 * (ATTACK_DISTANCE_MIN + ATTACK_DISTANCE_MAX);
			if (abs(dis) >= 32) {
				walk_dir = dir * sign(dis);
			}
		}
		if (place_free(x + walk_dir * CHECK_WALL_DISTANCE, y) && !place_free(x + walk_dir * CHECK_VOID_DISTANCE, y + 1)) {
			velocity_x = walk_dir * WALK_SPEED;
		}
	
		if (walk_dir == 0 && cooldown_timer >= ATTACK_COOLDOWN && instance_exists(obj_player)) {
			state = CHARGE;
			charge_timer = 0;
			fire_x = obj_player.x;
			fire_y = obj_player.y - 48;
		}
		cooldown_timer += DELTA_T;
	}
	
	sprite_index = spr_mortar;
	image_xscale = dir;
	image_speed = 1 * abs(walk_dir);
}

if (state == CHARGE) {
	if (charge_timer >= CHARGE_TIME) {
		var projectile = instance_create_depth(x + image_xscale * 40, y - 90, depth + 1, obj_mortar_projectile);
		var delta_x = fire_x - projectile.x;
		var delta_y = fire_y - projectile.y;
		var vel = MAX_PROJECTILE_SPEED;
		if (abs(delta_x) + delta_y > 0) {
			vel = abs(delta_x) * sqrt(GRAVITY / (2 * (abs(delta_x) + delta_y)));
			if (vel > MAX_PROJECTILE_SPEED) {
				vel = MAX_PROJECTILE_SPEED;
			}
		}
		projectile.velocity_x = sign(delta_x) * vel;
		projectile.velocity_y = -vel;
		self.velocity_x = -sign(delta_x) * ATTACK_KNOCKBACK_X;
		self.velocity_y = -ATTACK_KNOCKBACK_Y;
		state = NORMAL;
		cooldown_timer = 0;
	}
	charge_timer += DELTA_T;
	if (sprite_index != spr_mortar_charge) {
		sprite_index = spr_mortar_charge;
		image_speed = self.image_number / CHARGE_TIME * DELTA_T;
		image_index = 0;
	}
}
