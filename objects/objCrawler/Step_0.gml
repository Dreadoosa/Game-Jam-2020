/// @description Insert description here
// You can write your code in this editor
if (point_distance(objPlayer.x,objPlayer.y,x,y) > 100) {
	if (!place_meeting(x+spd,y,objWall)) {
		x+=spd;
	} else {
		while(!place_meeting(x+sign(spd),y,objWall)) {
		x += sign(spd);
		}
	}
}
if (locked && !carried && objPlayer.state == player_states.locked) {
	if (capGate == 3 && action_script_attack()) {
		instance_destroy();
		objPlayer.state = player_states.standing;
		objPlayer.spd = 1.5;
		keyboard_clear(vk_shift);
		exit;
	}
	if (charged < cap && action_script_winding() && action_script_attack()) {
		if (capGate == 0){
			hitSpark(objPlayer.x,objPlayer.y,spark_overcharge_simple,1)
		}
		if (capGate == 1){
			hitSpark(objPlayer.x,objPlayer.y,spark_overcharge_busy,1)
		}
		if (capGate == 2){
			hitSpark(objPlayer.x,objPlayer.y,spark_overcharge_busiest,1)
		}		
		charged+=20;
		audio_sound_alt(sfx_windup);
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
}
knockx = scrApproachZero(knockx,.5)
knocky = scrApproachZero(knocky,.5)
if (invuln > 0) {
	invuln--;
}
if (knocky == 0 && !carried && !locked) {
	if (!place_meeting(x,y+grav,objWall)) {
		y += grav;
	} else {
		while (!place_meeting(x,y+1,objWall)) {
		y++;
		}
	}
}
if (!place_meeting(x+knockx,y,objWall)) {
	x += knockx;
} else {
	while (!place_meeting(x+sign(knockx),y,objWall)) {
	x += sign(knockx)
	}
}
if (!place_meeting(x,y+knocky,objWall)) {
	y += knocky;
} else {
	while (!place_meeting(x,y+sign(knocky),objWall)) {
	y += sign(knocky)
	}
}
	
	
if (irandom(100) == 0 && point_distance(objPlayer.x,objPlayer.y,x,y) < 100 && canAttack) {
	image_xscale = -sign(objPlayer.x-x)
	sprite_index = sprCrawlerAttack;
	image_index = 0;
	image_speed = 1;
	canAttack = false;
	alarm[2] = sprite_get_number(sprite_index);
} 
if (hp < 0) {disabled = true;}