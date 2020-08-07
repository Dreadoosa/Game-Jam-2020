/// @description Insert description here
// You can write your code in this editor
if (bDirection < 260) {
	alarm[0] = 15;
	floatx = true;
	repeat(5) {
	var blast = instance_create_layer(x,y,"Instances_1",objCutSceneBlasts);
	blast.dir = bDirection;
	bDirection += 5 + irandom_range(-2,2)
	}
	sprite_index = sprGlintCapeShot;
	image_speed = 2;
} else {
	sprite_index = sprGlintLaugh;
	alarm[1] = 90;
}
