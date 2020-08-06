/// @description Insert description here
// You can write your code in this editor
if (ds_list_empty(objGUI.sentences)) {
	if (image_xscale > 0) {
		image_xscale-=.1;
	} else {
		image_xscale+=.1;	
	}
}
if (image_xscale == 0){
	instance_destroy();	
}