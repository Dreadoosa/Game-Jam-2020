/// @description Insert description here
// You can write your code in this editor
//draw_healthbar(10,10,500,30,objPlayer.energyGauge/100 * 100,c_black,c_red,c_red,0,true,true)
draw_text(530,15,string(objPlayer.gearCharge));
draw_sprite(sprChargeBar,objPlayer.gearCharge,90,340)
draw_sprite(sprRevKey,keyTimer,65,340)
draw_sprite(sprEnergyBox,0,80,25);
keyTimer += keyInc;
if (keyInc == 0) {
	keyTimer = 0;
	}
if (!ds_list_empty(sentences)) {
	draw_set_alpha(.5)
	draw_rectangle_color(0,0,9999,9999,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1);
	var arr = sentences[|curString];
	if (curPos < string_length(arr[@0]) + 1) {
		curPos += .5;
	}
	draw_text(100,100,string_copy(arr[@0],0,curPos));
	if (curPos == string_length(arr[@0]) + 1 && action_script_attack()) {
		curPos = 0;
		if(curString + 1 == ds_list_size(sentences)) {
		ds_list_clear(sentences)
		audio_sound(sfx_transmissionend);
		}
		curString++;
	}
	
}