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
xx = clamp(xx,0,room_width)
yy = lerp(yy,objPlayer.y,lerpC)
yy = clamp(yy,0,room_height)
camera_set_view_size(view,view_width,view_height)
camera_set_view_pos(view,clamp(xx-view_width/2+shakex,0,room_width),clamp(yy-view_height/2+shakey,0,room_height))
dir*=-1;