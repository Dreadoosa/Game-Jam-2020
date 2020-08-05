/// @description Insert description here
// You can write your code in this editor
hitPoints = 4;
spd = 1.5;
dir = 1;
grav = 2;
attacks = 0;
jump = 0;
thrusts = 1;
timer = 0;
jspd = -18;
knockx = 0;
alarm[0] = 5;
knocky = 0;
jumpStore = 0;
jumpCharge = 0;
holdingEnemy = false;
enemyHeld = undefined;
downGauge = 0;
canShake = false;
energyGauge = 100;
gearCharge = 0;
gearOne = 0;
gearTwo = 0;
thrustDist = 0;
charge = 0;
global.gpad = 0;
global.hitStop = 0;
dashDirection = 0;
timerF = 0;
tBuff = 0;
display = true;
swingPath = undefined;
knockTime = 0;
aBuff = 0;
hasKey = false;
for (var i = 0; i < 12; i++) {
	if (gamepad_is_connected(i)) {
	global.gpad = i;
	log("gpad found")
	}
}
enum player_states {
	walking,
	inair,
	attacking,
	windingUp,
	hanging,
	dead,
	downing,
	swinging,
	chucking,
	thrusting,
	knockBack,
	downed,
	locked,
	disabled,
	standing
}
state = player_states.disabled;
previousState = player_states.disabled
timeInState = 0;
#macro log show_debug_message
instance_create_layer(x,y,"Instances_1",objKey)