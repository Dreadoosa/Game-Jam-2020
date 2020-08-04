// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrChangeStates(newState) {	
	with (objPlayer) {
	if (state == player_states.thrusting && newState == player_states.walking) {
		//var list = undefined;
		//log(list[|0]);
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
		}
		timeInState = 0;
		previousState = state;
		state = newState
		if (newState == player_states.attacking) {
		audio_sound(sfx_attackswing);
		}
	}
}