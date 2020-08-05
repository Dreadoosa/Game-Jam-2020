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
	scrEnemyOverCharge();
} else {
	if(pause) {
		pauseTimer++;
		if(pauseTimer == 30) {
		pauseTimer = 0;
		pause = false;
		}
		exit
	}	
	scrEnemyMove();
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
scrEnemySmoking();