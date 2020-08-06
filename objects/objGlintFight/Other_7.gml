/// @description Insert description here
// You can write your code in this editor
if (sprite_index == sprGlintCapeShot && state == glint_states.ultrashot) {
glintStateChange(glint_states.slash)
image_speed = 2;
slashes = 10;
exit;
}
if (sprite_index == sprGlintCapeShot) {
	if (shots < 4) {
	shots++;
	sprite_index = sprGlintFloat;
	canShoot = true;
	exit;
	} else {
	sprite_index = sprGlintFloat;
	dashin = true;
	glintStateChange(glint_states.floating)
	shootin = true;
	canShoot = true;
	shots = 0;
	}
}
if (sprite_index == sprGlintBombSpawn) {
	sprite_index = sprGlintLaugh;
}
if (sprite_index == sprGlintSwipe) {
	if (slashes > 0) {
		x = objPlayer.x;
		canAttack = true;
		y = objPlayer.y-10;
		anchorY = y;
		slashes--;
	} else {
		bombin = true;
		glintStateChange(glint_states.floating);
		sprite_index = sprGlintFloat;
		slashes = 0;
		exit;
	}
}