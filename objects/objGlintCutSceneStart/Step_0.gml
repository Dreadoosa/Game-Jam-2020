/// @description Insert description here
// You can write your code in this editor

if (point_distance(x,y,objPlayer.x,objPlayer.y) < 300 && canStart) {
	canStart = false;
	alarm[2] = 40;
}
if (!canStart) {
	objPlayer.spd = 0;
	objPlayer.sprite_index = sprJunko;
	objPlayer.energyGauge = 150;
}
if (float) {
	sprite_index = sprGlintLaugh;
	image_xscale = scrApproachZero(image_xscale,.1);
	if(image_xscale == 0){instance_destroy()};
}
y = (anchorY + sin(timer*freq)*amplitude);
if (y <= 200) {
	instance_destroy();
	objCamera.actor = objPlayer;
}
if (floatx) {
	if (xspd < 2.5) {
	xspd += .1;
	}
	x+=xspd;
	
	

}
timer++;