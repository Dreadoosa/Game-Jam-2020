/// @description Insert description here
// You can write your code in this editor
objPlayer.energyGauge += 80;
audio_sound(sfx_explosion);
var ex = instance_create_layer(x,y,"Instances_1",objEnemyHitBox);
ex.timer = 3;