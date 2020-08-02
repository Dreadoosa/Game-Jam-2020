/// @description Insert description here
// You can write your code in this editor
#macro view view_camera[0]
var _x = objPlayer.x
var _y = objPlayer.y
camera_set_view_size(view,view_width,view_height)
camera_set_view_pos(view,_x-view_width/2,_y-view_height/2);
dir*=-1;