/// @description Insert description here
// You can write your code in this editor
//x = objPlayer.x-12
//y = objPlayer.y
if (objPlayer.energyGauge > 75 && objPlayer.energyGauge < 100) {
	image_speed = 1;
} else if (objPlayer.energyGauge > 50 && objPlayer.energyGauge < objPlayer.energyGauge < 75) {
	image_speed = .5;
} else if (objPlayer.energyGauge > 25 && objPlayer.energyGauge < objPlayer.energyGauge < 50) {
	image_speed = .25;
} else if (objPlayer.energyGauge < 25) {
	image_speed = .1;
} else if (objPlayer.energyGauge == 0) {
	image_speed = 0;
}

if (objPlayer.state == player_states.windingUp) {
	image_speed = 1 * objPlayer.gearCharge;
}