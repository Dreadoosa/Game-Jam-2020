// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_script_right_p() {
	connect_gpad();
	if (gamepad_is_connected(global.gpad)) {
	return gamepad_button_check_pressed(global.gpad,gp_padr)
	} else {
	return keyboard_check_pressed(ord("D"))
	}
}