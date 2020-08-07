// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hitSpark(posx,posy,sprite,spd){
	var hs = instance_create_layer(posx,posy,"effects",objHitSpark);
	hs.sprite_index = sprite
	hs.image_speed = spd;
	return hs;
}