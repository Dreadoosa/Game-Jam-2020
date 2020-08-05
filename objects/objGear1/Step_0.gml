/// @description Insert description here
// You can write your code in this editor
timer--;
if (timer == 0) {instance_destroy()};
if (grav < 5) {grav+=.25};
if (!place_meeting(x,y+grav,objWall)) {
	y += grav;
} else {
	while (!place_meeting(x,y + sign(grav),objWall)) {
		y++;
	}
}
if (!place_meeting(x-dir,y,objWall)) {
	x-=dir;
} else {
	while (!place_meeting(x-sign(dir),y,objWall)) {
		x-=sign(dir)
	}
}
dir = scrApproachZero(dir,.2)