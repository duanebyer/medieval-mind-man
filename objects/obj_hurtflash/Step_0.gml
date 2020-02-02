timer -= 1;
image_alpha = 0.3 * timer / 20;

if (timer == 0) {
	instance_destroy();
}
