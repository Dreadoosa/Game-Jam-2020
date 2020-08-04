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
		var aud = 1/cap;
		if (!audio_is_playing(sfx_windup)) {
			audio_emitter_pitch(emitter,1+(charged*aud)*10)
			audio_play_sound_on(emitter,sfx_windup,false,0);
		}
	}
	
	if (!action_script_winding()) {
		if (charged  > 0) {
			charged--;
		}
	}
	if (charged == cap && action_script_attack()) {
	capGate++;
	cap -= 30;
	charged = 0;
	}
} else {
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

if (point_distance(x,y,objPlayer.x,objPlayer.y) < 40) {
	alert = false;
	var hb = instance_create_layer(x + -image_xscale*32,y,"Instances_1",objEnemyHitBox);
	hb.hitFrame = 5;
	hb.timer = 15;
}
if (alert) {
	image_speed = .5;
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

