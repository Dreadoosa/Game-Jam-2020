/// @description Insert description here
// You can write your code in this editor
if (enterable) {
	if (place_meeting(x-50,y,objPlayer)) {
	//room_goto_next()
	objPlayer.state = player_states.standing;
	objPlayer.spd = 1.5;
	//exit;
	}
}
objPlayer.x = x-32;