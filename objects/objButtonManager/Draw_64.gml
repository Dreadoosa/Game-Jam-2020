/// @description Insert description here
// You can write your code in this editor
if (global.transition) {
	if (alpha < 1) {
		alpha += .05;
	}
	draw_set_alpha(alpha)
	draw_rectangle_color(0,0,99999,99999,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1)
}