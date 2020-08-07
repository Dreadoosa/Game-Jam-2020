/// @description Insert description here
// You can write your code in this editor
if (!place_meeting(x,y+grav,objWall)) {
		y+=grav;
} else {
	while (!place_meeting(x,y+1,objWall)) {
		y++;
	}
}

if (!place_meeting(x+dir,y,objWall)) {
		x+=dir;
} else {
	while (!place_meeting(x+sign(dir),y,objWall)) {
		x+=sign(dir)
	}
}
if (grav < 7) {
	grav++;
}
timer--;
if (timer<=0){
instance_destroy();
}