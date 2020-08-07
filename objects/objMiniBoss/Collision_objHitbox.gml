/// @description Insert description here
// You can write your code in this editor
if (other.active) {
	if (!invuln) {
	cam_shake(3);
	hitSpark(x + irandom_range(-3,3),y-16 + irandom_range(-3,3),spark_hit,1);
	audio_sound(sfx_hit);
	hp-=1;
	invuln = true;
	alarm[0] = 15;
	}
	
}