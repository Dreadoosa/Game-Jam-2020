/// @description Insert description here
// You can write your code in this editor
timer--;
if (timer == hitFrame) {
active = true;
} else {
active = false;
}
if (timer == 0) {
instance_destroy()
};
x = objPlayer.x + (32*dir);