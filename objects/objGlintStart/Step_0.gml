/// @description Insert description here
// You can write your code in this editor
if (!init && ds_list_empty(objGUI.sentences)) {
	instance_create_layer(x,y,"Instances_1",objGlintFight);
	instance_destroy();
}
if (objPlayer.x >= 130 && init) {
	init = false;
	var lin = instance_create_layer(objPlayer.x,objPlayer.y,"Instances_1",objLines)
	lin.sId = 5;
}