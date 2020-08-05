// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrEnemyMove(){
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
	}
}