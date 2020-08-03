/// @description Insert description here
// You can write your code in this editor
spd = 1.5;
dir = 1;
grav = 2;
jump = 0;
timer = 0;
jspd = -18;
knockx = 0;
knocky = 0;
jumpStore = 0;
jumpCharge = 0;
holdingEnemy = false;
enemyHeld = undefined;
downGauge = 0;
energyGauge = 100;
gearCharge = 0;
gearOne = 0;
gearTwo = 0;
thrustDist = 0;
charge = 0;
global.gpad = 0;
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
	chucking,
	thrusting,
	downed,
	locked,
	standing
}
state = player_states.standing;
#macro log show_debug_message
instance_create_layer(x,y,"Instances_1",objKey)