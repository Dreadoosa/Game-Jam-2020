/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
view_width = 640
view_height = 360
window_scale = 2;
xx = 0;
yy = 0;
lerpC = .3;
room_speed = 60;
global.gain = .1;
global.emitter = audio_emitter_create();
audio_emitter_gain(global.emitter,.1)
audio_master_gain(global.gain)
dir = 1;
window_set_size(view_width*window_scale,view_height*window_scale);
alarm[0] = 1;
surface_resize(application_surface,view_width*window_scale,view_height*window_scale);