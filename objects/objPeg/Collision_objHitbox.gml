/// @description Insert description here
// You can write your code in this editor
//objPlayer.x = x-64;
//objPlayer.y = y;
objPlayer.sprite_index = sprJunko;
instance_destroy(other);
if (objPlayer.x < x) {
	with (objPlayer) {
	path_start(other.path,220,path_action_stop,true);
	}
} else {
	with (objPlayer) {
	path_start(other.path1,220,path_action_stop,true);
	}
}
objPlayer.grav = 3;
objPlayer.spd = 1.5;
scrChangeStates(player_states.swinging);