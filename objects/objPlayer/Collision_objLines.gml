/// @description Insert description here
// You can write your code in this editor
switch (other.sId) {
	case 0:
	//Array 0 is the string, 1 is the portrait, and 2 is who is talking (1 or 2)
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine("Sentence One",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine("Sentence Two",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine("Sentence Three",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine("Sentence Four",undefined,undefined));
	break;
	case 1:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,"Junko!  Is this transmission coming through?");
	ds_list_add(objGUI.sentences,"Sentence Two");
	ds_list_add(objGUI.sentences,"Sentence Three");
	ds_list_add(objGUI.sentences,"Sentence Four");	
	break;
}
instance_destroy(other);
audio_sound(sfx_transmissionstart);