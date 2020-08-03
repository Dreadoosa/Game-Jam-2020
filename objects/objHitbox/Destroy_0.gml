/// @description Insert description here
// You can write your code in this editor
with (objPlayer) {
	if (action_script_left() || action_script_right()) {
		objPlayer.state = player_states.walking
	} else {
		objPlayer.state = player_states.standing
	}
}