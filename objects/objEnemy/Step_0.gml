/// @description Insert description here
// You can write your code in this editor
if (invuln != 0) {
	invuln --;
}
knockx = scrApproachZero(knockx,.1)
knocky = scrApproachZero(knocky,.1)
#region collisions and knockback
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
if (!place_meeting(x,y+grav,objWall)) {
	y += grav;
} else {
	while (!place_meeting(x,y+sign(grav),objWall)) {
	y += sign(grav)
	}
}
if (!place_meeting(x,y+1,objWall) && grav < 4) {
	grav += .1;
}
if (place_meeting(x,y+1,objWall)) {
	grav = 2;
}
if (hp < 0) {
	disabled = true;
}
	
#endregion
if (locked) {
	if (charged < cap && action_script_winding()) {
	charged++;
	}
	if (charged == cap && action_script_thrust()) {
	capGate++;
	charged = 0;
	}
	switch (capGate) {
		case 0:
		cap = gateOneCap
		break;

		case 1:
		cap = gateTwoCap
		break;
		
		case 2:
		cap = gateThreeCap
		break;
	}
	if (charged == gateThreeCap && action_script_thrust()) {
	instance_destroy();
	}
}