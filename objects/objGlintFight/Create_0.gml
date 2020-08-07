/// @description Insert description here
// You can write your code in this editor
enum glint_states {
	gliding,
	floating,
	disabled,
	dashing,
	slash,
	stalkingFlare,
	hurt,
	ultrashot,
	skyshot,
	tTransition,
	tTransition2,
	bombing,
	axing,
}
hDir = 1;
stateChange = 0;
canSpawn = true;
phase = 1;
bombin = false;
display = true;
shots = 0;
shakex = 0;
dashes = 0;
sfDir = 1;
slashes = 3;
shakey = 0;
dashin = true;
shootin = true
canAttack = true;
aPoint = 0;
alarm[0] = 5;
hitGauge = 0;
caught = false;
hhpp = 3;
canShoot= true;
floatTimer = 0
timeInState = 0;
dashTimer = 30;
floatPoint = false
dashPointOne = false;
//Initialize
anchorY = 200;
amplitude = 10;
freq = 0.1;
timer = 0;

amplitude1 = 5;
freq1 = 0.1;

state = glint_states.floating;
previousState = state;
with (objMusic) {
	if (!audio_is_playing(The_Big_Bad__Glint_Boss_Theme_)) {
		audio_play_sound_on(global.emitter,The_Big_Bad__Glint_Boss_Theme_,true,0)
	}

}