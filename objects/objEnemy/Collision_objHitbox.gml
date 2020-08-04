/// @description Insert description here
// You can write your code in this editor
if (other.active && invuln == 0) {
	knockx = other.force * other.dir;
	knocky = -other.force/2
	invuln = 10;
	hp--;
	audio_sound(sfx_hit);
}