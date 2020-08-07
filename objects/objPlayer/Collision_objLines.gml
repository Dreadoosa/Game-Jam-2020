/// @description Insert description here
// You can write your code in this editor
switch (other.sId) {
	case 0:
	//Array 0 is the string, 1 is the portrait, and 2 is who is talking (1 or 2)
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine("Sentence One",sprPJunko,sprPJunkoOne,sprPJunkoOne));
	ds_list_add(objGUI.sentences,scrDialogueLine("Sentence Two",sprPJunko,sprPJunkoOne,sprPJunko));
	ds_list_add(objGUI.sentences,scrDialogueLine("Sentence Three",sprPJunko,sprPJunkoOne,sprPJunkoOne));
	ds_list_add(objGUI.sentences,scrDialogueLine("Sentence Four",sprPJunko,sprPJunkoOne,sprPJunko));
	break;
	case 1:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" That thing over there is a crawler!",sprPJunko,sprPCommander,sprPCommander))
	ds_list_add(objGUI.sentences,scrDialogueLine(" That hostile robot is built with very strong defenses, hit it a few times" + "(" + scrAttackString() + ")" + " to lower it's defenses, then overcharge it " + "(" + scrWindString() + ")" + " like you did the door!",sprPJunko,sprPCommander,sprPCommander))
	ds_list_add(objGUI.sentences,scrDialogueLine(" When the gauge fills up, press (" + scrAttackString() + ") to overcharge it and destroy it! ",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Got it. ",sprPJunkoOne,sprPCommander,sprPJunkoOne));
	break;
	case 2:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" Junko!  Junko are you recieving this transmission? ",sprPJunko,sprPCommander,sprPCommander))
	ds_list_add(objGUI.sentences,scrDialogueLine("  Yeah.  Who is this? ",sprPJunko,sprPCommander,sprPJunko))
	ds_list_add(objGUI.sentences,scrDialogueLine(" I'm Commander, you've been out of comission for years.. ",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Years? ",sprPJunko,sprPCommander,sprPJunko));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Years. ",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Evil forces have run amock, you need to get to the western battlefield as soon as possible to intervene! ",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Got it. ",sprPJunkoOne,sprPCommander,sprPJunkoOne));
	break;
	case 3:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" You're no fun!  I was having a good time until you came along!",sprPJunko,sprPGlintHurt,sprPGlintHurt))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Who are you, and what are you doing here.",sprPJunko,sprPGlintHurt,sprPJunko))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Wouldn't you like to know?  Anyways, I'm out of here! Keep that key warm for me heheheh.",sprPJunko,sprPGlintHurt,sprPGlintHurt));
	ds_list_add(objGUI.sentences,scrDialogueLine(" What are you talking about?",sprPJunkoOne,sprPGlintWink,sprPJunkoOne));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Bye! ",sprPJunko,sprPGlintWink,sprPGlintWink));
	break;
	case 4:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" Junko!  Junko are you getting this transmission?",sprPJunko,sprPCommander,sprPCommander))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Yeah.",sprPJunkoOne,sprPCommander,sprPJunkoOne))
	ds_list_add(objGUI.sentences,scrDialogueLine(" That was a chaos robot, he's a master thief.. you may want to check your pockets.",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" I'll take your word for it. ",sprPJunko,sprPJunkoOne,sprPJunko));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Really, you should check your pockets ",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Sure. ",sprPJunko,sprPCommander,sprPJunko));
	ds_list_add(objGUI.sentences,scrDialogueLine(" ...Anyways.  Head further east so that you can get to the location of the next Keys! ",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" What Keys? ",sprPJunko,sprPCommander,sprPJunko));
	ds_list_add(objGUI.sentences,scrDialogueLine(" They're keys that supply their constructs with infinite power, they're highly sought after legends! ",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" That clears some things up.. ",sprPJunkoOne,sprPCommander,sprPJunkoOne));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Thats besides the point, you need to get to the next key as soon as possible!  Get to it! ",sprPJunko,sprPCommander,sprPCommander));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Right. ",sprPJunkoOne,sprPCommander,sprPJunkoOne));
	break;
	case 5:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" Hey there, thats a real nice Key you got there.  It'd be a real shame if someone nabbed it! ",sprPJunko,sprPGlintCute,sprPJunko))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Why did you just scrap him? ",sprPJunkoOne,sprPGlintWink,sprPJunkoOne))
	ds_list_add(objGUI.sentences,scrDialogueLine(" He had a key, and I wanted it.  Duh!  What're you gonna do, fight me for it? ",sprPJunko,sprPGlintCute,sprPGlintCute));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Fine. ",sprPJunkoOne,sprPJunkoOne,sprPJunkoOne));
	ds_list_add(objGUI.sentences,scrDialogueLine(" Great! ",sprPJunko,sprPGlintCute,sprPGlintCute));
	break;	
	case 6:
	var sentences = ds_list_create();
	ds_list_add(objGUI.sentences,scrDialogueLine(" Junko, that place is about to go down, you need to get out of there! ",sprPJunko,sprPJunkoOne,sprPJunkoOne))
	ds_list_add(objGUI.sentences,scrDialogueLine(" Right. ",sprPJunko,sprPJunkoOne,sprPJunkoOne))
	break;		
	
}
instance_destroy(other);
audio_sound(sfx_transmissionstart);