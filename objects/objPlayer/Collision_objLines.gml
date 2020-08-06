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
	case 3:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" You're no fun!  I was having a good time until you came along!",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Who are you, and what are you doing here.",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Wouldn't you like to know?  Anyways, I'm out of here! Keep that key warm for me heheheh.",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" What are you talking about?",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Bye! ",undefined,undefined));
	break;	
	case 4:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" Junko!  Junko are you getting this transmission?",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Yeah.",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" That was a chaos robot, he's a master thief.. you may want to check your pockets.",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" I'll take your word for it. ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Really, you should check your pockets ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Sure. ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" ...Anyways.  Head further east so that you can get to the location of the next Keys! ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" What Keys? ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" They're keys that supply their constructs with infinite power, they're highly sought after legends! ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" That clears some things up.. ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Thats besides the point, you need to get to the next key as soon as possible!  Get to it! ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Right. ",undefined,undefined));
	break;
	case 5:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" Hey there, thats a real nice Key you got there.  It'd be a real shame if someone nabbed it! ",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Why did you just scrap him? ",undefined,undefined))
	ds_list_add(objGUI.sentences,scrDialogueLine(" He had a key, and I wanted it.  Duh!  What're you gonna do, fight me for it? ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Fine. ",undefined,undefined));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Great! ",undefined,undefined));
	break;	
	
	
}
instance_destroy(other);
audio_sound(sfx_transmissionstart);