/// @description Insert description here
// You can write your code in this editor
function walking() {
	playerMove();
	if (!place_meeting(x,y+1,objWall)) {
	state = player_states.inair;
	jumpStore = 10;
	}
	if (action_script_jump()) {	
		jump = jspd;
		state = player_states.inair
		exit;
	}
	if (jumpCharge != 0) {
		jumpCharge = 0;
		jump = jspd;
		state = player_states.inair;
		exit;
	}
}
function standing() {
	if (action_script_left() || action_script_right()) {
		state = player_states.walking
		exit;
	}
	if (action_script_jump()) {	
		jump = jspd;
		state = player_states.inair
		exit;
	}
	if (!place_meeting(x,y+1,objWall)) {
		state = player_states.inair;
		jumpStore = 10;
		exit;
	}		
	if (jumpCharge != 0) {
		jumpCharge = 0;
		jump = jspd;
		state = player_states.inair;
		exit;
	}
}
function playerMove() {
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
}
function inAir() {
		if (jumpStore > 0) {
		jumpStore--;
		}
		if (jumpCharge > 0) {
		jumpCharge--;
		}
		if (action_script_jump()) {
		jumpCharge = 4;
		}
		if (jumpStore > 0 && action_script_jump()) {
		jump = jspd;
		}
		if (jump > -8) {
		spd = 2;
		}
		spd = 3;
		if (grav < 7) {
		grav += .1;
		}
		if (!place_meeting(x,y+jump,objWall)) {
			y+=jump;
		} else {
			while (!place_meeting(x,y+sign(jump),objWall)) {
			y--;
			}
		}	
		if (!place_meeting(x,y+grav,objWall)) {
			y+=grav;
		} else {
			while (!place_meeting(x,y+sign(grav),objWall)) {
			y++;
			}
			if (action_script_left() || action_script_right()) {
				state = player_states.walking
			} else {
			state = player_states.standing
			}
			spd = 1.5;
			grav = 2;
			exit;
		}
		if (jump < 0) {
		jump++
		}
		playerMove();
}
switch (state) {
	case player_states.walking:  walking();  break;
	case player_states.standing: standing(); break;
	case player_states.inair:    inAir();    break;
}