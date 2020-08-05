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
	ds_list_add(objGUI.sentences,scrDialogueLine(" That thing over there is a crawler!",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" That hostile robot is built with very strong defenses, hit it a few times" + "(" + scrAttackString() + ")" + " to lower it's defenses, then overcharge it " + "(" + scrWindString() + ")" + " like you did the door!",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" When the gauge fills up, press (" + scrAttackString() + ") to overcharge it and destroy it! ",undefined,undefined));
	break;
	case 2:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" Junko!  Junko are you recieving this transmission? ",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine("  Yeah.  Who is this? ",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" I'm Commander, you've been out of comission for years.. ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Years? ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Years. ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Evil forces have run amock, you need to get to the western battlefield as soon as possible to intervene! ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Got it. ",undefined,undefined));
	break;
}
instance_destroy(other);
audio_sound(sfx_transmissionstart);