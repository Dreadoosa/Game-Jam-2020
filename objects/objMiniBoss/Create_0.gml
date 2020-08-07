/// @description Insert description here
// You can write your code in this editor
timeInState = 0;
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
state = m_states.pausing;
mInc = 0;
canRev = false;
anchorx = x;
#macro roomMiddle 638
hp = 50;
active = true;