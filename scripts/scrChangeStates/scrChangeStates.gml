// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrChangeStates(newState) {
	knockTime = 0;
	if (newState == player_states.hanging) {
		image_index = 0;
	}
	if (newState == player_states.downing){
		sprite_index = sprJunkoNoPower;
		image_index = sprite_get_number(sprJunkoNoPower)-1;
		//image_speed = .1;
	}
	with (objPlayer) {
	if (newState == player_states.swinging) {
		sprite_index = sprJunkoSwing;
	}
	if (state == player_states.thrusting && newState == player_states.walking) {
		//var list = undefined;
		//log(list[|0]);
	}
	if (newState == player_states.downed) {
	sprite_index = sprJunkoNoPower;
	//image_speed = 0;
	image_index = 0;
	}
		if (newState == player_states.attacking) {
			image_speed = 2;
			attacks++;
			image_index = 0;
			knockx = image_xscale*4;
		} else {
		image_speed = 1;
		}
		var thisEn = undefined
		with (objEnemy) {
			if (locked) {
			thisEn = id;
			}
		}
		if (newState == player_states.thrusting) {
			thrusts--;
		}
		if (state == player_states.locked && thisEn != undefined) {
			thisEn.y -= 32;
			thisEn.knocky = -4;
			thisEn.knockx = -image_xscale*6;
		}

		if (newState == player_states.inair && jump != 0) {
			audio_sound(sfx_jump)
			image_index = 0;
		}
		if (newState == player_states.windingUp) {
			switch (gearCharge) {
				case 0:
				sprite_index = sprJunkoChargeOne
				if (!audio_is_playing(sfx_charge1)) {
					audio_play_sound_on(global.emitter,sfx_charge1,1,1);
				}
				break;
				
				case 1:
				sprite_index = sprJunkoChargeTwo
				if (!audio_is_playing(sfx_charge2)) {
					audio_play_sound_on(global.emitter,sfx_charge2,1,1);
				}				
				break;				
				
				case 2:
				sprite_index = sprJunkoChargeThree
				if (!audio_is_playing(sfx_charge3)) {
					audio_play_sound_on(global.emitter,sfx_charge3,1,1);
				}
				break;				
			}
		}	
		timeInState = 0;
		previousState = state;
		state = newState
		if (newState == player_states.swinging) {
		audio_sound(sfx_swinglock);			
		}
		if (newState == player_states.hanging) {
		audio_sound(sfx_swinglock);			
		}		
		if (newState == player_states.attacking) {
		audio_sound_alt(sfx_attackswing);
		}
	}
}