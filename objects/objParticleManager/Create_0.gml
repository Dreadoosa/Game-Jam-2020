/// @description Insert description here
// You can write your code in this editor
smoke = part_type_create();
part_type_direction(smoke,60,140,0,0)
part_type_speed(smoke,1,1,.25,0);
part_type_sprite(smoke,sprSmoke,true,true,false);
part_type_alpha3(smoke,1,.5,0)
part_type_life(smoke,14,14)
part_type_color2(smoke,c_white,c_black)
partSys = part_system_create();
partSys1 = part_system_create();
part_system_automatic_draw(partSys1,false);