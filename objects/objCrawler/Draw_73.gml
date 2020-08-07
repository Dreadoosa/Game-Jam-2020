/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(mask_index,0,x,y,1,1,0,c_aqua,0.5);
if (invuln > 0) {
	sprite_index = sprCrawlerHurt
	if (display) {
		draw_sprite_ext(sprCrawlerHurt,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
	}
} else {
	if (sprite_index != sprCrawlerAttack) {
	sprite_index = sprCrawlerWalk;
	}
}
if (id.disabled) {
	part_emitter_region(objParticleManager.partSys,partEm,x-16,x+16,y-16,y+16,ps_shape_rectangle,ps_distr_linear);
	part_emitter_stream(objParticleManager.partSys,partEm,objParticleManager.smoke,1);
	draw_sprite_ext(sprite_index,image_index,x+irandom_range(-4,4),y+irandom_range(-4,4),image_xscale,image_yscale,0,c_white,1);
}