///@description deals damage to the player

with (other){
	other.hp -= HP_DAMAGE_BY_ENEMY;
	//TODO: if other.hp <= 0, gameover
}