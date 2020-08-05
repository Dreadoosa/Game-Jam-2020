/// @description Insert description here
// You can write your code in this editor
if (starting) {
	if (capGate == 2 && action_script_attack()) {
		room_goto_next()
		objPlayer.state = player_states.standing;
		objPlayer.spd = 1.5;
		exit;
	}
	if (charged < cap && action_script_winding() && action_script_attack()) {
		charged+=5;
	shakex = irandom_range(-5,5)
	shakey = irandom_range(-5,5)
	}
	shakex = scrApproachZero(shakex,1)
	shakey = scrApproachZero(shakey,1)
	if (!action_script_winding()) {
		if (charged  > 0) {
			charged--;
		}
	}
	if (charged >= cap && action_script_attack()) {
	capGate++;
	cap -= 30;
	charged = 0;
	}
}