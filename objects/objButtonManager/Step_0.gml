/// @description Insert description here
// You can write your code in this editor
connect_gpad()
if (init) {
	with (objButton) {
		if (ds_list_find_index(other.buttons,id) == -1) {
		ds_list_add(other.buttons,id)
		log("button added")
		}
	}
}
if (action_script_down_p()) {
	curButton--;
	audio_sound_alt(sfx_menuup);
	if(curButton == -1){curButton = ds_list_size(buttons)-1}
}
if (action_script_up_p()) {
	curButton++;
	audio_sound_alt(sfx_menuup);
	if(curButton == ds_list_size(buttons)){curButton = 0}
}


with (objButton) {
	hovered = false
}
var but = buttons[|curButton];
but.hovered = true;
log(curButton);