/// @description Insert description here
// You can write your code in this editor
if(gravTime > 0) {gravTime--}
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
		if(gravTime == 0) {
		if (!place_meeting(x,y+grav,objWall)) {
			y += grav;
		} else {
			while (!place_meeting(x,y+sign(grav),objWall)) {
			y += sign(grav)
			}
		}
		}
		if(gravTime == 0) {
			if (!place_meeting(x,y+1,objWall) && grav < 6) {
				grav += .1;
			}
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
if (point_distance(x,y,objPlayer.x,objPlayer.y) < 40 && !((objPlayer.enemyHeld) == id) && place_meeting(x,y+1,objWall)) {
	alert = false;
	if (canAttack) {
		var hb = instance_create_layer(x + -image_xscale*32,y,"Instances_1",objEnemyHitBox);
		hb.hitFrame = 5;
		hb.timer = 15;
		canAttack = false;
		image_speed = 1;
		alarm[0] = 100;
		pause = true;
		pauseTimer = 0;
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