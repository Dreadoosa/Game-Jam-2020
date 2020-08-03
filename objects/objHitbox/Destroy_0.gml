/// @description Insert description here
// You can write your code in this editor
with (objPlayer) {
	if (action_script_left() || action_script_right()) {
		scrChangeStates(player_states.walking)
	} else {
		scrChangeStates(player_states.standing)
	}
}