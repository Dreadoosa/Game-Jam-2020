/// @description Insert description here
// You can write your code in this editor
with (other) {
	repeat(6) {
	hitSpark(x + irandom_range(-32,32),y + irandom_range(-32,32),spark_boom,1);
	}
	repeat(5) {
	var scrap = instance_create_layer(x,y,"effects",objScrap);
	scrap.sprite_index = choose(bomber_scrap_backplate,bomber_scrap_eye,bomber_scrap_frontplate)
	scrap.dir = choose (-4,4)
	scrap.grav = -6;
	}
	cam_shake(12);
	audio_sound(sfx_explosion);
	instance_destroy();
}
instance_destroy();