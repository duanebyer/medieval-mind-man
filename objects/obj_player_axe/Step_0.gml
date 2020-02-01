event_inherited();

if (self.state == NORMAL) {
	if (intent_attack_pressed()) {
		self.state = CHARGE_ATTACK;
		self.charge_attack_timer = 0;
	}
}

if (self.state == ATTACK) {
}
