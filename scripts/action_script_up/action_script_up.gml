// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_script_up() {
	if (gamepad_is_connected(global.gpad)) {
		return gamepad_button_check(global.gpad,gp_padu)
	} else {
	return keyboard_check(ord("W"))
	}
}
