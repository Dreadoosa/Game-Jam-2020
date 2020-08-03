/// @description Insert description here
// You can write your code in this editor
active = true;
timer--;
if (timer % 40 == hitFrame) {
instance_destroy();
}
x = objPlayer.x + (32*dir);