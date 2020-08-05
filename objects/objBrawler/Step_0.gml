/// @description Insert description here
// You can write your code in this editor

if(!ds_list_empty(objGUI.sentences)) {
	exit;
}
if(gravTime > 0) {gravTime--}
if (invuln != 0) {
	invuln--;
}
if (locked && !carried && objPlayer.state == player_states.locked) {
	image_speed = 0;
	if (capGate == 2) {
		instance_destroy();
		objPlayer.state = player_states.standing;
		objPlayer.spd = 1.5;
		keyboard_clear(vk_shift);
		exit;
	}
	if (charged < cap && action_script_winding() && action_script_attack()) {
		charged+=15;
	}
	
	if (!action_script_winding()) {
		if (charged  > 0) {
			charged--;
		}
	}
	if (charged >= cap && action_script_attack()) {
	capGate++;
	cap -= 10;
	charged = 0;
	}
} else {
scrEnemyMove();
}
if(pause > 0){pause--; exit;}
if(knockx > 6){
var hb = instance_create_layer(x + -image_xscale*32,y,"Instances_1",objEnemyHitBox);
hb.hitFrame = 5;
hb.timer = 15;}
if (knockx > 6 && knocky > 6) {
knockx = scrApproachZero(knockx,.5)
knocky = scrApproachZero(knocky,.5)
}
knockx = scrApproachZero(knockx,.1)
knocky = scrApproachZero(knocky,.1)
if (point_distance(x,y,objPlayer.x,objPlayer.y) < 30) {
	alert = true;
}
if (point_distance(x,y,objPlayer.x,objPlayer.y) < 80 && !((objPlayer.enemyHeld) == id) && place_meeting(x,y+1,objWall)) {
	if (canAttack) {
		alarm[2] = 30;
		pause = 30;
		canAttack = false;
	}
}
if (alert) {
	image_speed = 0;
	if (-sign(objPlayer.x - x)) {
		image_xscale = 1;
		if (!place_meeting(x-1,y,objWall)) {
			x--;
		}
	} else {
		image_xscale = -1;
		if (!place_meeting(x+1,y,objWall)) {
			x++;
		}
	}
}