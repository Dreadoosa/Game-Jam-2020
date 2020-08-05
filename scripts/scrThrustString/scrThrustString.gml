// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrThrustString(){
	if (gamepad_is_connected(global.gpad)) {
		return "triangle on dualshock, Y on xbox controller"
	} else {
		return "shift"
	}
}