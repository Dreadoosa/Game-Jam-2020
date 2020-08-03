/// @description Insert description here
// You can write your code in this editor
if (invuln != 0) {
	invuln--;
}
if (knockx > 6 && knocky > 6) {
knockx = scrApproachZero(knockx,.5)
knocky = scrApproachZero(knocky,.5)
}
knockx = scrApproachZero(knockx,.1)
knocky = scrApproachZero(knocky,.1)
if (locked && !carried) {
	if (capGate == 4 && action_script_thrust()) {
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
	if (charged == cap && action_script_thrust()) {
	capGate++;
	cap -= 25;
	charged = 0;
	}
} else {
#region collisions and knockback
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
if (!place_meeting(x,y+grav,objWall)) {
	y += grav;
} else {
	while (!place_meeting(x,y+sign(grav),objWall)) {
	y += sign(grav)
	}
}
if (!place_meeting(x,y+1,objWall) && grav < 6) {
	grav += .1;
}
if (place_meeting(x,y+1,objWall)) {
	grav = 2;
}
if (hp < 0) {
	disabled = true;
}
#endregion
}