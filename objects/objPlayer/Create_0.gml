/// @description Insert description here
// You can write your code in this editor
spd = 1.5;
dir = 1;
grav = 2;
jump = 0;
jspd = -18;
jumpStore = 0;
jumpCharge = 0;
enum player_states {
	walking,
	inair,
	attacking,
	thrusting,
	standing
}
state = player_states.standing;
#macro log show_debug_message
instance_create_layer(x,y,"Instances_1",objKey)