/// @description Insert description here
// You can write your code in this editor
if (starting) {
	objPlayer.y = y;
	objPlayer.x = x-32;
	if (capGate == 2) {
		instance_destroy();
		with(objPlayer) {
		scrChangeStates(player_states.inair);
		}
	}
	if (charged < cap && action_script_winding() && action_script_attack()) {
		charged+=5;
	shakex = irandom_range(-5,5)
	shakey = irandom_range(-5,5)
	shakex1= irandom_range(-5,5)
	shakey1 = irandom_range(-5,5)
	
	shakex2 = irandom_range(-5,5)
	shakey2 = irandom_range(-5,5)
	
	shakex3 = irandom_range(-5,5)
	shakey3 = irandom_range(-5,5)
	}
	shakex = scrApproachZero(shakex,1)
	shakey = scrApproachZero(shakey,1)
	
	shakex1 = scrApproachZero(shakex1,1)
	shakey1 = scrApproachZero(shakey1,1)
	
	shakex2 = scrApproachZero(shakex2,1)
	shakey2 = scrApproachZero(shakey2,1)
	
	shakex3 = scrApproachZero(shakex3,1)
	shakey3 = scrApproachZero(shakey3,1)
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