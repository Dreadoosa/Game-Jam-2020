/// @description Insert description here
// You can write your code in this editor
part_emitter_region(objParticleManager.partSys,partEm,x-16,x+16,y-16,y+16,ps_shape_rectangle,ps_distr_linear);
part_emitter_stream(objParticleManager.partSys,partEm,objParticleManager.smoke,1);
draw_sprite_ext(sprite_index,image_number,x+irandom_range(-3,3),y+irandom_range(3,3),-sign(objPlayer.x-x),image_yscale,0,c_white,1);