/// @description Insert description here
// You can write your code in this editor
draw_self();

if (enemyHeld != undefined) {
	enemyHeld.x = x;
	enemyHeld.y = y-32;
}
switch (state) {
	case player_states.walking:		draw_text(x,y-32,"walking")	   break;
	case player_states.standing:	draw_text(x,y-32,"standing")   break;
	case player_states.inair:		draw_text(x,y-32,"in air")	   break;
	case player_states.attacking:	draw_text(x,y-32,"attacking")  break;
	case player_states.thrusting:	draw_text(x,y-32,"thrusting")  break;
	case player_states.hanging:	    draw_text(x,y-32,"hanging")	   break;
	case player_states.locked:		draw_text(x,y-32,"locked")	   break;
	case player_states.windingUp:	draw_text(x,y-32,"winding up") break;
	case player_states.swinging:	draw_text(x,y-32,"swinging")   break;
}

if (state == player_states.windingUp) {
	if (gearTwo > 0) {
	draw_healthbar(x-48,y-32,x-16,y-36,gearTwo/100 * 100,c_black,c_red,c_red,1,true,true)
	}
	if (gearOne > 0) {
	draw_healthbar(x+16,y-32,x+48,y-36,gearOne/100 * 100,c_black,c_red,c_red,0,true,true)
	}
}
if (state == player_states.downed) {
	draw_healthbar(x-30,y-32,x+30,y-28,downGauge/100 * 100,c_black,c_red,c_red,0,true,true)

}