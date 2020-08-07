/// @description Insert description here
// You can write your code in this editor
timer++;
function changeStatesTank(newState) {
	state = newState
	timeInState = 0;
	mInc = 0;
}
function revv() {
	timeInState++;
	if (timeInState > 100) {
		changeStatesTank(m_states.movingforwardlong);
		exit;
	}
}
function pausing() {
	timeInState++;
	if (canRev && x > roomMiddle) {
	canRev = false;
	changeStatesTank(m_states.revving);
	}
	if (timeInState > 60) {
		if ( x > roomMiddle) {
		changeStatesTank(m_states.walkingforward)	
		} else {
		changeStatesTank(m_states.walkingback)
		}
		exit;
	}
}
function walkingforward() {
	timeInState++;
	if (timeInState < 180) {
		x-= 2;
	} else {
		changeStatesTank(m_states.pausing);
		exit;
	}
}
function walkingback() {
	timeInState++;
	x+= 2;
	if ( x >= anchorx) {
		changeStatesTank(m_states.shooting)
		exit;
	}
}
function shooting() {
	timeInState++;
	if (x > roomMiddle) {
		if (timeInState % 40 == 0) {
		var mort = instance_create_layer(x-30,y-30,"effects",objMiniBossMortar);
		mort.targetx = roomMiddle - mInc;
		mInc -= 120;
		}
		if (timeInState >= 121) {
			changeStatesTank(m_states.pausing)
		}
		canRev = true;
	} else {
		var mort = instance_create_layer(x-30,y-30,"effects",objMiniBossMortar);
		mort.targetx = objPlayer.x
		changeStatesTank(m_states.pausing)
	}
}
function shootingfast() {
timeInState++;
}
function movingforwardlong() {
	timeInState++;
	if (timeInState < 360) {
		x-= 3;
	} else {
		changeStatesTank(m_states.shooting);
		exit;
	}	
timeInState++;
}
function dying() {
	if (ds_list_empty(objGUI.sentences) && state == m_states.dying && canExit) {
		leaving = true;
	}
	cam_shake(5);
	timeInState++;
	if (!endFight && timeInState >= 60) {
	endFight = true;
	objPlayer.spd = 0;
	objPlayer.sprite_index = sprJunko;
	var lin = instance_create_layer(objPlayer.x,objPlayer.y,"effects",objLines)
	lin.sId = 6;
	canExit = true;
	}
}

if (hp <= 0 && state != m_states.dying) {
	changeStatesTank(m_states.dying);
	exit;
}


switch (state) {
	case m_states.movingforwardlong: movingforwardlong(); break;
	case m_states.walkingforward:    walkingforward();	  break;
	case m_states.walkingback:		 walkingback();		  break;
	case m_states.revving:			 revv();			  break;
	case m_states.shooting:			 shooting();	      break;
	case m_states.shootingfast:		 shootingfast();      break;
	case m_states.pausing:			 pausing();		      break;
	case m_states.dying:			 dying();			  break;
}
