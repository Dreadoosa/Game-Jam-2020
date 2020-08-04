// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function audio_sound(audio){
	audio_master_gain(global.gain)
	if (!audio_is_playing(audio)) {
		audio_play_sound_on(global.emitter,audio,0,0);
	}
	//audio_master_gain(1)
}