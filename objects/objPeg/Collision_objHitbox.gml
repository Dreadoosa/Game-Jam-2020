/// @description Insert description here
// You can write your code in this editor
//objPlayer.x = x-64;
//objPlayer.y = y;
objPlayer.sprite_index = sprJunko;
instance_destroy(other);
if (objPlayer.x < x) {
	with (objPlayer) {
	path_start(other.path,200,path_action_stop,true);
	}
} else {
	with (objPlayer) {
	path_start(other.path1,200,path_action_stop,true);
	}
}
scrChangeStates(player_states.swinging);