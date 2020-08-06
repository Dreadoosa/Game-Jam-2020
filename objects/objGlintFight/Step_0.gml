/// @description Insert description here
// You can write your code in this editor
timer++;
if (state != glint_states.tTransition && state != glint_states.slash && state != glint_states.tTransition2) {
	if (objPlayer.x > x) {image_xscale = 1} else {
	image_xscale = -1;
	}
}
function glintStateChange (newState) {
	stateChange++;
	previousState = state;
	timeInState = 0;
	//shots = 0;
	hitGauge = 0;
	canSpawn = true;
	floatPoint = false;
	dashPointOne = false;
	state = newState;
	floatTimer = 0;
}
function hurt () {
	if (timeInState == 0) {
	sprite_index = sprGlintHurt;
	image_index = 0;
	}
	timeInState++;
	x += hDir*3;
	if (timeInState >= 60) {
		if (phase == 6) {
		instance_destroy(self);
		instance_create_layer(x,y,"Instances_1",objGlintDialogue)	
		exit;
	}
	glintStateChange(glint_states.floating)
	exit;
	}
}
function bombing() {
	if (timeInState == 0) {
		sprite_index = sprGlintBombSpawn;
		image_index = 0
	}
	image_speed = 1;
	if (canSpawn && timeInState == 60) {
		canSpawn = false;
		if (x < room_width/2) {
			var bomb = instance_create_layer(x+32,y,"Instances_1",objBomber)
			bomb.disabled = true;
			bomb.canExplode = true;	
		} else {
			var bomb = instance_create_layer(x-32,y,"Instances_1",objBomber)
			bomb.disabled = true;
			bomb.canExplode = true;		
		}
	}
	if (timeInState >= 380) {
		glintStateChange(glint_states.floating)
		instance_destroy(objBomber);
			if (objPlayer.state == player_states.thrusting || objPlayer.state == player_states.locked) {
				with(objPlayer) {
					if (enemyHeld != undefined) {
					scrChangeStates(player_states.standing);
					}
				}
			}
		with (objPlayer) {
			if (enemyHeld != undefined) {
			enemyHeld.locked = false;
			enemyHeld.carried = false;
			enemyHeld = undefined;
			}
		}
	}
	timeInState++
}
function dashing() {
	if(stateChange % 2 == 0) {
		if (!dashPointOne) {
			if (x < 600) {x+=4};
			if (y < 340) {y+=4};
			dashTimer = 30;
		} else {
			if (dashTimer > 0){dashTimer--} else {
				if (x > 30) {
					if (phase == 3) {
					x-=15
					}
					x-=15
				}
				if (y < 340) {
					if (phase == 3) {
					y+=10
					}
					y+=10
				};	
				sprite_index = sprGlintDash;
				image_xscale = -1;
				if(x <= 30 && y >= 340) {
					shootin = true;
					dashin = false;
					if (phase == 3) {
					glintStateChange(glint_states.floating)
					} else {
					glintStateChange(glint_states.floating)
					sprite_index = sprGlintDodge;
					}
				}
			}
		}
		if (x >= 600 && y >= 340) {
			dashPointOne = true;
		}
	} else {
		if (!dashPointOne) {
			if (x > 30) {
				if (phase == 3) {
				x-=4
				}
				x-=4
			};
			if (y < 340) {
				if (phase == 3) {
				y+=4;
				}
				y+=4;
			};
			dashTimer = 30;
		} else {
			if (dashTimer > 0){dashTimer--} else {
				if (x < 600) {x+=15}
				if (y < 340) {y+=10}
				sprite_index = sprGlintDash;
				image_xscale = -1;
				if(x >= 600 && y >= 340) {
					glintStateChange(glint_states.floating)
					sprite_index = sprGlintDodge;
				}
			}
		}
		if (x <= 30 && y >= 340) {
			dashPointOne = true;
		}	
	}
}
function floating() {
	
	if (previousState == glint_states.slash && phase == 5) {
		glintStateChange(glint_states.bombing)
		exit;
	}
	if (y > 200 && !floatPoint) {
		y -=2;
		if (x < room_width/2) {x+=5}
		if (x > room_width/2) {x-=5}
	} else {
		floatPoint = true;
		floatTimer++;
		y = (anchorY + sin(timer*freq)*amplitude);
		if (floatTimer > 30) {
			if (phase >= 4) {
				image_index = 0;
				glintStateChange(glint_states.stalkingFlare);
				exit;
			}
			if (bombin) {
				glintStateChange(glint_states.bombing);
				bombin = false;
				phase++;
				stateChange = 0;
				exit;
			}			
			if (stateChange < 6) {
				if (dashin) {
				dashin = false;
				glintStateChange(glint_states.dashing);
				exit;
				} else if (shootin) {
				shootin = false;
				glintStateChange(glint_states.skyshot);
				shots = 0;
				exit;
				}
			} else {
				if (phase == 3) {
					glintStateChange(glint_states.tTransition);
					stateChange = 0;
					exit;
				} else {
				glintStateChange(glint_states.bombing);
				stateChange = 0;
				exit;
				}
			}
		}
	}
	sprite_index = sprGlintFloat;
}
function skyshot() {
	timeInState++;
	if (phase == 3) {
		if (timeInState % 50 == 0) {
			sprite_index = sprGlintCapeShot;
			image_index = 0;
		}	
	} else {
		if (timeInState % 100 == 0) {
			sprite_index = sprGlintCapeShot;
			image_index = 0;
		}
	}
	if (sprite_index == sprGlintCapeShot && image_index >= 3 && image_index <= 5 && canShoot) {
		instance_create_layer(x,y,"Instances_1",objEnemyGlintProjectile);
		canShoot = false;
		shots++;
	}
	y = (anchorY + sin(timer*freq)*amplitude);
	if (x < objPlayer.x) {
		if (x < objPlayer.x-100) {
			x++;
		}
	} else {
		if (x > objPlayer.x+100) {
			x--;
		}	
	}
}
function disabled() {
	if (timeInState >= 150 && objPlayer.state != player_states.locked) {
		stateChange = 0;
		glintStateChange(glint_states.floating);
		sprite_index = sprGlintLaugh;
	}
	if (!place_meeting(x,y+8,objWall)) {
		y += 8;
		if (x > room_width/2) {
			x -=5;
		} else {
			x +=5;
		}
	} else {
		while (!place_meeting(x,y+1,objWall)) {
		y++;
		}
	}
	if (objPlayer.state == player_states.locked) {
		if (caught) {
			if (action_script_attack() && action_script_winding()) {
				hitGauge++;
			}
		}
		if (hitGauge == 7) {
			if (objPlayer.x > x) {
			hDir = -1;
			} else {
			hDir = 1
			}
			sprite_index = sprGlintHurt;
			with (objPlayer) {
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
			phase++;
			glintStateChange(glint_states.hurt);
			
		}
	}
}
function slash() {
	//image_speed = 2;
	if (timeInState == 0) {
		if (image_xscale == 1) {
		image_xscale = -1;
		} else {
		image_xscale = 1;
		}
	}
	if (image_index > 37 && image_index < 40 && canAttack) {
		canAttack = false;
		instance_create_layer(x,y,"Instances_1",objEnemyHitBox);
	}
	
	y = (anchorY + sin(timer*freq)*amplitude);
	if (image_xscale < 1) {
		image_xscale += .25;
	}
	if (timeInState == 0) {
		sprite_index = sprGlintSwipe;
		image_index = 0;
	}
	timeInState++;
}
function tTransition2() {
	timeInState++;
	if (image_xscale > 0) {
	image_xscale -= .1
	} else {
		image_xscale += .1
	}
	if (image_xscale == 0) {
		glintStateChange(glint_states.ultrashot)
		exit;
	}
	image_speed = 1;
}
function tTransition() {
	timeInState++;
	if (image_xscale > 0) {
	image_xscale -= .1
	} else {
		image_xscale += .1
	}
	if (image_xscale == 0) {
		glintStateChange(glint_states.slash)
		x = objPlayer.x;
		y = objPlayer.y
		exit;
	}
}
function stalkingFlare() {
	timeInState++;
	if (timeInState < 180) {
		move_towards_point(objPlayer.x,objPlayer.y+32,2);
		sprite_index = sprGlintSpin;	
		image_speed = 3;
	} else {
		speed = 0;
		glintStateChange(glint_states.tTransition2);
		/*
		if (timeInState < 182) {
			if (x > room_width/2) {
			sfDir = 1;
			} else {
			sfDir = -1;
			}
			aPoint = objPlayer.y
			image_speed = 4;
		}
		if (x <= 30) {
		sfDir = 1;
		} else if (x >= 600){
		sfDir = -1;
		}
		y = (aPoint + (sin(timer*freq)*80))
		x += sfDir * 3;*/
	}
}	
function ultrashot() {
	if (timeInState == 0) {
		image_speed = 0;
		image_index = 0;
		sprite_index = sprGlintCapeShot;
	}
	if (timeInState >= 90) {
		image_speed = 1;
	}
	if (sprite_index == sprGlintCapeShot && image_index >= 3 && image_index <= 5 && canShoot) {
		instance_create_layer(objPlayer.x-150,y-150,"Instances_1",objEnemyGlintProjectile);
		instance_create_layer(objPlayer.x+150,y+150,"Instances_1",objEnemyGlintProjectile);
		instance_create_layer(objPlayer.x-150,y+150,"Instances_1",objEnemyGlintProjectile);
		instance_create_layer(objPlayer.x+150,y-150,"Instances_1",objEnemyGlintProjectile);
		canShoot = false;
	}
	
	timeInState++;
}
switch (state) {
	case glint_states.floating:      floating();    break;
	case glint_states.dashing:	     dashing();     break;
	case glint_states.disabled:		 disabled();    break;
	case glint_states.slash:		 slash();	    break;
	case glint_states.stalkingFlare: stalkingFlare()break;
	case glint_states.ultrashot:     ultrashot()    break;
	case glint_states.bombing:		 bombing();     break;
	case glint_states.hurt:			 hurt();        break;
	case glint_states.tTransition:   tTransition(); break;
	case glint_states.tTransition2:  tTransition2(); break;
	case glint_states.skyshot:		 skyshot();     break;
}