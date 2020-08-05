/// @description Insert description here
// You can write your code in this editor
if (instance_exists(objGUI) && !ds_list_empty(objGUI.sentences)) {
	if(!audio_is_playing(ostPunchcard)) {
	audio_play_sound_on(global.emitter,ostPunchcard,true,0);
	}
} else {
	audio_stop_sound(ostPunchcard);
}
if (audio_is_playing(ostTitle) && room != rmMenu) {
	audio_stop_sound(ostTitle);
}