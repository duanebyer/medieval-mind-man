/// @description To be triggered if the weapon hits the enemy
// You can write your code in this editor
with (other){
	hp -= damage;
	if (hp <= 0){
		sprite_index = dead_bad_guy;
	}	
	// TODO: TRIGGER HITSTUN ON ENEMY
	event_user(0);
}