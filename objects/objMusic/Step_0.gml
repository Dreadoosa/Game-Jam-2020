/// @description Insert description here
// You can write your code in this editor
if (instance_exists(objGUI) && !ds_list_empty(objGUI.sentences)) {
	if (instance_exists(objGlintDialogue) || instance_exists(objGlintStart)) {
		if(!audio_is_playing(ostGlint)) {
		audio_play_sound_on(global.emitter,ostGlint,true,0);
		}	
	} else {
		if(!audio_is_playing(ostPunchcard) && !audio_is_playing(Trashheap__Miniboss_Theme_) && !audio_is_playing(The_Big_Bad__Glint_Boss_Theme_)) {
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
		audio_stop_sound(Scrapyard__Stage_1_Theme_);
		if(!audio_is_playing(Trashheap__Miniboss_Theme_)) {
		audio_play_sound_on(global.emitter,Trashheap__Miniboss_Theme_,true,0);
		}
	}
}
if (room == rmLevelTwoPartOne) {
	audio_stop_sound(Trashheap__Miniboss_Theme_);
	if(!audio_is_playing(Junkyard__Stage_2_Theme_)) {
	audio_play_sound_on(global.emitter,Junkyard__Stage_2_Theme_,true,0);
	}
}

if (room == rmLevelOnePartOne) {
	audio_stop_sound(Static__Intro_Ambience_);
	if(!audio_is_playing(Scrapyard__Stage_1_Theme_)) {
	audio_play_sound_on(global.emitter,Scrapyard__Stage_1_Theme_,true,0);
	}
}

if (room == rmTutorialOne) {
	if(!audio_is_playing(Static__Intro_Ambience_)) {
	audio_play_sound_on(global.emitter,Static__Intro_Ambience_,true,0);
	}
}