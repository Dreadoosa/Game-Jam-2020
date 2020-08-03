// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function connect_gpad(){
	for (var i = 0; i < 12; i++) {
		if (gamepad_is_connected(i)) {
		global.gpad = i;
		}
	}	
}