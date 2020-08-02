/// @description Insert description here
// You can write your code in this editor
if (!place_meeting(x,y+grav,objWall)) {
	y+=grav;
} else {
	while (!place_meeting(x,y+sign(grav),objWall)) {
	y++;
	}
}

if (action_script_right()) {
	if (!place_meeting(x+(spd),y,objWall)) {
		x += spd;
	} else {
		while (!place_meeting(x+sign(spd),y,objWall)) {
		x += sign(spd);
		}
	}	
}
if (action_script_left()) {
	if (!place_meeting(x-(spd),y,objWall)) {
		x -= spd;
	} else {
		while (!place_meeting(x-sign(spd),y,objWall)) {
		x -= sign(spd);
		}
	}	
}
	
	