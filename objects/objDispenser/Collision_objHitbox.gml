/// @description Insert description here
// You can write your code in this editor
if (other.active && !invuln) {
	hp--;
	if(hp > 0) {
		var bat = instance_create_layer(x,y,"effects",objBattery);
		bat.spd = choose(-3,3);
		shakex = 6;
	}
	hitSpark(x,y,spark_hit,1)
	audio_sound(sfx_hit);
	invuln = true;
	alarm[0] = 7;
}
shakex = scrApproachZero(shakex,1);