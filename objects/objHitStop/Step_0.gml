/// @description Insert description here
// You can write your code in this editor
if (timer > 0) {
	with (all) {
		if (id != other.id) {
			instance_deactivate_object(id);
		}
	}
timer--;
}  else {
instance_destroy();
with (all) {
	instance_activate_all();
}

}