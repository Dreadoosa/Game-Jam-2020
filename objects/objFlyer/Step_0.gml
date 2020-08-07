/// @description Insert description here
// You can write your code in this editor
if (point_distance(objPlayer.x,objPlayer.y,x,y) < 200) {
alert = true;
}
if(!alert){exit};
if (knockx == 0 && knocky == 0) {
x += lengthdir_x(1,dir)
y += lengthdir_y(1,dir)
}
if (invuln > 0) {
invuln--
}
knockx = scrApproachZero(knockx,.5)
knocky = scrApproachZero(knocky,.5)
if (!place_meeting(x+knockx,y,objWall)) {
	x += knockx;
} else {
	while (!place_meeting(x+sign(knockx),y,objWall)) {
	x += sign(knockx)
	}
}
if (!place_meeting(x,y+knocky,objWall)) {
	y += knocky;
} else {
	while (!place_meeting(x,y+sign(knocky),objWall)) {
	y += sign(knocky)
	}
}
if (hp <= 0) {
	instance_destroy();
	exit;
}
dir = lerp(dir,newDir,.1)
image_xscale = -sign(objPlayer.x-x);