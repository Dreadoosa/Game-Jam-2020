/// @description Insert description here
// You can write your code in this editor
with (objSpawn) {
	objPlayer.x = objSpawn.x
	objPlayer.y = objSpawn.y
}
objCamera.xx = x;
objCamera.yy = y;
instance_create_layer(objPlayer.x,objPlayer.y,"Instances_1",objKey);