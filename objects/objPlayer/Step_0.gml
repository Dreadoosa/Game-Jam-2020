/// @description Insert description here
// You can write your code in this editor
timer++;
// STEP EVENT OF THE PLAYER OR SOME CONTROLLER OBJECT
if (tBuff > 0){tBuff--;}
if (aBuff > 0){aBuff--;}
if (instance_exists(objGUI) && !ds_list_empty(objGUI.sentences)) {
	exit;
}
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
if (objCamera.actor != id) {
objCamera.actor = id
};
knockx = scrApproachZero(knockx,.5)
objGUI.keyInc = 0;
image_angle = 0;
function ladder() {
	image_speed = 1;
	sprite_index = sprJunkoClimb
	canGrab = false;
	timeInState++;
	if (place_meeting(x,y,objLadder)) {
		if (action_script_up()) {
			y -= 3;
		}
		if (action_script_down()) {
			if (place_meeting(x,y+1,objWall)) {
				scrChangeStates(player_states.standing)
				exit;
			}
			if (!place_meeting(x,y+3,objWall)) {
			y += 3;
			} else {
				while (!place_meeting(x,y+1,objWall)) {
				y++;
				}
			}
			
		}
	} else {
		scrChangeStates(player_states.standing);
		exit;
	}
	if ((action_script_left() || action_script_right()) && timeInState > 45) {
		if (!place_meeting(x,y+6,objWall)){y+=6}
		scrChangeStates(player_states.inair)
		jump = 0;
		grav = 4;
		exit;
	}
}
function walking() {
	canGrab = true;
	if (canShake) {
		while (timeInState < 8) {
		sprite_index = sprJunko;
		timeInState++;
		cam_shake(5);
		exit
		};
		canShake = false;
	}
	grav = 2;
	thrusts = 1;
	timeInState++;
	if(place_meeting(x,y+1,objWall)) {
	//audio_sound(sfx_walk1);
	}
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
		spd -= .25;
	}
	/*if (action_script_attack() && enemyHeld == undefined) {
	state = player_states.attacking;
	exit;
	}*/
	if (action_script_attack() && enemyHeld != undefined) {
	scrChangeStates(player_states.chucking)
	}
	if (action_script_thrust() && enemyHeld == undefined) {
	if (action_script_left()) {
		dashDirection = -1;
	}
	if (action_script_right()) {
		dashDirection = 1;
	}
	if (!action_script_right() && !action_script_left()) {
		dashDirection = image_xscale;
	}
	thrustDist = 10 * (gearCharge+1);
	//gearCharge = 0;
	scrChangeStates(player_states.thrusting)
	audio_sound_alt(sfx_thrust)
	exit;
	}
	playerMove();
	if (!place_meeting(x,y+1,objWall)) {
		scrChangeStates(player_states.inair)
		jumpStore = 10;
		exit;
	}
	if (action_script_jump()) {	
		if (enemyHeld != undefined) {
		jump = jspd * .8;
		} else {
		jump = jspd;
		}
		hitSpark(x,y+16,spark_jumpdust,1);
		scrChangeStates(player_states.inair)
		exit;
	}
	if (jumpCharge != 0) {
		jumpCharge = 0;
		if (enemyHeld != undefined) {
		jump = jspd * .8;
		} else {
		jump = jspd;
		}
		scrChangeStates(player_states.inair)
		exit;
	}
	if (action_script_attack() && enemyHeld != undefined) {
		scrChangeStates(player_states.chucking)
		exit;
	}	
}
function standing() {
	canGrab = true;
	if (canShake) {
		while (timeInState < 8) {
		sprite_index = sprJunko;
		timeInState++;
		cam_shake(5);
		exit
		};
		canShake = false;
	}
	timeInState++;
	grav = 2
	thrusts = 1;
	sprite_index = sprJunko;
	spd = 1.5;
	if (enemyHeld == undefined && action_script_winding_p() && gearCharge != 3) {
		scrChangeStates(player_states.windingUp)
		exit;
	}
	if (action_script_attack() && enemyHeld == undefined && aBuff == 0) {
		scrChangeStates(player_states.attacking)
		exit;
	}
	if (action_script_attack() && enemyHeld != undefined) {
		scrChangeStates(player_states.chucking)
		exit;
	}			
	if (action_script_thrust() && enemyHeld == undefined) {
		scrChangeStates(player_states.thrusting)
		audio_sound_alt(sfx_thrust)
		if (action_script_left()) {
			dashDirection = -1;
		}
		if (action_script_right()) {
			dashDirection = 1;
		}
		if (!action_script_right() && !action_script_left()) {
			dashDirection = image_xscale;
		}
		thrustDist = 10 * (gearCharge+1);

		exit;
	}
	if (action_script_left() || action_script_right()) {
		scrChangeStates(player_states.walking)
	}
	if (action_script_jump() && place_meeting(x,y+1,objWall)) {	
		if (enemyHeld != undefined) {
		jump = jspd * .8;
		} else {
		jump = jspd;
		}
		hitSpark(x,y+16,spark_jumpdust,1);
		scrChangeStates(player_states.inair)
	}
	if (!place_meeting(x,y+1,objWall)) {
		jumpStore = 10;
		scrChangeStates(player_states.inair)
	}		
	if (jumpCharge != 0  && place_meeting(x,y+1,objWall)) {
		jumpCharge = 0;
		if (enemyHeld != undefined) {
		jump = jspd * .8;
		} else {
		jump = jspd;
		}
		hitSpark(x,y+16,spark_jumpdust,1);
		scrChangeStates(player_states.inair)
	}
}
function playerMove() {
	timeInState++;
	if (action_script_right()) {
		if (enemyHeld != undefined) {
		sprite_index = sprJunkoWalkGrabbing;
		} else {
		sprite_index = sprJunkWalk
		}
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
		if (enemyHeld != undefined) {
		sprite_index = sprJunkoWalkGrabbing;
		} else {
		sprite_index = sprJunkWalk
		}
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
	image_speed = 1;
		switch (gearCharge) {
		case 0:
		if (sprite_index != sprJunkoThrustLevelThree) {
		sprite_index = sprJunkoThrust
		}
		break;
		
		default:
		sprite_index = sprJunkoThrustLevelThree
		break;
		}	
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
			while(!place_meeting(x,y+1,objWall)) {
			y++;
			}
			if (place_meeting(x,y+1,objWall)) {
				if (action_script_left() || action_script_right()) {
					scrChangeStates(player_states.walking);
					y-=6;
					exit;
				} else {
					scrChangeStates(player_states.standing);
					y-=6;
					exit;
				}
			} else {
				scrChangeStates(player_states.inair);
				exit;
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
		image_angle = 270;
		if (gearCharge >= 2) {
		canShake = true;
		}
	}	
}	
function inAir() {
	if(timeInState == 0) {canGrab = true;};
	timeInState++;
	if (previousState == player_states.hanging && timeInState < 7) {
	exit;
	}
	if (previousState == player_states.swinging && timeInState < 2) {
	jump-=2;
	exit;
	}		
	if (previousState != player_states.chucking && jump < 0 && !action_script_jump_alt()) {
		jump+=.75;
	}
	if (spd < 5) {spd += .25;}
	if (jspd == 0 && spd < 5) {
	spd += .1;
	}
		if (action_script_thrust() && enemyHeld == undefined && thrusts > 0) {
		scrChangeStates(player_states.thrusting);
		audio_sound_alt(sfx_thrust)
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
			thrustDist = 10 * (gearCharge+1);
			switch (gearCharge) {
				case 0:
				if (sprite_index != sprJunkoThrustLevelThree) {
					if (enemyHeld != undefined) {
						
					} else {
					
					}
					sprite_index = sprJunkoThrust
				}
				break;
		
				default:
				sprite_index = sprJunkoThrustLevelThree
				break;
			}
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

		if (grav < 18) {
		grav += .2;
		}
		if (place_meeting(x,y-1,objWall)) {jump = 0;grav = 12;}
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
			if (!place_meeting(x,y+1,objWall)) {
				scrChangeStates(player_states.inair)
			} else {
				if (action_script_left() || action_script_right()) {
				scrChangeStates(player_states.walking)
				hitSpark(x,y+16,spark_jumpdust,1);
				exit;
				} else {
				scrChangeStates(player_states.standing)
				hitSpark(x,y+16,spark_jumpdust,1);
				exit;
				}
			}
		}
		playerMove();
		if (jump < 0) {
			if (enemyHeld == undefined) {
			sprite_index = sprJunkoRise;
			} else {
			sprite_index = sprJunkoRiseGrabbing
			}
		image_speed = 2.3;
		jump++
		} else {
			if (enemyHeld == undefined) {
			sprite_index = sprJunkoFall;
			} else {
			sprite_index = sprJunkoFallGrabbing
			}
		}
}
function attack() {
	timeInState++;
	jump = 0;
	switch (gearCharge) {
		case 0:
		if (attacks % 2 == 0) {
		sprite_index = sprJunkoSlash;
		} else {
		sprite_index = sprJunkoSlash2;
		}
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
	if (gearCharge == 3) {
		if (timeInState < 16 && timeInState > 1) {
		sprite_index = sprJunkoChargeThree;;
		image_speed = 2;
		cam_shake(3);
		exit;
		}	
	} else {
		if (timeInState < 8 && timeInState > 1) {
			if (enemyHeld == undefined) {
			sprite_index = sprJunkoRise;
			} else {
			sprite_index = sprJunkoRiseGrabbing
			}
		image_speed = 0;
		image_index = 0;
		exit;
		}
	}
	jump = 0;
	grav = 2;
		if (thrustDist > 0){thrustDist--};
		if (thrustDist == 0) {
			gearCharge = 0;
			if (!place_meeting(x,y+1,objWall)) { 
			scrChangeStates(player_states.inair)
			exit;
			} else {
				if (action_script_left || action_script_right()) { 
					scrChangeStates(player_states.walking)
					exit;
				} else {
				scrChangeStates(player_states.standing)
				exit;
				}
			}
		}
		playerDash();
		var inst = instance_place(x,y,objDoor);
		if (inst != noone && !inst.starting) {
		audio_sound(sfx_thrust_hit)
			inst.starting = true;
			scrChangeStates(player_states.locked);
			exit;
		}
		if (place_meeting(x,y,objPeg)) {
		audio_sound(sfx_thrust_hit)
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
		audio_sound(sfx_thrust_hit)
			if (place_meeting(x,y,objEnemy)) {
				thrustDist = 0;
				spd = 1.5;
				var inst = instance_place(x,y,objEnemy);
				inst.x = x + 32*image_xscale;
				inst.y = y;
				with(inst){hitSpark(x,y,spark_thrust,1)}
				inst.knockx = 0;
				inst.knocky = 0;
				inst.locked = true;
				inst.carried = false;
				scrChangeStates(player_states.locked)
				exit;
			}
		}
		var inst = instance_place(x,y,objGlintFight)
		if (inst != noone && inst.state == glint_states.disabled) {
		audio_sound(sfx_thrust_hit)
			if (place_meeting(x,y,objGlintFight)) {
				thrustDist = 0;
				spd = 1.5;
				var inst = instance_place(x,y,objGlintFight);
				with(inst){hitSpark(x,y,spark_thrust,1)}
				inst.x = x + 32*image_xscale;
				inst.y = y;
				inst.caught = true;
				scrChangeStates(player_states.locked)
				exit;
			}
		}			
		playerDash();
}
function locking() {
	timeInState++;
	if (action_script_winding()) {
		with(objPlayer) {
			if (!place_meeting(x,y + 1,objWall)) {
				sprite_index = sprJunkoChargingAir
			} else {
				sprite_index = sprJunkoChargingFloor
			}
		}
	}
	if (action_script_attack()) {
		var isEn = false;
		with(objEnemy) {
			if (locked) {
			isEn = true;
			}
		}
		if (isEn) {
			//hitSpark(x,y+8,spark_overcharge_busy,1);
		}
	}
	
	
	if (action_script_up() && !place_meeting(x,y,objDoor) && !place_meeting(x,y,objGlintFight))  {
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
		scrChangeStates(player_states.standing)
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
	if (timeInState < 10) {
	exit;
	}
	if (enemyHeld != undefined) {
		if (action_script_up()) {
			grav = 10;
			enemyHeld.y = y-16;
			enemyHeld.grav = -8;		
			enemyHeld.locked = false;
			enemyHeld.carried = false;
			enemyHeld = undefined;
		} else if (action_script_down()) {
			//enemyHeld.y = y+32;
			enemyHeld.knocky = 7;	
			enemyHeld.locked = false;
			enemyHeld.carried = false;
			enemyHeld = undefined;
			jump = -18;
		} else if (action_script_left() || action_script_right()) {
			enemyHeld.knockx = 9 * image_xscale;
			//enemyHeld.grav = 0;
			enemyHeld.gravTime = 20;
			if (!place_meeting(x,y+1,objWall)) {
			knockx = 10 * -image_xscale;
			jump = -9
			} else {
			knockx = 4 * -image_xscale;
			}
			enemyHeld.locked = false;
			enemyHeld.carried = false;
			enemyHeld = undefined;			
		} else {
			enemyHeld.knockx = 7 * image_xscale;
			if (!place_meeting(x,y+1,objWall)) {
			knockx = 7 * -image_xscale;
			enemyHeld.grav = -2;
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
	objGUI.keyInc = 1;
	if (action_script_left()) {
	image_xscale = -1;
	}
	if (action_script_right()) {
	image_xscale = 1;
	}
	if (action_script_winding()) {
		cam_shake(gearCharge/2);
		if (action_script_attack()) {
			gearOne += 10;
			audio_sound_alt(sfx_windup);
		}
		if (gearOne >= 100) {
			if (audio_is_playing(sfx_charge1)) {audio_stop_sound(sfx_charge1)}
			if (audio_is_playing(sfx_charge2)) {audio_stop_sound(sfx_charge2)}
			if (audio_is_playing(sfx_charge3)) {audio_stop_sound(sfx_charge3)}
			gearCharge++;
			gearOne = 0;
			tBuff = 40;
			scrChangeStates(player_states.standing)
			audio_sound(sfx_energyrecharge);
			exit;
		}
	} else {
		if (audio_is_playing(sfx_charge1)) {audio_stop_sound(sfx_charge1)}
		if (audio_is_playing(sfx_charge2)) {audio_stop_sound(sfx_charge2)}
		if (audio_is_playing(sfx_charge3)) {audio_stop_sound(sfx_charge3)}
		if (gearOne > 5) {
			gearOne--;
		} else {
		scrChangeStates(player_states.standing)
		exit;
		}
	}
}
function downed() {
	connect_gpad();
	if (audio_is_playing(sfx_charge1)) {audio_stop_sound(sfx_charge1)}
	if (audio_is_playing(sfx_charge2)) {audio_stop_sound(sfx_charge2)}
	if (audio_is_playing(sfx_charge3)) {audio_stop_sound(sfx_charge3)}
	grav = 12;
	if (path_index != -1) {
		path_end();
	}
	if (downGauge < 15 && (action_script_attack())) {
		downGauge += 1;
		audio_sound_alt(sfx_windup);
	}
	if (downGauge >= 15) {
		energyGauge = 150;
		downGauge = 0;
		scrChangeStates(player_states.standing)
		audio_sound(sfx_energyrecharge);
		exit;
	}
	if (!place_meeting(x,y+grav,objWall)) {
		y+=grav;
	} else {
		while (!place_meeting(x,y+sign(grav),objWall)) {
		y+=sign(grav);
		}
	}
	image_speed = 0;
	var increment = image_number/(15)
	image_index = floor(increment*downGauge);
	log("speed" + string(image_speed));
	log("frame" + string(floor(increment*downGauge)));
	timeInState++;
}
function swinging() {
	if (action_script_jump()) {	
		jump = jspd;
		path_end();
		curPeg = undefined;
		scrChangeStates(player_states.inair)
	}	
	if (path_position >= .5) {
		jump = jspd;
		path_end();
		curPeg = undefined;
		scrChangeStates(player_states.inair)	
	}
	
}
function hanging() {
	sprite_index = sprJunkoHang;
	if (action_script_jump()) {
		jump = jspd;
		grav = 2;
		scrChangeStates(player_states.inair)
	}
	if (action_script_left_p() || action_script_right_p() && timeInState > 5) {
		scrChangeStates(player_states.inair);
	}
}
function knockBack() {
	sprite_index = sprJunkoHurt;
	if (knockTime < 15) {
		repeat(6) {
			if (!place_meeting(x-image_xscale,y,objWall)) {
				x-=(image_xscale)
			}
		}
		timeInState++;
	} else {
		scrChangeStates(player_states.standing);
		exit;
	}
	knockTime++;
}
function dead(){
	x = objSpawn.x
	y = objSpawn.y
	scrChangeStates(player_states.standing)
	hitPoints = 4;
	exit;
}
function downing() {
	
}

if (timer % 16 == 0 && state != player_states.windingUp && state != player_states.thrusting && state != player_states.locked) {
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
	case player_states.downing:    downing();    break;
	case player_states.inair:      inAir();      break;
	case player_states.attacking:  attack();     break;
	case player_states.thrusting:  thrusting();  break;
	case player_states.locked:     locking();    break;
	case player_states.ladder:     ladder();    break;
	case player_states.swinging:   swinging();   break;
	case player_states.chucking:   chucking();   break;
	case player_states.knockBack:  knockBack();  break;
	case player_states.windingUp:  windingUp();  break;
	case player_states.hanging:    hanging();    break;
	case player_states.dead:       dead();       break;
}
if (hitPoints <= 0) {
	scrChangeStates(player_states.dead);
	exit;
}
if (state == player_states.windingUp) {
	objKey.x = x + 5;
	objKey.y = y - 20;
	objKey.image_angle = 270;
	objKey.image_xscale = 1;
} else {
	objKey.x = x + 12* -image_xscale;
	objKey.y = y
	objKey.image_angle = 0;
}
