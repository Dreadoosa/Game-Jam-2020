/// @description Insert description here
// You can write your code in this editor
knockx = 0;
gravTime = 0;
knocky = 0;
invuln = 0;
disabled = false;
hp = 3;
num = 50;
partEm = part_emitter_create(objParticleManager.partSys);
pause = false;
pauseTimer = 0;
dir = 1;
locked = false;
attacking = false;
alert = false;
canAttack = true;
carried = false;
emitter = audio_emitter_create();
cap = 120;
grav = 9;
charged = 0;
capGate = 0;
gateOneCap = 30;
gateTwoCap = 60;
gateThreeCap = 90;
image_speed = .25;