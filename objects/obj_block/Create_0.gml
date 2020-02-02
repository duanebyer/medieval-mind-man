var old_width = sprite_width;
var old_height = sprite_height;

self.sprite_index = spr_nice_block;
image_xscale = 1;
image_yscale = 1;
var new_width = sprite_width;
var new_height = sprite_height;

image_xscale = old_width / new_width;
image_yscale = old_height / new_height;
