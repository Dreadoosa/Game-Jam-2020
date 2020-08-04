/// @description Insert description here
// You can write your code in this editor
#macro view view_camera[0]

if (shakex != 0) {
shakex = scrApproachZero(shakex,irandom_range(0,1))
}
if (shakey != 0) {
shakey = scrApproachZero(shakey,irandom_range(0,1))
}

xx = lerp(xx,objPlayer.x,lerpC)
yy = lerp(yy,objPlayer.y,lerpC)
camera_set_view_size(view,view_width,view_height)
camera_set_view_pos(view,xx-view_width/2+shakex,yy-view_height/2+shakey);
dir*=-1;