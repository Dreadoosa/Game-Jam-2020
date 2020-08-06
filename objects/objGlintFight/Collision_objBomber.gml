/// @description Insert description here
// You can write your code in this editor
if (abs(other.knockx) > 5 || abs(other.knocky) > 5) {
	instance_destroy(other);
	glintStateChange(glint_states.disabled)
	stateChange = 0;
}