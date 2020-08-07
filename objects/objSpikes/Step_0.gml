/// @description Insert description here
// You can write your code in this editor
timer--;
if (timer >= hitFrame-2 && timer <= hitFrame+2) {
active = true;
} else {
active = false;
}
if (timer == 0) {
instance_destroy()
}