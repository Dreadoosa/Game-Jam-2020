/// @description Insert description here
// You can write your code in this editor
with (objPlayer) {
	if (place_meeting(x,y+1,objWall)) {
		if (action_script_left() || action_script_right()) {
			scrChangeStates(player_states.walking)
		} else {
			scrChangeStates(player_states.standing)
		}
	} else {
		scrChangeStates(player_states.inair)
	}
}