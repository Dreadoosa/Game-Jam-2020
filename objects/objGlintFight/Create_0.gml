/// @description Insert description here
// You can write your code in this editor
enum glint_states {
	gliding,
	floating,
	disabled,
	dashing,
	skyshot,
	bombing,
	axing,
}
canSpawn = true;
shots = 0;
shakex = 0;
shakey = 0;
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
state = glint_states.floating;
previousState = state;