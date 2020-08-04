/// @description Insert description here
// You can write your code in this editor
#macro view view_camera[0]
xx = lerp(xx,objPlayer.x,lerpC)
yy = lerp(yy,objPlayer.y,lerpC)
camera_set_view_size(view,view_width,view_height)
camera_set_view_pos(view,xx-view_width/2,yy-view_height/2);
dir*=-1;