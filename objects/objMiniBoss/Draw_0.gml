/// @description Insert description here
// You can write your code in this editor
if (invuln) {
	if (display) {
		if (state != m_states.revving) {
			draw_self();
		} else {
			draw_sprite(sprite_index,image_index,x+irandom_range(-6,6),y+irandom_range(-6,6));
		}
		if (state == m_states.dying) {
			if (alpha < 1) {alpha += .05};
			draw_set_alpha(alpha)
			draw_rectangle_color(0,0,99999,99999,c_white,c_white,c_white,c_white,false)
			draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_black,1);
			draw_set_alpha(1);
			if (timer % 2 == 0) {
			hitSpark(irandom_range(x-150,x+150),irandom_range(y-150,y+150),spark_boom,irandom_range(1,3));
			hitSpark(irandom_range(x-150,x+150),irandom_range(y-150,y+150),spark_boom,irandom_range(1,3));
			hitSpark(irandom_range(x-150,x+150),irandom_range(y-150,y+150),spark_boom,irandom_range(1,3));
			}
			if (timer % 5 == 0) {
			audio_sound_alt(sfx_explosion)
			}
		}
	}
} else {
	if (state != m_states.revving) {
		draw_self();
	} else {
		draw_sprite(sprite_index,image_index,x+irandom_range(-6,6),y+irandom_range(-6,6));
	}
	if (state == m_states.dying) {
		if (alpha < 1) {alpha += .05};
		draw_set_alpha(alpha)
		draw_rectangle_color(0,0,99999,99999,c_white,c_white,c_white,c_white,false)
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_black,1);
		draw_set_alpha(1);
		if (timer % 2 == 0) {
		hitSpark(irandom_range(x-150,x+150),irandom_range(y-150,y+150),spark_boom,irandom_range(1,3));
		hitSpark(irandom_range(x-150,x+150),irandom_range(y-150,y+150),spark_boom,irandom_range(1,3));
		hitSpark(irandom_range(x-150,x+150),irandom_range(y-150,y+150),spark_boom,irandom_range(1,3));
		}
		if (timer % 5 == 0) {
		audio_sound_alt(sfx_explosion)
		}
	}
}

if (leaving && exitAlpha < 1) {
	exitAlpha += .1;
	if(exitAlpha == 1) {
	room_goto(rmLevelTwoPartOne);
	}
}