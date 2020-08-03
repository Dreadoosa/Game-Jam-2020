// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrChangeStates(newState) {
	with (objPlayer) {
	if (newState == player_states.attacking) {
		image_speed = 2;
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
	if (state == player_states.locked && thisEn != undefined) {
		thisEn.y -= 32;
		thisEn.knocky = -4;
		thisEn.knockx = -image_xscale*6;
	}
	timeInState = 0;
	previousState = state;
	state = newState
	}
}