if (invuln != 0) {
	invuln--;
}
if(gravTime > 0) {gravTime--}
if (knockx > 6 && knocky > 6) {
knockx = scrApproachZero(knockx,.5)
knocky = scrApproachZero(knocky,.5)
}
knockx = scrApproachZero(knockx,.1)
knocky = scrApproachZero(knocky,.1)
if (locked && !carried && objPlayer.state == player_states.locked) {
	image_speed = 0;
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
}

#region collisions and knockback
if (!place_meeting(x+knockx,y,objWall)) {
	x += knockx;
} else {
	while (!place_meeting(x+sign(knockx),y,objWall)) {
	x += sign(knockx)
	}
}
if (gravTime == 0) { 
	if (!place_meeting(x,y+grav,objWall)) {
		y += grav;
	} else {
		while (!place_meeting(x,y+sign(grav),objWall)) {
		y += sign(grav)
		}
	}
}
if (!place_meeting(x,y+knocky,objWall)) {
	y += knocky;
} else {
	while (!place_meeting(x,y+sign(knocky),objWall)) {
	y += sign(knocky)
	}
}
if (gravTime == 0) {
	if (!place_meeting(x,y+1,objWall) && grav < 15) {
		grav += .25;
	}
}

if (hp < 0) {
	disabled = true;
}
#endregion