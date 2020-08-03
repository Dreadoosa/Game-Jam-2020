/// @description Insert description here
// You can write your code in this editor
timer++;
if (tBuff > 0){tBuff--;}
if (aBuff > 0){aBuff--;}
if (enemyHeld != undefined) {
	sprite_set_bbox(sprPlayerBox,0,-30,32,43)
} else {
	sprite_set_bbox(sprPlayerBox,0,0,32,43)
}
if (!place_meeting(x+(knockx),y,objWall)) {
	x = round(x)
	x += knockx;
} else {
	while (!place_meeting(x+sign(knockx),y,objWall)) {
	x += sign(knockx);
	}
}
knockx = scrApproachZero(knockx,.5)
function walking() {
	timeInState++;
	if (enemyHeld == undefined && action_script_winding_p() && gearCharge != 3) {
		scrChangeStates(player_states.windingUp)
		exit;
	}
	if (action_script_attack() && enemyHeld == undefined && aBuff == 0) {
		scrChangeStates(player_states.attacking)
		exit;
	}
	if (!action_script_right() && !action_script_left()) {
		scrChangeStates(player_states.standing)
		exit;
	}
	if (spd > 1.5) {
	spd -= .1;
	}
	if (spd < 1.5) {spd = 1.5}
	/*if (action_script_attack() && enemyHeld == undefined) {
	state = player_states.attacking;
	exit;
	}*/
	if (action_script_attack() && enemyHeld != undefined) {
	scrChangeStates(player_states.chucking)
	}
	if (action_script_thrust() && enemyHeld == undefined) {
	scrChangeStates(player_states.thrusting)
	if (action_script_left()) {
		dashDirection = -1;
	}
	if (action_script_right()) {
		dashDirection = 1;
	}
	if (!action_script_right() && !action_script_left()) {
		dashDirection = image_xscale;
	}
	thrustDist = 5 * (gearCharge+1);
	gearCharge = 0;
	gearCharge = 0;
	}
	playerMove();
	if (!place_meeting(x,y+1,objWall)) {
	state = player_states.inair;
	jumpStore = 10;
	}
	if (action_script_jump()) {	
		if (enemyHeld != undefined) {
		jump = jspd * .7;
		} else {
		jump = jspd;
		}
		scrChangeStates(player_states.inair)
	}
	if (jumpCharge != 0) {
		jumpCharge = 0;
		if (enemyHeld != undefined) {
		jump = jspd * .7;
		} else {
		jump = jspd;
		}
		scrChangeStates(player_states.inair)
	}
	if (action_script_attack() && enemyHeld != undefined) {
		scrChangeStates(player_states.chucking)
	}	
}
function standing() {
	timeInState++;
	sprite_index = sprJunko;
	spd = 1.5;
	if (enemyHeld == undefined && action_script_winding_p() && gearCharge != 3) {
		scrChangeStates(player_states.windingUp)
		exit;
	}
	if (action_script_attack() && enemyHeld == undefined && aBuff == 0) {
	scrChangeStates(player_states.attacking)
	}
	if (action_script_attack() && enemyHeld != undefined) {
	scrChangeStates(player_states.chucking)
	}			
	if (action_script_thrust() && enemyHeld == undefined) {
	scrChangeStates(player_states.thrusting)
	if (action_script_left()) {
		dashDirection = -1;
	}
	if (action_script_right()) {
		dashDirection = 1;
	}
	if (!action_script_right() && !action_script_left()) {
		dashDirection = image_xscale;
	}
	thrustDist = 5 * (gearCharge+1);
	gearCharge = 0;
	}
	if (action_script_left() || action_script_right()) {
		scrChangeStates(player_states.walking)
	}
	if (action_script_jump()) {	
		if (enemyHeld != undefined) {
		jump = jspd * .7;
		} else {
		jump = jspd;
		}
		scrChangeStates(player_states.inair)
	}
	if (!place_meeting(x,y+1,objWall)) {
		jumpStore = 10;
		scrChangeStates(player_states.inair)
	}		
	if (jumpCharge != 0) {
		jumpCharge = 0;
		if (enemyHeld != undefined) {
		jump = jspd * .7;
		} else {
		jump = jspd;
		}
		scrChangeStates(player_states.inair)
	}
}
function playerMove() {
	timeInState++;
	if (action_script_right()) {
		sprite_index = sprJunkWalk
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
		sprite_index = sprJunkWalk
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
	timeInState++;
	if (spd != 5) {
	spd = 5;
	energyGauge -= 10;
	}
	
	if (dashDirection == 1) {
		if (!place_meeting(x+(spd),y,objWall)) {
			x = round(x)
			x += spd;
		} else {
			while (!place_meeting(x+sign(spd),y,objWall)) {
			x += sign(spd);
			}
		}	
	}
	
	if (dashDirection == -1) {
		if (!place_meeting(x-(spd),y,objWall)) {
			x = round(x)
			x -= spd;
		} else {
			while (!place_meeting(x-sign(spd),y,objWall)) {
			x -= sign(spd);
			}
		}	
	}
	
	if (dashDirection == 0) {
		if (!place_meeting(x,y+12,objWall)) {
			y+=12;
		} else {
			while (!place_meeting(x,y+sign(12),objWall)) {
			y++;
			}
			if (action_script_left() || action_script_right()) {
				scrChangeStates(player_states.walking);
			} else {
				scrChangeStates(player_states.standing);
			}
		}	
		if (place_meeting(x,y+8,objEnemy)) {
			jump = jspd;
			scrChangeStates(player_states.inair)
			if (!instance_exists(objHitbox)) {
				var hb = instance_create_layer(x+48*image_xscale,y,"Instances_1",objHitbox);
				hb.sprite_index = sprSlashDown
				hb.hitFrame = 5;
				hb.timer = 15;
				hb.force = 6;
				hb.dir = image_xscale;
				energyGauge -= 1;
			}				
		}
	}	
}	
function inAir() {
	timeInState++;
		if (action_script_thrust() && enemyHeld == undefined) {
		scrChangeStates(player_states.thrusting);
		if (action_script_left()) {
			dashDirection = -1;
		}
		if (action_script_right()) {
			dashDirection = 1;
		}
		if (action_script_down()) {
			dashDirection = 0;
		}
		if (!action_script_right() && !action_script_left() && !action_script_down()) {
			dashDirection = image_xscale;
		}
		thrustDist = 5 * (gearCharge+1);
		gearCharge = 0;
		}		
		if (action_script_attack() && enemyHeld != undefined) {
		scrChangeStates(player_states.chucking);
		}	
		if (action_script_attack() && enemyHeld == undefined && aBuff == 0) {
		aBuff = 30;
		scrChangeStates(player_states.attacking);
		}
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
		if (spd > 4) {
		spd -= .1;
		}
		if (spd < 4) {
			spd += .5;
		}
		if (jump > jspd/2) {
			if (spd < 6) {
				spd += .5;
			}		
			if (grav < 9) {
			grav += .1;
			}
		}
		
		
		if (grav < 7) {
		grav += .1;
		}
		if (place_meeting(x,y-1,objWall)) {jump = 0;grav = 7;}
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
			scrChangeStates(player_states.walking)
			} else {
			scrChangeStates(player_states.standing)
			}
			spd = 1.5;
			grav = 2;
		}
		if (jump < 0) {
		jump++
		}
		playerMove();
}
function attack() {
	timeInState++;
	switch (gearCharge) {
		case 0:
		sprite_index = sprJunkoSlash;
		if (!instance_exists(objHitbox)) {
			var hb = instance_create_layer(x+48*image_xscale,y,"Instances_1",objHitbox);
			hb.sprite_index = sprSlash
			hb.hitFrame = 5;
			hb.timer = 15;
			hb.force = 6;
			hb.dir = image_xscale;
			energyGauge -= 1;
		}
		break;
		default:
		sprite_index = sprJunkoSlash;
		if (!instance_exists(objHitbox)) {
			var hb = instance_create_layer(x+48*image_xscale,y,"Instances_1",objHitbox);
			hb.sprite_index = sprSlash
			hb.hitFrame = 5;
			hb.timer = 15;
			hb.force = 6;
			hb.dir = image_xscale;
			energyGauge -= 1;
		}	
		break;
	}
}
function thrusting() {
	timeInState++;
		if (thrustDist > 0){thrustDist--};
		if (thrustDist == 0) {
			if (!place_meeting(x,y+1,objWall)) { 
			scrChangeStates(state = player_states.inair)
			} else {
				if (action_script_left || action_script_right()) { 
				scrChangeStates(state = player_states.walking)
				} else {
				scrChangeStates(state = player_states.standing)
				}
			}
		}
		
		playerDash();
		var inst = instance_place(x,y,objDoor);
		if (inst != noone && !inst.starting) {
			inst.starting = true;
			scrChangeStates(player_states.locked);
			exit;
		}
		if (place_meeting(x,y,objPeg)) {
			if (!instance_exists(objHitbox)) {
				var hb = instance_create_layer(x+48*image_xscale,y,"Instances_1",objHitbox);
				hb.sprite_index = sprSlash
				hb.hitFrame = 5;
				hb.timer = 15;
				hb.force = 6;
				hb.dir = image_xscale;
				energyGauge -= 1;
			}			
		}
		
		var inst = instance_place(x,y,objEnemy);
		if (inst != noone && inst.disabled) {
			if (place_meeting(x,y,objEnemy)) {
				thrustDist = 0;
				spd = 1.5;
				var inst = instance_place(x,y,objEnemy);
				inst.x = x + 32*image_xscale;
				inst.y = y;
				inst.knockx = 0;
				inst.knocky = 0;
				inst.locked = true;
				inst.carried = false;
				scrChangeStates(player_states.locked)
				exit;
			}
		}
		playerDash();
		switch (charge) {
			case 0:

			break;
		}
}
function locking() {
	timeInState++;
	if (action_script_up())  {
		var en = undefined;
		with (objEnemy) {
			if (locked) {
			en = id;
			break;
			}
		}
		enemyHeld = en;
		enemyHeld.carried = true;
		enemyHeld.locked = false;
		scrChangeStates(state = player_states.standing)
	}
	if (enemyHeld != undefined) {
	enemyHeld.x = x;
	enemyHeld.y = y - 32;
	enemyHeld.knockx = 0;
	enemyHeld.knocky = 0;
	enemyHeld.carried =true;
	}
}
function chucking() {
	timeInState++;
	if (enemyHeld != undefined) {
		if (action_script_up()) {
			enemyHeld.y = y-32;
			enemyHeld.knocky = -10;		
			enemyHeld.locked = false;
			enemyHeld.carried = false;
			enemyHeld = undefined;
		} else if (action_script_down()) {
			enemyHeld.y = y+32;
			enemyHeld.knocky = 7;	
			enemyHeld.locked = false;
			enemyHeld.carried = false;
			enemyHeld = undefined;
			jump = -18;
		} else {
			enemyHeld.knockx = 7 * image_xscale;
			if (!place_meeting(x,y+1,objWall)) {
			knockx = 7 * -image_xscale;
			jump = -9
			} else {
			knockx = 4 * -image_xscale;
			}
			
			enemyHeld.knocky = -5;
			enemyHeld.locked = false;
			enemyHeld.carried = false;
			enemyHeld = undefined;
		}
		if (!place_meeting(x,y+1,objWall)) {
			scrChangeStates(player_states.inair)
		} else {
			if (action_script_left() || action_script_right()) {
			scrChangeStates(player_states.walking)
			} else {
			scrChangeStates(player_states.standing)
			}
		}
	}
}		
function windingUp() {
	timeInState++;
	if (action_script_left()) {
	image_xscale = -1;
	}
	if (action_script_right()) {
	image_xscale = 1;
	}
	if (action_script_winding()) {
		if (action_script_attack()) {
			gearOne += 5;
		}
		if (gearOne = 100) {
			gearCharge++;
			gearOne = 0;
			tBuff = 40;
			scrChangeStates(state = player_states.standing)
			exit;
		}
	} else {
		if (gearOne > 5) {
			gearOne--;
		} else {
		scrChangeStates(state = player_states.standing)
		exit;
		}
	}
}
function downed() {
	timeInState++;
	if (downGauge < 150 && (action_script_attack())) {
		downGauge += 10;
	}
	if (downGauge == 100) {
		energyGauge = 150;
		downGauge = 0;
		scrChangeStates(player_states.standing)
		exit;
	}
	if (!place_meeting(x,y+grav,objWall)) {
		y+=grav;
	} else {
		while (!place_meeting(x,y+sign(grav),objWall)) {
		y++;
		}
		spd = 1.5;
		grav = 4;
	}	
	
}
function swinging() {
	log(path_position)
	if (action_script_jump()) {	
		jump = jspd;
		path_end();
		scrChangeStates(player_states.inair)
	}	
	if (path_position >= .5) {
		jump = jspd;
		path_end();
		scrChangeStates(player_states.inair)	
	}
	
}
	
function hanging() {
	if (action_script_jump()) {
		jump = jspd;
		scrChangeStates(player_states.inair)
	}
	if (action_script_left() || action_script_right()) {
		scrChangeStates(player_states.inair);
	}
}
if (timer % 16 == 0) {
	if (energyGauge > 0) {
	energyGauge--
	} else {
	scrChangeStates(player_states.downed)
	exit;
	}
}
switch (state) {
	case player_states.walking:    walking();    break;
	case player_states.standing:   standing();   break;
	case player_states.inair:      inAir();      break;
	case player_states.attacking:  attack();     break;
	case player_states.thrusting:  thrusting();  break;
	case player_states.locked:     locking();    break;
	case player_states.swinging:   swinging();   break;
	case player_states.chucking:   chucking();   break;
	case player_states.windingUp:  windingUp();  break;
	case player_states.hanging:    hanging();    break;
	case player_states.downed:	   downed();     break;
}
objKey.x = x + 12* -image_xscale;
objKey.y = y;