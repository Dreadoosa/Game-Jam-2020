/// @description Insert description here
// You can write your code in this editor
active = true;
if (!place_meeting(x,y+grav,objWall)) {
	y+=grav;
} else {
	while (!place_meeting(x,y+grav,objWall)) {
		y+=grav;
	}
}
if (grav < 4) {
	grav +=.25;
}


if(place_meeting(x,y+5,objWall)) {
	instance_destroy();
}

if (x > targetx-15 && x < targetx+15) {
} else {
	if (x < targetx) {
		x+= spd;
	} else {
		x-= spd;
	}
}




if (spd < 12) {
	spd+=2;
}