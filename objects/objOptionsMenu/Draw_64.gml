/// @description Insert description here
// You can write your code in this editor
if (surface_exists(surfGui)) {
	surface_set_target(surfGui)
	draw_clear_alpha(c_white,0)
		draw_set_halign(fa_left)
		draw_set_valign(fa_left)
		draw_text(80,20,"Volume:")
		draw_healthbar(50,50,350,100,global.gain/1 * 100,c_black,c_red,c_red,0,true,true)
		draw_text(80,120,"Talk Speed:")
		draw_healthbar(50,150,350,200,global.talkSpeed/3*100,c_black,c_red,c_red,0,true,true)
		draw_text(80,250,"Language: " + global.language)
		if (window_get_fullscreen()) {
			draw_text(80,300,"Window: Fullscreen")
		} else {
			draw_text(80,300,"Window: Windowed")
		}
	surface_reset_target();
	draw_surface_ext(surfGui,200,0,objCamera.window_scale,objCamera.window_scale,0,c_white,1)
} else {
	surfGui = surface_create(1000,1000);
}
switch (optionSelect) {
	case 0:
		if (action_script_right_p()) {
			global.gain += .1;
			global.gain = clamp(global.gain,0,1);
		}
		if (action_script_left_p()) {
			global.gain -= .1;
			global.gain = clamp(global.gain,0,1);
		}	
	audio_emitter_gain(global.emitter,global.gain)		
	break;

	case 1:
		if (action_script_right_p()) {
			global.talkSpeed += .25;
			global.talkSpeed = clamp(global.talkSpeed,1,3);	
		}
		if (action_script_left_p()) {
			global.talkSpeed -= .25;
			global.talkSpeed = clamp(global.talkSpeed,1,3);	
		}	
			
	break;

	case 2:
		if (action_script_right_p()) {
			global.language = "ENG";
		}
		if (action_script_left_p()) {
			global.language = "LATAM";
		}
	break;	

	case 3:
		if (action_script_right_p()) {
			if (!window_get_fullscreen()) {
				window_set_fullscreen(true);
			}
		}
		if (action_script_left_p()) {
			if (window_get_fullscreen()) {
				window_set_fullscreen(false);
			}
		}
	break;	
}
if (action_script_up_p()) {
	optionSelect--;
	if(optionSelect == -1) {optionSelect = 4}
}
if (action_script_down_p()) {
	optionSelect++;
	if(optionSelect == 4) {optionSelect = 0}
}

if (action_script_escape_p()) {
	room_goto(rmMenu);
	audio_sound_alt(sfx_menudecline);
}

if (global.transition) {
	if (alpha < 1) {
		alpha += .05;
	}
	draw_set_alpha(alpha)
	draw_rectangle_color(0,0,99999,99999,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1)
}