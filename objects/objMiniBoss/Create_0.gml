/// @description Insert description here
// You can write your code in this editor
timeInState = 0;
display = true;
enum m_states {
	walkingback,
	walkingforward,
	shooting,
	pausing,
	revving,
	shootingfast,
	dying,
	movingforwardlong
}
exitAlpha = 0;



canExit = false;
invuln = false;
leaving = false;
endFight = false;
state = m_states.pausing;
timer = 0;
mInc = 0;
canRev = false;
anchorx = x;
#macro roomMiddle 638
hp = 50;
active = true;
alpha = 0;
alarm[1] = 5;