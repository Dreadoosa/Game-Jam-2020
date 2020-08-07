/// @description Insert description here
// You can write your code in this editor
instance_destroy();
if (other.state != player_states.thrusting
 && other.state != player_states.attacking
 && other.state != player_states.locked
 ) {
	 if (other.state == player_states.downed) {
		 objPlayer.downGauge++;
		 audio_sound(sfx_playerhurt);
		 other.hitPoints--;
	 } else {
		 audio_sound(sfx_playerhurt);
		 other.energyGauge-=10;	 
	 }
	with(objPlayer) {
	scrChangeStates(player_states.knockBack)
	}
	other.knockTime = 0;
}