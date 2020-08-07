/// @description Insert description here
// You can write your code in this editor
if (other.active && invuln == 0) {
	knockx = image_xscale *6
	knocky = -3
	invuln = 10;
	hp--;
	cam_shake(3);
	audio_sound(sfx_hit);
}