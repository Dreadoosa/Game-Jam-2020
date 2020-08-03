/// @description Insert description here
// You can write your code in this editor
objPlayer.x = x + (32 * -objPlayer.image_xscale)
objPlayer.sprite_index = sprJunko;
instance_destroy(other);
scrChangeStates(player_states.hanging);