/// @description Insert description here
// You can write your code in this editor
function walking() {
	if (action_script_attack()) {
	state = player_states.attacking;
	exit;
	}
	if (action_script_thrust()) {
	state = player_states.thrusting;
	thrustDist = 10;
	exit;
	}
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
	if (action_script_attack()) {
	state = player_states.attacking;
	exit;
	}
	if (action_script_thrust()) {
	state = player_states.thrusting;
	thrustDist = 10;
	exit;
	}
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
		image_xscale = 1;
		objKey.image_xscale = 1;
		if (!place_meeting(x+(spd),y,objWall)) {
			x = round(x)
			x += spd;
		} else {
			while (!place_meeting(x+sign(spd),y,objWall)) {
			x += sign(spd);
			}
		}	
	}
	if (action_script_left()) {
		image_xscale = -1;
		objKey.image_xscale = -1;
		if (!place_meeting(x-(spd),y,objWall)) {
			x = round(x)
			x -= spd;
		} else {
			while (!place_meeting(x-sign(spd),y,objWall)) {
			x -= sign(spd);
			}
		}	
	}
}
function playerDash() {
	spd = 4;
	if (image_xscale == 1) {
		if (!place_meeting(x+(spd),y,objWall)) {
			x = round(x)
			x += spd;
		} else {
			while (!place_meeting(x+sign(spd),y,objWall)) {
			x += sign(spd);
			}
		}	
	}
	if (image_xscale == -1) {
		if (!place_meeting(x-(spd),y,objWall)) {
			x = round(x)
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
		if (spd < 4) {
			spd += .5;
		}	
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
function attack() {
	playerMove();
	switch (charge) {
		case 0:
			var hb = instance_create_layer(x+32*image_xscale,y,"Instances_1",objHitbox);
			hb.sprite_index = sprSlash
			hb.hitFrame = 4;
			hb.force = 6;
			hb.image_speed = 2;
			hb.dir = image_xscale;
			if (action_script_left() || action_script_right()) {
				state = player_states.walking
			} else {
			state = player_states.standing
			}
			exit;	
		break;
	}
}
function thrusting() {
	if (thrustDist > 0){thrustDist--};
	if (thrustDist == 0){
	state = player_states.walking;
	}
	playerDash();
	if (place_meeting(x,y,objEnemy)) {
		state = player_states.locked
		var inst = instance_place(x,y,objEnemy);
		inst.x = x + 32*image_xscale;
		inst.y = y;
		inst.locked = true;
	}
	playerDash();
	switch (charge) {
		case 0:

		break;
	}
}
function locking() {

}




switch (state) {
	case player_states.walking:    walking();    break;
	case player_states.standing:   standing();   break;
	case player_states.inair:      inAir();      break;
	case player_states.attacking:  attack();     break;
	case player_states.thrusting:  thrusting();  break;
	case player_states.locked:     locking();    break;
}
objKey.x = x + 12* -image_xscale;
objKey.y = y;