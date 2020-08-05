// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAttackString(){
	if (gamepad_is_connected(global.gpad)) {
		return "square on dualshock or x on the xbox controller"
	} else {
		return "left mouse button"
	}
}