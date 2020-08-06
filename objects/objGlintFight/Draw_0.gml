/// @description Insert description here
// You can write your code in this editor


if (state == glint_states.disabled) {
	if (action_script_attack()) {
		shakex = irandom_range(-3,3);
		shakey = irandom_range(-3,3);
	}
	draw_sprite_ext(sprite_index,0,x+shakex,y+shakey,image_xscale,image_yscale,0,c_white,1);
	shakex = 0;
	shakey = 0;
} else {
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,1);
}


switch (state) {
	case glint_states.floating: draw_text(x,y-30,"Floating"); break;
	case glint_states.dashing: draw_text(x,y-30,"dashing"); break;
	case glint_states.bombing: draw_text(x,y-30,"bombing"); break;
	case glint_states.disabled: draw_text(x,y-30,"disabled"); break;
	case glint_states.skyshot: draw_text(x,y-30,"skysho"); break;
}
