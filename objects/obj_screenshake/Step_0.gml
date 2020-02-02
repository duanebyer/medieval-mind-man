timer -= 1;
var amount2 = amount * (timer / 10);
camera_set_view_angle(view_camera[0], random(2 * amount2) - amount2);
if (timer == 0) {
	instance_destroy();
}