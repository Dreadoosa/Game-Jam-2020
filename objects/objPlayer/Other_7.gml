/// @description Insert description here
// You can write your code in this editor
if (sprite_index == sprJunkoSlash) {
	if (state == player_states.walking) {
	sprite_index = sprJunkWalk
	} else {
	sprite_index = sprJunko;
	}
}
if (sprite_index == sprJunkoFall) {
	image_speed = 0;
}