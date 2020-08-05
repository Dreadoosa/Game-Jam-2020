/// @description Insert description here
// You can write your code in this editor
if(!ds_list_empty(objGUI.sentences)) {
	exit;
}
if (canExplode) {
	disabled = true;
	if (place_meeting(x,y,objEnemy) && knockx >= 5) {
		var en = instance_place(x,y,objEnemy);
		if (place_meeting(x,y,en)) {
		en.hp = -5;
		if (en.hp < 0) {en.disabled = true;}
		}
		instance_destroy();
	}
	explosion--;
	if(explosion == 0) {instance_destroy()};
	scrEnemyMove()
}
if(gravTime > 0) {gravTime--}
if (invuln != 0) {
	invuln--;
	sprite_index = sprBomberHurt;
} else if (invuln <= 0) {
	if (sprite_index != sprBomberTimer && sprite_index != sprBomberAlert) {
	//sprite_index = sprBomberWalk;
	}
}
if (knockx > 6 && knocky > 6) {
knockx = scrApproachZero(knockx,.5)
knocky = scrApproachZero(knocky,.5)
}
knockx = scrApproachZero(knockx,.1)
knocky = scrApproachZero(knocky,.1)
if (locked && !carried && objPlayer.state == player_states.locked) {
	if (capGate == 2 && action_script_attack()) {
		instance_destroy();
		objPlayer.state = player_states.standing;
		objPlayer.spd = 1.5;
		keyboard_clear(vk_shift);
		exit;
	}
	if (charged < cap && action_script_winding()) {
		charged++;
	}
	
	if (!action_script_winding()) {
		if (charged  > 0) {
			charged--;
		}
	}
	if (charged == cap && action_script_attack()) {
	capGate++;
	cap -= 10;
	charged = 0;
	}
} else {
	if(pause) {
		pauseTimer++;
		if(pauseTimer == 30) {
		pauseTimer = 0;
		pause = false;
		}
		exit
	}	
}
if (sprite_index == sprBomberTimer){
	if (!place_meeting(x+(4*dir),y,objWall)) {
		x+= (4*dir);
	} else {
		while (!place_meeting(x+sign((4*dir)),y,objWall)) {
		x+=sign((4*dir));
		}
	dir *= -1;
	image_xscale = -dir;
	}
}
if (sprite_index == sprBomberWalk){
	if (!place_meeting(x+(1*dir),y,objWall)) {
		x+= (1*dir);
	} else {
		while (!place_meeting(x+sign((1*dir)),y,objWall)) {
		x+=sign((1*dir));
		}
	dir *= -1;
	image_xscale = -dir;
	}
}


if (point_distance(x,y,objPlayer.x,objPlayer.y) < 50) {
	alert = true;
}
if (alert && !hasBeenAlerted) {
	image_speed = 1;
	sprite_index = sprBomberAlert
	hasBeenAlerted = true;
}