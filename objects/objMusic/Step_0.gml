/// @description Insert description here
// You can write your code in this editor
if (instance_exists(objGUI) && !ds_list_empty(objGUI.sentences)) {
	if (instance_exists(objGlintDialogue) || instance_exists(objGlintStart)) {
		if(!audio_is_playing(ostGlint)) {
		audio_play_sound_on(global.emitter,ostGlint,true,0);
		}	
	} else {
		if(!audio_is_playing(ostPunchcard)) {
		audio_play_sound_on(global.emitter,ostPunchcard,true,0);
		}
	}
} else {
	audio_stop_sound(ostPunchcard);
	audio_stop_sound(ostGlint);
}
if (audio_is_playing(ostTitle) && room != rmMenu) {
	audio_stop_sound(ostTitle);
}

if (room == rmLevelOneMiniBoss) {
	if (objMiniBoss.active) {
		if(!audio_is_playing(Trashheap__Miniboss_Theme_)) {
		audio_play_sound_on(global.emitter,Trashheap__Miniboss_Theme_,true,0);
		}
	}
}