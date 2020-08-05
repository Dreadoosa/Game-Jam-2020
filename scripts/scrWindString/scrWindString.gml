// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrWindString(){
	if (gamepad_is_connected(global.gpad)) {
		return "right trigger"
	} else {
		return "right mouse button"
	}
}