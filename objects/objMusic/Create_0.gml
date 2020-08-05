/// @description Insert description here
// You can write your code in this editor
global.emitter = audio_emitter_create();
global.gain = .1;
audio_emitter_gain(global.emitter,.1)
if (room == rmMenu) {
	if (!audio_is_playing(ostTitle)) {
		audio_sound(ostTitle)
	}
}