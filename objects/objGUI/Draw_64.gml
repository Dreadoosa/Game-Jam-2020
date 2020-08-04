/// @description Insert description here
// You can write your code in this editor
draw_healthbar(10,10,500,30,objPlayer.energyGauge/100 * 100,c_black,c_red,c_red,0,true,true)
draw_text(530,15,string(objPlayer.gearCharge));

if (!ds_list_empty(sentences)) {
	if (curPos < string_length(sentences[|curString])-1) {
		draw_text(100,100,string_copy(sentences[|curString],0,curPos));
		curPos += .1;
	}
	if (curPos == string_length(sentences[|curString])-1 && action_script_attack()) {
		curPos = 0;
		curString++;
	}	
	log(string_copy(sentences[|curString],0,curPos))
}