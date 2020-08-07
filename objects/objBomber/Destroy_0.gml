/// @description Insert description here
// You can write your code in this editor
objPlayer.energyGauge += 80;
audio_sound(sfx_explosion);
var ex = instance_create_layer(x,y,"Instances_1",objEnemyHitBox);
ex.timer = 3;
repeat(5) {
var scrap = instance_create_layer(x,y,"effects",objScrap);
scrap.sprite_index = choose(bomber_scrap_backplate,bomber_scrap_eye,bomber_scrap_frontplate)
scrap.dir = choose (-4,4)
scrap.grav = -6;
}
repeat(6) {
hitSpark(x + irandom_range(-32,32),y + irandom_range(-32,32),spark_boom,1);
}
cam_shake(12);
audio_sound(sfx_explosion);
with (objPlayer) {
	if (enemyHeld != undefined) {
	if (objPlayer.state == player_states.thrusting || objPlayer.state == player_states.locked) {
		with(objPlayer) {
		scrChangeStates(player_states.standing);
		}
	}
	enemyHeld.locked = false;
	enemyHeld.carried = false;
	enemyHeld = undefined;
	}
}