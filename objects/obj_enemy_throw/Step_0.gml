/// @description Insert description here
// You can write your code in this editor
event_inherited();
var velocity_mag, velocity_angle, player;
if (state == NORMAL){
	if (CREATE_TIMER > CREATE_TIMEOUT && CREATE_TIMER <= MAX_SPAWN * CREATE_TIMER){
		CREATE_TIMER = 0;
		//SPAWN A BLOB, ANIMATION CAN BE BETTER CREATED
		var blob = instance_create_depth(x, y, self.depth - 1, obj_enemy_blob);
		velocity_mag = random_range(min_throw_vel, max_throw_vel);
		velocity_angle = random_range(0, 180);
		blob.velocity_x = velocity_mag * cos(velocity_angle);
		blob.velocity_y = velocity_mag * sin(velocity_angle);
		//adjust velocity to be random
		blob.y = self.y - 50;
	}
	player = instance_find(obj_player, 0);
	if (point_distance(x, y, player.x, player.y) <= WITHIN_RANGE){
		CREATE_TIMER += DELTA_T;
	}
}