/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
view_width = 640
view_height = 360
window_scale = 2;
if (instance_exists(objOptions)) {
actor = objOptions;
} else {
actor = objPlayer;
}

xx = 0;
yy = 0;
lerpC = .3;
shakex = 0;
shakey = 0;
room_speed = 60;
dir = 1;
window_set_size(view_width*window_scale,view_height*window_scale);
alarm[0] = 1;
surface_resize(application_surface,view_width*window_scale,view_height*window_scale);