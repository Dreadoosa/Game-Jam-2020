// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrDialogueLine(str, portrait, talker){
	var array = array_create(3,0);
	array[@0] = str
	array[@1] = portrait
	array[@2] = talker
	return array
}