/// @description Insert description here
// You can write your code in this editor
instance_destroy();
if (other.state != player_states.thrusting
 && other.state != player_states.attacking
 && other.state != player_states.locked
 && other.state != player_states.downed
 ) {
	other.state = player_states.knockBack;
	other.knockTime = 0;
}