/// @description Insert description here
// You can write your code in this editor
if (objPlayer.state == player_states.attacking || 
(!objPlayer.hasKey) &&
(objPlayer.state != player_states.thrusting)

) {
exit;
}
draw_self();