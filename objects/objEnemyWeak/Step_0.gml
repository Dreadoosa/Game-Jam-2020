
if (invuln != 0) {
	invuln--;
}
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
} else {
	if(pause) {
		pauseTimer++;
		if(pauseTimer == 30) {
		pauseTimer = 0;
		pause = false;
		}
		exit
	}	
	if (!attacking) {
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
	} else {		
	
	}
}

if (point_distance(x,y,objPlayer.x,objPlayer.y) < 150) {
	alert = true;
}
image_speed = 0;



image_xscale = 1;
if (!place_meeting(x + dir,y,objWall)) {
	x += dir;
} else {
	dir*=-1;
}