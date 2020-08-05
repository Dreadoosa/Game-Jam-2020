// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrEnemySmoking(){
	timer++;
	if (disabled) {
		if (timer % 2 == 0) {
		part_emitter_stream(objParticleManager.partSys,partEm,objParticleManager.smoke,1);
		part_emitter_region(objParticleManager.partSys,partEm,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_shape_line);
		part_emitter_burst(objParticleManager.partSys,partEm,objParticleManager.smoke,1);

		part_emitter_stream(objParticleManager.partSys1,partEm1,objParticleManager.smoke,1);
		part_emitter_region(objParticleManager.partSys1,partEm1,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_shape_line);
		part_emitter_burst(objParticleManager.partSys1,partEm1,objParticleManager.smoke,1);
		}
	}
}