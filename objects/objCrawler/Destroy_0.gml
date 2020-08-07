/// @description Insert description here
// You can write your code in this editor
repeat(6) {
hitSpark(x + irandom_range(-32,32),y + irandom_range(-32,32),spark_boom,1);
}
cam_shake(12);
audio_sound(sfx_explosion);