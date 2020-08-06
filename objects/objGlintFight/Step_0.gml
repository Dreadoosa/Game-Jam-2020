/// @description Insert description here
// You can write your code in this editor
timer++;
if (objPlayer.x > x) {image_xscale = 1} else{ image_xscale = -1;}

function glintStateChange (newState) {
	previousState = state;
	timeInState = 0;
	shots = 0;
	hitGauge = 0;
	canSpawn = true;
	floatPoint = false;
	dashPointOne = false;
	state = newState;
	floatTimer = 0;
}
	
	
function bombing(){
	if (timeInState == 0) {
		sprite_index = sprGlintBombSpawn;
		image_index = 0
	}
	image_speed = 1;
	if (canSpawn) {
	canSpawn = false;
	var bomb = instance_create_layer(x,y,"Instances_1",objBomber)
	bomb.disabled = true;
	bomb.canExplode = true;
	}
	if (timeInState >= 240) {
	glintStateChange(glint_states.floating)
	}
	timeInState++
}
function dashing() {
	if (!dashPointOne) {
		if (x < 600) {x+=4};
		if (y < 340) {y+=4};
		dashTimer = 30;
	} else {
		if (dashTimer > 0){dashTimer--} else {
			if (x > 30) {
			x-=15
			};
			if (y < 340) {
			y+=10
			};	
			sprite_index = sprGlintDash;
			image_xscale = -1;
			if(x <= 30 && y >= 340) {
			glintStateChange(glint_states.floating)
			}
		}
	}
	if (x >= 600 && y >= 340) {
		dashPointOne = true;
		
	}
}
function floating() {
	if (y > 200 && !floatPoint) {
		y -=2;
	} else {
		floatPoint = true;
		floatTimer++;
		y = (anchorY + sin(timer*freq)*amplitude);
		if (floatTimer > 30) {
		glintStateChange(glint_states.bombing);
		}
	}
	sprite_index = sprGlintFloat;
}
function skyshot() {
	timeInState++;
	if (timeInState % 100 == 0) {
		sprite_index = sprGlintCapeShot;
		image_index = 0;
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
	if (timeInState % 60 == 0) {
		//instance_create_layer(x,y,"Instances_1",objEnemyGlintProjectile);
	}

}
function disabled() {
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
				if (hitGauge > 7) {
					hhpp -= 1;
					hhpp =  0;
					glintStateChange(glint_states.floating)
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
				}
			}
		}
	}
}
switch (state) {
	case glint_states.floating: floating(); break;
	case glint_states.dashing: dashing(); break;
	case glint_states.disabled: disabled(); break;
	case glint_states.bombing: bombing(); break;
	case glint_states.skyshot: skyshot(); break;
}
