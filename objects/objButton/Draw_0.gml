/// @description Insert description here
// You can write your code in this editor
if (hovered) {
	if (action_script_attack()) {
		if (buttonScript != undefined) {
		script_execute(buttonScript);
		}
	}
	draw_rectangle_color(x-80,y-30,x+80,y+30,c_red,c_red,c_red,c_red,false)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_text(x,y,buttonText);
} else {
	draw_rectangle_color(x-80,y-30,x+80,y+30,c_black,c_black,c_black,c_black,false)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_text(x,y,buttonText);
}
//draw_self();