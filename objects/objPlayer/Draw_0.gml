/// @description Insert description here
// You can write your code in this editor
draw_self();
if (enemyHeld != undefined) {
	enemyHeld.x = x;
	enemyHeld.y = y-32;
}
switch (state) {
	case player_states.walking:		draw_text(x,y-32,"walking")	  break;
	case player_states.standing:	draw_text(x,y-32,"standing")  break;
	case player_states.inair:		draw_text(x,y-32,"in air")	  break;
	case player_states.attacking:	draw_text(x,y-32,"attacking") break;
	case player_states.thrusting:	draw_text(x,y-32,"thrusting") break;
	case player_states.locked:		draw_text(x,y-32,"locked")	  break;
}