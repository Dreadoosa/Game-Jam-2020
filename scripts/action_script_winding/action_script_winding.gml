// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_script_winding() {
	connect_gpad();
	if (gamepad_is_connected(global.gpad)) {
		return gamepad_button_check(global.gpad,gp_shoulderrb)
	} else {
	return mouse_check_button(mb_right);
	}
}
