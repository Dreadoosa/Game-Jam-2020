/// @description Insert description here
// You can write your code in this editor
if (disabled) {
draw_sprite_ext(sprite_index,image_number,x + irandom_range(-2,2),y + irandom_range(-2,2),1,1,0,c_white,1);
} else {
draw_sprite_ext(sprite_index,image_number,x,y,1,1,0,c_white,1);
}
draw_healthbar(x-16,y-32,x+32,y-30,(charged/cap) * 100,c_black,c_red,c_red,0,true,true);