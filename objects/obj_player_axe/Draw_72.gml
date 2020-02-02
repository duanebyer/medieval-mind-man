var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var back = layer_get_id("Background");
var over1 = layer_get_id("Overlay1");
var over2 = layer_get_id("Overlay2");
layer_x(back, 0.15 * cam_x);
layer_y(back, cam_y);
layer_x(over1, 0.3 * cam_x);
layer_y(over1, cam_y);
layer_x(over2, 0.4 * cam_x);
layer_y(over2, cam_y);
show_debug_message(string(cam_x))
