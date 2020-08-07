/// @description Insert description here
// You can write your code in this editor
y = (anchorY + sin(timer*freq)*amplitude);
timer++
if (spd != 0) {
	spd = scrApproachZero(spd,.1);
} 
x+=spd;