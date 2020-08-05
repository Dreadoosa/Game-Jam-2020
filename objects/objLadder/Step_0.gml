/// @description Insert description here
// You can write your code in this editor
with (objPlayer) {
	if (action_script_up() && place_meeting(x,y,other.id) && state != player_states.ladder && canGrab) {
		x = other.x;
		state = player_states.ladder;
	} 
}