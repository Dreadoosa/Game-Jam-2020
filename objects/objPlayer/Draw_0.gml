/// @description Insert description here
// You can write your code in this editor
timerF++;
if (state != player_states.thrusting) {
draw_self();
} else {
	for (var i = 2; i >= 0; i--) {
		for (var n = 0; n <= 2; n++) {
			if (timerF % 2 == 0 && dashDirection != 0) {
			draw_sprite_ext(sprite_index,image_index,x + -image_xscale * (n*32),y,image_xscale,image_yscale,image_angle,make_color_rgb(0,0,i*60),1/6*i);
			}
			if (timerF % 2 == 0 && dashDirection == 0) {
			draw_sprite_ext(sprite_index,image_index,x,y + -image_xscale * (n*32),image_xscale,image_yscale,image_angle,make_color_rgb(0,0,i*60),1/6*i);
			}
		}
		draw_self();
	}
}/*
if (sprite_index == sprJunkoSlash || sprite_index == sprJunkoSlash2) {
	draw_self();
	draw_sprite_ext(sprite_index,image_index-1,x,y,image_xscale,image_yscale,0,c_white,1);
	draw_sprite_ext(sprite_index,image_index-2,x,y,image_xscale,image_yscale,0,c_red,.5);
	draw_sprite_ext(sprite_index,image_index-3,x,y,image_xscale,image_yscale,0,c_yellow,.25);
	draw_sprite_ext(sprite_index,image_index-4,x,y,image_xscale,image_yscale,0,c_white,.1);
}*/
if (enemyHeld != undefined) {
	enemyHeld.x = x;
	enemyHeld.y = y-32;
}
switch (state) {
	case player_states.walking:		draw_text(x,y-32,"walking")	   break;
	case player_states.standing:	draw_text(x,y-32,"standing")   break;
	case player_states.inair:		draw_text(x,y-32,"in air")	   break;
	case player_states.attacking:	draw_text(x,y-32,"attacking")  break;
	case player_states.thrusting:	draw_text(x,y-32,"thrusting")  break;
	case player_states.hanging:	    draw_text(x,y-32,"hanging")	   break;
	case player_states.locked:		draw_text(x,y-32,"locked")	   break;
	case player_states.windingUp:	draw_text(x,y-32,"winding up") break;
	case player_states.swinging:	draw_text(x,y-32,"swinging")   break;
}
draw_text(x,y+32,grav)
if (state == player_states.windingUp) {
	if (gearTwo > 0) {
	draw_healthbar(x-48,y-32,x-16,y-36,gearTwo/100 * 100,c_black,c_red,c_red,1,true,true)
	}
	if (gearOne > 0) {
	draw_healthbar(x+16,y-32,x+48,y-36,gearOne/100 * 100,c_black,c_red,c_red,0,true,true)
	}
}
if (state == player_states.downed) {
	draw_healthbar(x-30,y-32,x+30,y-28,downGauge/100 * 100,c_black,c_red,c_red,0,true,true)

}