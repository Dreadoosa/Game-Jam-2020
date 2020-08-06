/// @description Insert description here
// You can write your code in this editor
objPlayer.energyGauge += 80;
audio_sound(sfx_explosion);
var ex = instance_create_layer(x,y,"Instances_1",objEnemyHitBox);
ex.timer = 3;
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