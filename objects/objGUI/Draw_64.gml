/// @description Insert description here
// You can write your code in this editor
//draw_healthbar(10,10,500,30,objPlayer.energyGauge/100 * 100,c_black,c_red,c_red,0,true,true)
if (surface_exists(guiSurf)) {
surface_set_target(guiSurf);
draw_clear_alpha(c_white,0)
draw_sprite(sprChargeBar,objPlayer.gearCharge,90,340)
draw_sprite(sprRevKey,keyTimer,25,340)
draw_sprite(sprEnergyBox,0,80,25);
for (var i = 0; i < objPlayer.hitPoints; i++) {
		draw_sprite(sprHeart,0,32 + i*32,25)
}
keyTimer += keyInc;
if (keyInc == 0) {
	keyTimer = 0;
	}
if (!ds_list_empty(sentences)) {
	draw_set_alpha(.8)
	draw_rectangle_color(0,0,9999,9999,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1);
	var arr = sentences[|curString];
	if (curPos < string_length(arr[@0]) + 1) {
		if (action_script_attack()) {
			curPos += 1 + global.talkSpeed;
			if(curPos % 2 == 0) {
			if(audio_is_playing(sfx_dialogue)){audio_stop_sound(sfx_dialogue)}
			audio_sound_alt(sfx_dialogue)
			}
		} else {
			curPos += global.talkSpeed;
			if(curPos % 2 == 0) {
			if(audio_is_playing(sfx_dialogue)){audio_stop_sound(sfx_dialogue)}
			audio_sound_alt(sfx_dialogue)
			}
		}
	}


	
	draw_set_halign(fa_left) {
	draw_set_valign(fa_left)
	draw_rectangle_color(65,225,545,320,c_black,c_black,c_black,c_black,false)
	draw_rectangle_color(0,0,65,65,c_black,c_black,c_black,c_black,false)
	
	draw_text_ext(70,240,string_copy(arr[@0],0,curPos),15,465);
	}
	if (curPos >= string_length(arr[@0]) + 1 && action_script_attack()) {
		curPos = 0;
		if(curString + 1 == ds_list_size(sentences)) {
		ds_list_clear(sentences)
		audio_sound(sfx_transmissionend);
		}
		curString++;
	}
}
surface_reset_target();
draw_surface_ext(guiSurf,0,0,objCamera.window_scale,objCamera.window_scale,0,c_white,1);
} else {
	guiSurf = surface_create(1000,1000);

}